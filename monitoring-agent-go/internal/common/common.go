package common

const (
	SENSOR_NONE  int = 0
	SENSOR_LIGHT int = 1 << iota
	SENSOR_TEMP
	SENSOR_SOIL_MOIST
)

const (
	ACT_NONE  int = 0
	ACT_LIGHT int = 1 << iota
)

const (
	DEV_REGISTER int = 1
	DEV_DROP     int = 2
	DEV_CLEAR    int = 3
)

const (
	RBD_AGGR_SUFFIX  string = "_comp"
	RBD_ACT_SUFFIX   string = "_a"
	RBD_TEMP_SUFFIX  string = "_temp"
	RBD_SOIL_SUFFIX  string = "_sm"
	RBD_LIGHT_SUFFIX string = "_light"
)

type DeviceInfo struct {
	Ieee_addr     string
	Friendly_name string
	Sensors       int
	Actuators     int
	Dev_action    int
}

type Control struct {
	Parent chan int
	Child  chan int
}
type Device struct {
	Ieee_addr     string
	Friendly_name string
	Sensors       int
	Actuators     int
}
