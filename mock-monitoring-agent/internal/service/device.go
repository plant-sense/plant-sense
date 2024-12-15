package service

import (
	"context"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
)

const (
	tempId = "temp"
	sm     = "sm"
)

var _ pb.DeviceServiceServer = &deviceService{}

type deviceService struct {
	pb.UnimplementedDeviceServiceServer
}

// GetDevice implements pb.DeviceServiceServer.
func (d *deviceService) GetDevice(context.Context, *pb.GetDeviceRequest) (*pb.Device, error) {
	panic("unimplemented")
}

// ListDevices implements pb.DeviceServiceServer.
func (d *deviceService) ListDevices(context.Context, *pb.ListDevicesRequest) (*pb.ListDevicesResponse, error) {
	devices := []*pb.Device{
		&pb.Device{
			Id:   sm,
			Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_SOIL_HUMIDITY}},
		},
		&pb.Device{
			Id:   tempId,
			Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_TEMPERATURE}},
		},
	}
	return &pb.ListDevicesResponse{Devices: devices}, nil
}

func NewDeviceService() pb.DeviceServiceServer {
	return &deviceService{}
}
