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

func MakeDevAction(dev common.Device, action int) common.DeviceInfo {
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

func CreateDeviceSeries(device common.Device, rdb *redis.Client) {
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

func WriteToDb(rdb *redis.Client, key string, value float64) bool {
	repl := rdb.TSAdd(context.Background(), key, "*", value)
	if repl.Err() != nil {
		log.Println(repl.Err())
		return false
	}
	return true
}

func ParseWriteSensorMessage(rdb *redis.Client, dev common.Device, msg map[string]interface{}) {

	if dev.Sensors&common.SENSOR_TEMP != 0 {
		WriteToDb(rdb,
			dev.Ieee_addr+common.RBD_TEMP_SUFFIX,
			msg["temperature"].(float64),
		)
	}
	if dev.Sensors&common.SENSOR_LIGHT != 0 {
		WriteToDb(rdb,
			dev.Ieee_addr+common.RBD_LIGHT_SUFFIX,
			msg["light_intensity"].(float64),
		)
	}
	if dev.Sensors&common.SENSOR_SOIL_MOIST != 0 {
		WriteToDb(rdb,
			dev.Ieee_addr+common.RBD_SOIL_SUFFIX,
			msg["soil_moisture"].(float64),
		)
	}
}

func SubToDevice(mbroker mqtt.Client, dev common.Device, rdb *redis.Client) bool {

	mh := func(c mqtt.Client, m mqtt.Message) {
		log.Println("Got reading")
		var msgobj map[string]interface{}
		json.Unmarshal(m.Payload(), &msgobj)
		ParseWriteSensorMessage(rdb, dev, msgobj)
	}

	token := mbroker.Subscribe("zigbee2mqtt/"+dev.Friendly_name, 1, mh)
	token.WaitTimeout(1 * time.Second)
	return token.Error() != nil
	// if token.Error() != nil {
	// 	return false
	// }
	// return true
}

func Listener_routine(mbroker mqtt.Client, rdb *redis.Client, dev_ch chan<- []common.Device, ctrl *common.Control) {

	def_timeout := 2 * time.Second

	//get existing devices on network

	cb_f := func(_ mqtt.Client, m mqtt.Message) {
		log.Println("Recvd dev msg")
		var dev_msg []interface{}
		if err := json.Unmarshal(m.Payload(), &dev_msg); err != nil {
			log.Printf("%v\n", err)
			ctrl.Child <- 1
			return
		}

		devices := []common.Device{}

		for _, v := range dev_msg {
			val := v.(map[string]interface{})

			log.Printf("%v\n", val["definition"])

			definition := val["definition"]

			if definition == nil {
				continue
			}

			exposes_uncast := definition.(map[string]interface{})["exposes"]

			if exposes_uncast == nil {
				continue
			}

			exposes := exposes_uncast.([]interface{})

			sens, act := parseDevExposes(exposes)

			var fr_name string

			if val["friendly_name"] == nil {
				fr_name = val["ieee_address"].(string)
			} else {
				fr_name = val["friendly_name"].(string)
			}

			dev_info := common.Device{
				Ieee_addr:     val["ieee_address"].(string),
				Friendly_name: fr_name,
				Sensors:       sens,
				Actuators:     act,
			}

			devices = append(devices, dev_info)
		}

		for _, d := range devices {
			CreateDeviceSeries(d, rdb)
			SubToDevice(mbroker, d, rdb)
		}
		dev_ch <- devices

		log.Printf("Devices: %v\n", devices)
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

	tmp := make(<-chan int)

main_loop:
	for {
		select {
		case <-ctrl.Parent:
			// We're shutting down
			break main_loop
		case <-tmp:
			//nop
		}
	}
	//main handles connections

	ctrl.Child <- 1

}
