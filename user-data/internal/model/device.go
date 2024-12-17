package model

type Device struct {
	ID   string
	Type DeviceType
}

type DeviceType int

const (
	SoilMoistureSensor DeviceType = 0
	TemperatureSensor  DeviceType = 1
	LightSensor        DeviceType = 2
	Actuator           DeviceType = 3
)

func (d DeviceType) ToString() DeviceTypeString {
	switch d {
	case SoilMoistureSensor:
		return SoilMoistureSensorString
	case TemperatureSensor:
		return TemperatureSensorString
	case LightSensor:
		return LightSensorString
	case Actuator:
		return ActuatorString
	default:
		return ""
	}
}

type DeviceTypeString string

const (
	SoilMoistureSensorString DeviceTypeString = "soil_moisture_sensor"
	TemperatureSensorString  DeviceTypeString = "temperature_sensor"
	LightSensorString        DeviceTypeString = "light_sensor"
	ActuatorString           DeviceTypeString = "actuator"
)

func DeviceTypeFromString(s string) DeviceType {
	switch s {
	case "soil_moisture_sensor":
		return SoilMoistureSensor
	case "temperature_sensor":
		return TemperatureSensor
	case "light_sensor":
		return LightSensor
	case "actuator":
		return Actuator
	default:
		panic("invalid device type")
	}
}
