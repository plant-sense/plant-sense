package service

import (
	"context"
	"strings"

	"github.com/plant-sense/monitoring-agent-reader/internal/gen/pb"
	"github.com/redis/go-redis/v9"
)

var _ pb.DeviceServiceServer = &deviceService{}

type deviceService struct {
	redisClient *redis.Client
	pb.UnimplementedDeviceServiceServer
}

// GetDevice implements pb.DeviceServiceServer.
func (d *deviceService) GetDevice(context.Context, *pb.GetDeviceRequest) (*pb.Device, error) {
	panic("unimplemented")
}

// ListDevices implements pb.DeviceServiceServer.
func (d *deviceService) ListDevices(context.Context, *pb.ListDevicesRequest) (*pb.ListDevicesResponse, error) {
	keys := d.redisClient.Keys(context.Background(), "*")

	devices := []*pb.Device{}
	for _, key := range keys.Val() {
		device := pb.Device{
			Id: key,
		}
		if strings.HasSuffix(key, "_sm_comp") {
			device.Type = &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_SOIL_HUMIDITY}}
		} else if strings.HasSuffix(key, "_temp_comp") {
			device.Type = &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: pb.SensorKind_SENSOR_KIND_TEMPERATURE}}
		}
		devices = append(devices, &device)
	}

	return &pb.ListDevicesResponse{Devices: devices}, nil
}

func NewDeviceService(redisClient *redis.Client) pb.DeviceServiceServer {
	return &deviceService{redisClient: redisClient}
}
