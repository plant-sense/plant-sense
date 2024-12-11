// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.27.1
// 	protoc        v5.28.3
// source: devices.proto

package pb

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type DeviceStatus int32

const (
	DeviceStatus_DEVICE_STATUS_UNSPECIFIED DeviceStatus = 0
	DeviceStatus_DEVICE_STATUS_ONLINE      DeviceStatus = 1
	DeviceStatus_DEVICE_STATUS_OFFLINE     DeviceStatus = 2
	DeviceStatus_DEVICE_STATUS_ERROR       DeviceStatus = 3
)

// Enum value maps for DeviceStatus.
var (
	DeviceStatus_name = map[int32]string{
		0: "DEVICE_STATUS_UNSPECIFIED",
		1: "DEVICE_STATUS_ONLINE",
		2: "DEVICE_STATUS_OFFLINE",
		3: "DEVICE_STATUS_ERROR",
	}
	DeviceStatus_value = map[string]int32{
		"DEVICE_STATUS_UNSPECIFIED": 0,
		"DEVICE_STATUS_ONLINE":      1,
		"DEVICE_STATUS_OFFLINE":     2,
		"DEVICE_STATUS_ERROR":       3,
	}
)

func (x DeviceStatus) Enum() *DeviceStatus {
	p := new(DeviceStatus)
	*p = x
	return p
}

func (x DeviceStatus) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (DeviceStatus) Descriptor() protoreflect.EnumDescriptor {
	return file_devices_proto_enumTypes[0].Descriptor()
}

func (DeviceStatus) Type() protoreflect.EnumType {
	return &file_devices_proto_enumTypes[0]
}

func (x DeviceStatus) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use DeviceStatus.Descriptor instead.
func (DeviceStatus) EnumDescriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{0}
}

type SensorKind int32

const (
	SensorKind_SENSOR_KIND_UNSPECIFIED   SensorKind = 0
	SensorKind_SENSOR_KIND_TEMPERATURE   SensorKind = 1
	SensorKind_SENSOR_KIND_SOIL_HUMIDITY SensorKind = 2
	SensorKind_SENSOR_KIND_LIGHT         SensorKind = 3
)

// Enum value maps for SensorKind.
var (
	SensorKind_name = map[int32]string{
		0: "SENSOR_KIND_UNSPECIFIED",
		1: "SENSOR_KIND_TEMPERATURE",
		2: "SENSOR_KIND_SOIL_HUMIDITY",
		3: "SENSOR_KIND_LIGHT",
	}
	SensorKind_value = map[string]int32{
		"SENSOR_KIND_UNSPECIFIED":   0,
		"SENSOR_KIND_TEMPERATURE":   1,
		"SENSOR_KIND_SOIL_HUMIDITY": 2,
		"SENSOR_KIND_LIGHT":         3,
	}
)

func (x SensorKind) Enum() *SensorKind {
	p := new(SensorKind)
	*p = x
	return p
}

func (x SensorKind) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (SensorKind) Descriptor() protoreflect.EnumDescriptor {
	return file_devices_proto_enumTypes[1].Descriptor()
}

func (SensorKind) Type() protoreflect.EnumType {
	return &file_devices_proto_enumTypes[1]
}

func (x SensorKind) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use SensorKind.Descriptor instead.
func (SensorKind) EnumDescriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{1}
}

type ActuatorKind int32

const (
	ActuatorKind_ACTUATOR_KIND_UNSPECIFIED ActuatorKind = 0
	ActuatorKind_ACTUATOR_KIND_LIGHT       ActuatorKind = 1
	ActuatorKind_ACTUATOR_KIND_OUTLET      ActuatorKind = 2
	ActuatorKind_ACTUATOR_KIND_IRRIGATION  ActuatorKind = 3
)

// Enum value maps for ActuatorKind.
var (
	ActuatorKind_name = map[int32]string{
		0: "ACTUATOR_KIND_UNSPECIFIED",
		1: "ACTUATOR_KIND_LIGHT",
		2: "ACTUATOR_KIND_OUTLET",
		3: "ACTUATOR_KIND_IRRIGATION",
	}
	ActuatorKind_value = map[string]int32{
		"ACTUATOR_KIND_UNSPECIFIED": 0,
		"ACTUATOR_KIND_LIGHT":       1,
		"ACTUATOR_KIND_OUTLET":      2,
		"ACTUATOR_KIND_IRRIGATION":  3,
	}
)

func (x ActuatorKind) Enum() *ActuatorKind {
	p := new(ActuatorKind)
	*p = x
	return p
}

func (x ActuatorKind) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (ActuatorKind) Descriptor() protoreflect.EnumDescriptor {
	return file_devices_proto_enumTypes[2].Descriptor()
}

func (ActuatorKind) Type() protoreflect.EnumType {
	return &file_devices_proto_enumTypes[2]
}

func (x ActuatorKind) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use ActuatorKind.Descriptor instead.
func (ActuatorKind) EnumDescriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{2}
}

type Device struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id     string       `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Status DeviceStatus `protobuf:"varint,2,opt,name=status,proto3,enum=plant_sense.internal.DeviceStatus" json:"status,omitempty"`
	Type   *DeviceType  `protobuf:"bytes,3,opt,name=type,proto3" json:"type,omitempty"`
}

func (x *Device) Reset() {
	*x = Device{}
	if protoimpl.UnsafeEnabled {
		mi := &file_devices_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Device) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Device) ProtoMessage() {}

func (x *Device) ProtoReflect() protoreflect.Message {
	mi := &file_devices_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Device.ProtoReflect.Descriptor instead.
func (*Device) Descriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{0}
}

func (x *Device) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *Device) GetStatus() DeviceStatus {
	if x != nil {
		return x.Status
	}
	return DeviceStatus_DEVICE_STATUS_UNSPECIFIED
}

func (x *Device) GetType() *DeviceType {
	if x != nil {
		return x.Type
	}
	return nil
}

type DeviceType struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// Types that are assignable to Type:
	//	*DeviceType_Sensor
	//	*DeviceType_Actuator
	Type isDeviceType_Type `protobuf_oneof:"type"`
}

func (x *DeviceType) Reset() {
	*x = DeviceType{}
	if protoimpl.UnsafeEnabled {
		mi := &file_devices_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeviceType) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeviceType) ProtoMessage() {}

func (x *DeviceType) ProtoReflect() protoreflect.Message {
	mi := &file_devices_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeviceType.ProtoReflect.Descriptor instead.
func (*DeviceType) Descriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{1}
}

func (m *DeviceType) GetType() isDeviceType_Type {
	if m != nil {
		return m.Type
	}
	return nil
}

func (x *DeviceType) GetSensor() SensorKind {
	if x, ok := x.GetType().(*DeviceType_Sensor); ok {
		return x.Sensor
	}
	return SensorKind_SENSOR_KIND_UNSPECIFIED
}

func (x *DeviceType) GetActuator() ActuatorKind {
	if x, ok := x.GetType().(*DeviceType_Actuator); ok {
		return x.Actuator
	}
	return ActuatorKind_ACTUATOR_KIND_UNSPECIFIED
}

type isDeviceType_Type interface {
	isDeviceType_Type()
}

type DeviceType_Sensor struct {
	Sensor SensorKind `protobuf:"varint,1,opt,name=sensor,proto3,enum=plant_sense.internal.SensorKind,oneof"`
}

type DeviceType_Actuator struct {
	Actuator ActuatorKind `protobuf:"varint,2,opt,name=actuator,proto3,enum=plant_sense.internal.ActuatorKind,oneof"`
}

func (*DeviceType_Sensor) isDeviceType_Type() {}

func (*DeviceType_Actuator) isDeviceType_Type() {}

type GetDeviceRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DeviceId string `protobuf:"bytes,1,opt,name=device_id,json=deviceId,proto3" json:"device_id,omitempty"`
}

func (x *GetDeviceRequest) Reset() {
	*x = GetDeviceRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_devices_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetDeviceRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetDeviceRequest) ProtoMessage() {}

func (x *GetDeviceRequest) ProtoReflect() protoreflect.Message {
	mi := &file_devices_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetDeviceRequest.ProtoReflect.Descriptor instead.
func (*GetDeviceRequest) Descriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{2}
}

func (x *GetDeviceRequest) GetDeviceId() string {
	if x != nil {
		return x.DeviceId
	}
	return ""
}

type ListDevicesRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *ListDevicesRequest) Reset() {
	*x = ListDevicesRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_devices_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ListDevicesRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ListDevicesRequest) ProtoMessage() {}

func (x *ListDevicesRequest) ProtoReflect() protoreflect.Message {
	mi := &file_devices_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ListDevicesRequest.ProtoReflect.Descriptor instead.
func (*ListDevicesRequest) Descriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{3}
}

type ListDevicesResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Devices []*Device `protobuf:"bytes,1,rep,name=devices,proto3" json:"devices,omitempty"`
}

func (x *ListDevicesResponse) Reset() {
	*x = ListDevicesResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_devices_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ListDevicesResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ListDevicesResponse) ProtoMessage() {}

func (x *ListDevicesResponse) ProtoReflect() protoreflect.Message {
	mi := &file_devices_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ListDevicesResponse.ProtoReflect.Descriptor instead.
func (*ListDevicesResponse) Descriptor() ([]byte, []int) {
	return file_devices_proto_rawDescGZIP(), []int{4}
}

func (x *ListDevicesResponse) GetDevices() []*Device {
	if x != nil {
		return x.Devices
	}
	return nil
}

var File_devices_proto protoreflect.FileDescriptor

var file_devices_proto_rawDesc = []byte{
	0x0a, 0x0d, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12,
	0x14, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74,
	0x65, 0x72, 0x6e, 0x61, 0x6c, 0x22, 0x8a, 0x01, 0x0a, 0x06, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65,
	0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64,
	0x12, 0x3a, 0x0a, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0e,
	0x32, 0x22, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69,
	0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x53, 0x74,
	0x61, 0x74, 0x75, 0x73, 0x52, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x34, 0x0a, 0x04,
	0x74, 0x79, 0x70, 0x65, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x20, 0x2e, 0x70, 0x6c, 0x61,
	0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61,
	0x6c, 0x2e, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x54, 0x79, 0x70, 0x65, 0x52, 0x04, 0x74, 0x79,
	0x70, 0x65, 0x22, 0x92, 0x01, 0x0a, 0x0a, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x54, 0x79, 0x70,
	0x65, 0x12, 0x3a, 0x0a, 0x06, 0x73, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x0e, 0x32, 0x20, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e,
	0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x4b,
	0x69, 0x6e, 0x64, 0x48, 0x00, 0x52, 0x06, 0x73, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x12, 0x40, 0x0a,
	0x08, 0x61, 0x63, 0x74, 0x75, 0x61, 0x74, 0x6f, 0x72, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0e, 0x32,
	0x22, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e,
	0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x41, 0x63, 0x74, 0x75, 0x61, 0x74, 0x6f, 0x72, 0x4b,
	0x69, 0x6e, 0x64, 0x48, 0x00, 0x52, 0x08, 0x61, 0x63, 0x74, 0x75, 0x61, 0x74, 0x6f, 0x72, 0x42,
	0x06, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x22, 0x2f, 0x0a, 0x10, 0x47, 0x65, 0x74, 0x44, 0x65,
	0x76, 0x69, 0x63, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1b, 0x0a, 0x09, 0x64,
	0x65, 0x76, 0x69, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08,
	0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x49, 0x64, 0x22, 0x14, 0x0a, 0x12, 0x4c, 0x69, 0x73, 0x74,
	0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x22, 0x4d,
	0x0a, 0x13, 0x4c, 0x69, 0x73, 0x74, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x52, 0x65, 0x73,
	0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x36, 0x0a, 0x07, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73,
	0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x1c, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73,
	0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x44, 0x65,
	0x76, 0x69, 0x63, 0x65, 0x52, 0x07, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x2a, 0x7b, 0x0a,
	0x0c, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x1d, 0x0a,
	0x19, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x53, 0x54, 0x41, 0x54, 0x55, 0x53, 0x5f, 0x55,
	0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x18, 0x0a, 0x14,
	0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x53, 0x54, 0x41, 0x54, 0x55, 0x53, 0x5f, 0x4f, 0x4e,
	0x4c, 0x49, 0x4e, 0x45, 0x10, 0x01, 0x12, 0x19, 0x0a, 0x15, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45,
	0x5f, 0x53, 0x54, 0x41, 0x54, 0x55, 0x53, 0x5f, 0x4f, 0x46, 0x46, 0x4c, 0x49, 0x4e, 0x45, 0x10,
	0x02, 0x12, 0x17, 0x0a, 0x13, 0x44, 0x45, 0x56, 0x49, 0x43, 0x45, 0x5f, 0x53, 0x54, 0x41, 0x54,
	0x55, 0x53, 0x5f, 0x45, 0x52, 0x52, 0x4f, 0x52, 0x10, 0x03, 0x2a, 0x7c, 0x0a, 0x0a, 0x53, 0x65,
	0x6e, 0x73, 0x6f, 0x72, 0x4b, 0x69, 0x6e, 0x64, 0x12, 0x1b, 0x0a, 0x17, 0x53, 0x45, 0x4e, 0x53,
	0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e, 0x44, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43, 0x49, 0x46,
	0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x1b, 0x0a, 0x17, 0x53, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x5f,
	0x4b, 0x49, 0x4e, 0x44, 0x5f, 0x54, 0x45, 0x4d, 0x50, 0x45, 0x52, 0x41, 0x54, 0x55, 0x52, 0x45,
	0x10, 0x01, 0x12, 0x1d, 0x0a, 0x19, 0x53, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e,
	0x44, 0x5f, 0x53, 0x4f, 0x49, 0x4c, 0x5f, 0x48, 0x55, 0x4d, 0x49, 0x44, 0x49, 0x54, 0x59, 0x10,
	0x02, 0x12, 0x15, 0x0a, 0x11, 0x53, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e, 0x44,
	0x5f, 0x4c, 0x49, 0x47, 0x48, 0x54, 0x10, 0x03, 0x2a, 0x7e, 0x0a, 0x0c, 0x41, 0x63, 0x74, 0x75,
	0x61, 0x74, 0x6f, 0x72, 0x4b, 0x69, 0x6e, 0x64, 0x12, 0x1d, 0x0a, 0x19, 0x41, 0x43, 0x54, 0x55,
	0x41, 0x54, 0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e, 0x44, 0x5f, 0x55, 0x4e, 0x53, 0x50, 0x45, 0x43,
	0x49, 0x46, 0x49, 0x45, 0x44, 0x10, 0x00, 0x12, 0x17, 0x0a, 0x13, 0x41, 0x43, 0x54, 0x55, 0x41,
	0x54, 0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e, 0x44, 0x5f, 0x4c, 0x49, 0x47, 0x48, 0x54, 0x10, 0x01,
	0x12, 0x18, 0x0a, 0x14, 0x41, 0x43, 0x54, 0x55, 0x41, 0x54, 0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e,
	0x44, 0x5f, 0x4f, 0x55, 0x54, 0x4c, 0x45, 0x54, 0x10, 0x02, 0x12, 0x1c, 0x0a, 0x18, 0x41, 0x43,
	0x54, 0x55, 0x41, 0x54, 0x4f, 0x52, 0x5f, 0x4b, 0x49, 0x4e, 0x44, 0x5f, 0x49, 0x52, 0x52, 0x49,
	0x47, 0x41, 0x54, 0x49, 0x4f, 0x4e, 0x10, 0x03, 0x32, 0xc6, 0x01, 0x0a, 0x0d, 0x44, 0x65, 0x76,
	0x69, 0x63, 0x65, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x51, 0x0a, 0x09, 0x47, 0x65,
	0x74, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x12, 0x26, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f,
	0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x47,
	0x65, 0x74, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x1c, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e,
	0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x12, 0x62, 0x0a,
	0x0b, 0x4c, 0x69, 0x73, 0x74, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x12, 0x28, 0x2e, 0x70,
	0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72,
	0x6e, 0x61, 0x6c, 0x2e, 0x4c, 0x69, 0x73, 0x74, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x29, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73,
	0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x4c, 0x69,
	0x73, 0x74, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x42, 0x3e, 0x5a, 0x3c, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f,
	0x70, 0x6c, 0x61, 0x6e, 0x74, 0x2d, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2f, 0x6d, 0x6f, 0x63, 0x6b,
	0x2d, 0x6d, 0x6f, 0x6e, 0x69, 0x74, 0x6f, 0x72, 0x69, 0x6e, 0x67, 0x2d, 0x61, 0x67, 0x65, 0x6e,
	0x74, 0x2f, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x70,
	0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_devices_proto_rawDescOnce sync.Once
	file_devices_proto_rawDescData = file_devices_proto_rawDesc
)

func file_devices_proto_rawDescGZIP() []byte {
	file_devices_proto_rawDescOnce.Do(func() {
		file_devices_proto_rawDescData = protoimpl.X.CompressGZIP(file_devices_proto_rawDescData)
	})
	return file_devices_proto_rawDescData
}

var file_devices_proto_enumTypes = make([]protoimpl.EnumInfo, 3)
var file_devices_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_devices_proto_goTypes = []interface{}{
	(DeviceStatus)(0),           // 0: plant_sense.internal.DeviceStatus
	(SensorKind)(0),             // 1: plant_sense.internal.SensorKind
	(ActuatorKind)(0),           // 2: plant_sense.internal.ActuatorKind
	(*Device)(nil),              // 3: plant_sense.internal.Device
	(*DeviceType)(nil),          // 4: plant_sense.internal.DeviceType
	(*GetDeviceRequest)(nil),    // 5: plant_sense.internal.GetDeviceRequest
	(*ListDevicesRequest)(nil),  // 6: plant_sense.internal.ListDevicesRequest
	(*ListDevicesResponse)(nil), // 7: plant_sense.internal.ListDevicesResponse
}
var file_devices_proto_depIdxs = []int32{
	0, // 0: plant_sense.internal.Device.status:type_name -> plant_sense.internal.DeviceStatus
	4, // 1: plant_sense.internal.Device.type:type_name -> plant_sense.internal.DeviceType
	1, // 2: plant_sense.internal.DeviceType.sensor:type_name -> plant_sense.internal.SensorKind
	2, // 3: plant_sense.internal.DeviceType.actuator:type_name -> plant_sense.internal.ActuatorKind
	3, // 4: plant_sense.internal.ListDevicesResponse.devices:type_name -> plant_sense.internal.Device
	5, // 5: plant_sense.internal.DeviceService.GetDevice:input_type -> plant_sense.internal.GetDeviceRequest
	6, // 6: plant_sense.internal.DeviceService.ListDevices:input_type -> plant_sense.internal.ListDevicesRequest
	3, // 7: plant_sense.internal.DeviceService.GetDevice:output_type -> plant_sense.internal.Device
	7, // 8: plant_sense.internal.DeviceService.ListDevices:output_type -> plant_sense.internal.ListDevicesResponse
	7, // [7:9] is the sub-list for method output_type
	5, // [5:7] is the sub-list for method input_type
	5, // [5:5] is the sub-list for extension type_name
	5, // [5:5] is the sub-list for extension extendee
	0, // [0:5] is the sub-list for field type_name
}

func init() { file_devices_proto_init() }
func file_devices_proto_init() {
	if File_devices_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_devices_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Device); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_devices_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeviceType); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_devices_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetDeviceRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_devices_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ListDevicesRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_devices_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ListDevicesResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	file_devices_proto_msgTypes[1].OneofWrappers = []interface{}{
		(*DeviceType_Sensor)(nil),
		(*DeviceType_Actuator)(nil),
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_devices_proto_rawDesc,
			NumEnums:      3,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_devices_proto_goTypes,
		DependencyIndexes: file_devices_proto_depIdxs,
		EnumInfos:         file_devices_proto_enumTypes,
		MessageInfos:      file_devices_proto_msgTypes,
	}.Build()
	File_devices_proto = out.File
	file_devices_proto_rawDesc = nil
	file_devices_proto_goTypes = nil
	file_devices_proto_depIdxs = nil
}
