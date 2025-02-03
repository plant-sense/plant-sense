package service

import (
	"context"
	"fmt"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
)

const (
	tempID      = "temperature_id"
	smID        = "soil_moisture_id"
	lightID     = "light_intensity_id"
	lightbulbID = "light_bulb_id"
)

var _ pb.DeviceServiceServer = &deviceService{}

var devices = []*pb.Device{
	{
		Id:   smID,
		Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_SOIL_HUMIDITY}},
	},
	{
		Id:   tempID,
		Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_TEMPERATURE}},
	},
	{
		Id:   tempID + tempID,
		Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_TEMPERATURE}},
	},
	{
		Id:   lightID,
		Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_LIGHT}},
	},
	{
		Id:   lightbulbID,
		Type: &pb.DeviceType{Type: &pb.DeviceType_Actuator{Actuator: pb.ActuatorKind_ACTUATOR_KIND_LIGHT}},
	},
}

type deviceService struct {
	pb.UnimplementedDeviceServiceServer
}

// GetDevice implements pb.DeviceServiceServer.
func (d *deviceService) GetDevice(ctx context.Context, req *pb.GetDeviceRequest) (*pb.Device, error) {
	for _, device := range devices {
		if device.Id == req.DeviceId {
			return device, nil
		}
	}
	return nil, nil
}

// ListDevices implements pb.DeviceServiceServer.
func (d *deviceService) ListDevices(context.Context, *pb.ListDevicesRequest) (*pb.ListDevicesResponse, error) {
	fmt.Printf("ListDevices called, %d\n", len(devices))
	return &pb.ListDevicesResponse{Devices: devices}, nil
}

func NewDeviceService() pb.DeviceServiceServer {
	return &deviceService{}
}
