package pbservice

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"monitoring-agent/internal/gen/pb"
	"strconv"
	"time"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"google.golang.org/grpc"
)

var _ pb.ActuatorServiceServer = &actuatorService{}

type actuatorService struct {
	client mqtt.Client
	pb.UnimplementedActuatorServiceServer
}

// GetState implements pb.ActuatorServiceServer.
func (a *actuatorService) GetState(c context.Context, asr *pb.GetActuatorStateRequest) (*pb.ActuatorState, error) {
	state_topic := "zigbee2mqtt/"
	get_suffix := "/get"
	get_payload := "{\"state\":\"\"}"

	//subscribe to requested actuator

	type state_data struct {
		State      string `json:"state"`
		Brightness string `json:"brightness"`
	}

	state_channel := make(chan state_data)

	var callback mqtt.MessageHandler = func(c mqtt.Client, m mqtt.Message) {
		var data state_data
		json.Unmarshal(m.Payload(), &data)

		state_channel <- data

		c.Unsubscribe(state_topic + asr.GetDeviceId())
	}

	token := a.client.Subscribe(state_topic+asr.GetDeviceId(), 1, callback)

	if !token.WaitTimeout(time.Second * 1) {
		if token.Error() != nil {
			return nil, token.Error()
		}
		return nil, errors.New("subscribe timeout")
	}

	token = a.client.Publish(state_topic+asr.GetDeviceId()+get_suffix, 1, false, get_payload)

	if !token.WaitTimeout(time.Second * 1) {
		if token.Error() != nil {
			return nil, token.Error()
		}
		return nil, errors.New("publish timeout")
	}

	timeout := make(chan bool, 1)

	go func() {
		time.Sleep(time.Second * 1)
		timeout <- true
	}()

	select {
	case val := <-state_channel:
		var state bool

		if val.State == "ON" {
			state = true
		} else if val.State == "OFF" {
			state = false
		} else {
			return nil, errors.New("unknown response")
		}

		var brightness float64
		c, err := strconv.Atoi(val.Brightness)

		if err != nil {
			c = 0
		}

		brightness = float64(c) / 254

		return &pb.ActuatorState{
			DeviceId:  asr.GetDeviceId(),
			State:     state,
			Intensity: &brightness,
		}, nil

	case <-timeout:
		a.client.Unsubscribe(state_topic + asr.GetDeviceId())
		return nil, errors.New("response timeout")
	}

}

// SetState implements pb.ActuatorServiceServer.
func (a *actuatorService) SetState(c context.Context, asr *pb.SetActuatorStateRequest) (*pb.ActuatorState, error) {
	state_topic := "zigbee2mqtt/"
	set_suffix := "/set"

	var state_string string

	if asr.State {
		state_string = "ON"
	} else {
		state_string = "OFF"
	}

	brightness := int(asr.GetIntensity() * 254)

	payload := fmt.Sprintf("{\"state\": \"%s\", \"brightness\": %d}", state_string, brightness)

	token := a.client.Publish(state_topic+asr.GetDeviceId()+set_suffix, 1, false, payload)

	token.WaitTimeout(time.Second * 1)

	state, err := a.GetState(c, &pb.GetActuatorStateRequest{
		DeviceId: asr.GetDeviceId(),
	})

	if err != nil {
		return nil, err
	}

	intense := state.GetIntensity()

	return &pb.ActuatorState{
		DeviceId:  state.GetDeviceId(),
		State:     state.GetState(),
		Intensity: &intense,
	}, nil

}

// StreamState implements pb.ActuatorServiceServer.
func (a *actuatorService) StreamState(*pb.GetActuatorStateRequest, grpc.ServerStreamingServer[pb.ActuatorState]) error {
	// ??
	panic("unimplemented")
}

func NewActuatorService(mqtt_client mqtt.Client) pb.ActuatorServiceServer {
	return &actuatorService{client: mqtt_client}
}
