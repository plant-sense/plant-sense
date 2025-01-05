package listener

import (
	"context"
	"encoding/json"
	"log"
	"monitoring-agent/internal/common"
	"strings"
	"time"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"github.com/redis/go-redis/v9"
)

type Device struct {
	Ieee_addr     string
	Friendly_name string
	Sensors       int
	Actuators     int
}

func MakeDevAction(dev Device, action int) common.DeviceInfo {
	return common.DeviceInfo{
		Ieee_addr:     dev.Ieee_addr,
		Friendly_name: dev.Friendly_name,
		Sensors:       dev.Sensors,
		Actuators:     dev.Actuators,
		Dev_action:    action,
	}
}

func parseDevExposes(data []interface{}) (sensors int, actuators int) {
	sensors = common.SENSOR_NONE
	actuators = common.ACT_NONE
	for _, e := range data {
		prop := e.(map[string]interface{})["property"].(string)
		switch {
		case prop == "temperature":
			sensors |= common.SENSOR_TEMP
		case prop == "soil_moisture":
			sensors |= common.SENSOR_SOIL_MOIST
		case prop == "light_intensity":
			sensors |= common.SENSOR_LIGHT
		case prop == "light":
			actuators |= common.ACT_LIGHT
		}
	}
	return
}

func CreateAggregation(rdb *redis.Client, basename string) bool {
	if !common.RedisCreateObject(rdb, basename+common.RBD_AGGR_SUFFIX) {
		return false
	}
	resp := rdb.TSCreateRule(context.Background(), basename, basename+common.RBD_AGGR_SUFFIX, redis.Avg, 1000)
	if resp.Err() != nil && !strings.HasSuffix(resp.Err().Error(), "the destination key already has a src rule") {
		log.Println(resp.Err())
		return false
	}
	return true
}

func CreateDeviceSeries(device Device, rdb *redis.Client) {
	if device.Sensors&common.SENSOR_TEMP != 0 {
		common.RedisCreateObject(rdb, device.Ieee_addr+common.RBD_TEMP_SUFFIX)
		CreateAggregation(rdb, device.Ieee_addr+common.RBD_TEMP_SUFFIX)
	}
	if device.Sensors&common.SENSOR_LIGHT != 0 {
		common.RedisCreateObject(rdb, device.Ieee_addr+common.RBD_LIGHT_SUFFIX)
		CreateAggregation(rdb, device.Ieee_addr+common.RBD_LIGHT_SUFFIX)
	}
	if device.Sensors&common.SENSOR_SOIL_MOIST != 0 {
		common.RedisCreateObject(rdb, device.Ieee_addr+common.RBD_TEMP_SUFFIX)
		CreateAggregation(rdb, device.Ieee_addr+common.RBD_TEMP_SUFFIX)
	}
}

func WriteToDb() {

}

func SubToDevice(mbroker mqtt.Client, dev Device) bool {

	mh := func(c mqtt.Client, m mqtt.Message) {

	}

	mbroker.Subscribe("zigbee2mqtt/"+dev.Friendly_name, 1)

	mbroker
}

func Listener_routine(mbroker mqtt.Client, rdb *redis.Client, dev_ch chan<- common.DeviceInfo, ctrl *common.Control) {

	def_timeout := 2 * time.Second

	//get existing devices on network

	var dev_msg []interface{}

	cb_ch := make(chan []byte)

	cb_f := func(_ mqtt.Client, m mqtt.Message) {
		cb_ch <- m.Payload()
	}

	token := mbroker.Subscribe("zigbee2mqtt/bridge/devices", 2, cb_f)

	if !token.WaitTimeout(def_timeout) {
		if token.Error() != nil {
			log.Println(token.Error())
		} else {
			log.Panicln("mqtt timeout")
		}
		ctrl.Child <- 1
		return
	}

	device_msg_bytes := <-cb_ch

	if err := json.Unmarshal(device_msg_bytes, &dev_msg); err != nil {
		log.Println(err)
		ctrl.Child <- 1
		return
	}

	devices := []Device{}

	for _, v := range dev_msg {
		val := v.(map[string]interface{})

		exposes := val["definition"].(map[string]interface{})["exposes"].([]interface{})

		sens, act := parseDevExposes(exposes)

		dev_info := Device{
			Ieee_addr:     val["ieee_address"].(string),
			Friendly_name: val["friendly_name"].(string),
			Sensors:       sens,
			Actuators:     act,
		}

		devices = append(devices, dev_info)
	}

	for _, d := range devices {
		CreateDeviceSeries(d, rdb)
		dev_ch <- MakeDevAction(d, common.DEV_REGISTER)
	}

main_loop:
	for {
		select {
		case <-ctrl.Parent:
			// We're shutting down
			break main_loop
		default: //pass
		}

	}

	//main handles connections

	ctrl.Child <- 1

	return

}
