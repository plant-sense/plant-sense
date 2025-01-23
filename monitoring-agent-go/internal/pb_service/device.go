package pbservice

import (
	"context"
	"monitoring-agent/internal/common"
	"monitoring-agent/internal/gen/pb"
)

var _ pb.DeviceServiceServer = &deviceService{}

type deviceService struct {
	devices *[]common.Device
	pb.UnimplementedDeviceServiceServer
}

// GetDevice implements pb.DeviceServiceServer.
func (d *deviceService) GetDevice(context.Context, *pb.GetDeviceRequest) (*pb.Device, error) {
	panic("unimplemented") //unused
}

const (
	IS_SENSOR   int = 0
	IS_ACTUATOR int = 1
)

func constructPbSensor(checkflag int, dev common.Device, suffix string, sensorType pb.SensorKind) *pb.Device {
	if dev.Sensors&checkflag != 0 {
		dev_cap := pb.Device{
			Id:   dev.Ieee_addr + suffix,
			Type: &pb.DeviceType{Type: &pb.DeviceType_Sensor{Sensor: sensorType}},
		}
		return &dev_cap
	}
	return nil
}

func constructPbActuator(checkflag int, dev common.Device, suffix string, actuatorType pb.ActuatorKind) *pb.Device {
	if dev.Sensors&checkflag != 0 {
		dev_cap := pb.Device{
			Id:   dev.Ieee_addr + suffix,
			Type: &pb.DeviceType{Type: &pb.DeviceType_Actuator{Actuator: actuatorType}},
		}
		return &dev_cap
	}
	return nil
}

// ListDevices implements pb.DeviceServiceServer.
func (d *deviceService) ListDevices(context.Context, *pb.ListDevicesRequest) (*pb.ListDevicesResponse, error) {

	dev_resp := []*pb.Device{}

	for _, dev := range *d.devices {

		if sens := constructPbSensor(common.SENSOR_LIGHT, dev, common.RBD_LIGHT_SUFFIX+common.RBD_AGGR_SUFFIX, pb.SensorKind_SENSOR_KIND_LIGHT); sens != nil {
			dev_resp = append(dev_resp, sens)
		}
		if sens := constructPbSensor(common.SENSOR_SOIL_MOIST, dev, common.RBD_SOIL_SUFFIX+common.RBD_AGGR_SUFFIX, pb.SensorKind_SENSOR_KIND_SOIL_HUMIDITY); sens != nil {
			dev_resp = append(dev_resp, sens)
		}
		if sens := constructPbSensor(common.SENSOR_TEMP, dev, common.RBD_TEMP_SUFFIX+common.RBD_AGGR_SUFFIX, pb.SensorKind_SENSOR_KIND_TEMPERATURE); sens != nil {
			dev_resp = append(dev_resp, sens)
		}
		if act := constructPbActuator(common.ACT_LIGHT, dev, common.RBD_ACT_SUFFIX+common.RBD_LIGHT_SUFFIX, pb.ActuatorKind_ACTUATOR_KIND_LIGHT); act != nil {
			dev_resp = append(dev_resp, act)
		}
	}

	return &pb.ListDevicesResponse{Devices: dev_resp}, nil
}

func NewDeviceService(devices *[]common.Device) pb.DeviceServiceServer {
	return &deviceService{devices: devices}
}
