package service

import (
	"context"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
)

const (
	tempID  = "temperature_id"
	smID    = "soil_moisture_id"
	lightID = "light_intensity_id"
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
	// {
	// 	Id:   lightID,
	// 	Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_LIGHT}},
	// },
}

type deviceService struct {
	pb.UnimplementedDeviceServiceServer
}

// GetDevice implements pb.DeviceServiceServer.
func (d *deviceService) GetDevice(ctx context.Context, req *pb.GetDeviceRequest) (*pb.Device, error) {
	if req.DeviceId == tempID {
		return devices[1], nil
	}
	if req.DeviceId == smID {
		return devices[0], nil
	}
	if req.DeviceId == lightID {
		return devices[2], nil
	}
	return nil, nil
}

// ListDevices implements pb.DeviceServiceServer.
func (d *deviceService) ListDevices(context.Context, *pb.ListDevicesRequest) (*pb.ListDevicesResponse, error) {
	return &pb.ListDevicesResponse{Devices: devices}, nil
}

func NewDeviceService() pb.DeviceServiceServer {
	return &deviceService{}
}
