// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.27.1
// 	protoc        v5.28.3
// source: sensor_data.proto

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

type Reading struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Value float64 `protobuf:"fixed64,1,opt,name=value,proto3" json:"value,omitempty"`
	Unit  string  `protobuf:"bytes,2,opt,name=unit,proto3" json:"unit,omitempty"`
}

func (x *Reading) Reset() {
	*x = Reading{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sensor_data_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Reading) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Reading) ProtoMessage() {}

func (x *Reading) ProtoReflect() protoreflect.Message {
	mi := &file_sensor_data_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Reading.ProtoReflect.Descriptor instead.
func (*Reading) Descriptor() ([]byte, []int) {
	return file_sensor_data_proto_rawDescGZIP(), []int{0}
}

func (x *Reading) GetValue() float64 {
	if x != nil {
		return x.Value
	}
	return 0
}

func (x *Reading) GetUnit() string {
	if x != nil {
		return x.Unit
	}
	return ""
}

type SensorReading struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DeviceId  string   `protobuf:"bytes,1,opt,name=device_id,json=deviceId,proto3" json:"device_id,omitempty"`
	Timestamp int64    `protobuf:"varint,2,opt,name=timestamp,proto3" json:"timestamp,omitempty"`
	Reading   *Reading `protobuf:"bytes,3,opt,name=reading,proto3" json:"reading,omitempty"`
}

func (x *SensorReading) Reset() {
	*x = SensorReading{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sensor_data_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SensorReading) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SensorReading) ProtoMessage() {}

func (x *SensorReading) ProtoReflect() protoreflect.Message {
	mi := &file_sensor_data_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SensorReading.ProtoReflect.Descriptor instead.
func (*SensorReading) Descriptor() ([]byte, []int) {
	return file_sensor_data_proto_rawDescGZIP(), []int{1}
}

func (x *SensorReading) GetDeviceId() string {
	if x != nil {
		return x.DeviceId
	}
	return ""
}

func (x *SensorReading) GetTimestamp() int64 {
	if x != nil {
		return x.Timestamp
	}
	return 0
}

func (x *SensorReading) GetReading() *Reading {
	if x != nil {
		return x.Reading
	}
	return nil
}

type SensorReadingStream struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Readings []*SensorReading `protobuf:"bytes,1,rep,name=readings,proto3" json:"readings,omitempty"`
}

func (x *SensorReadingStream) Reset() {
	*x = SensorReadingStream{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sensor_data_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SensorReadingStream) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SensorReadingStream) ProtoMessage() {}

func (x *SensorReadingStream) ProtoReflect() protoreflect.Message {
	mi := &file_sensor_data_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SensorReadingStream.ProtoReflect.Descriptor instead.
func (*SensorReadingStream) Descriptor() ([]byte, []int) {
	return file_sensor_data_proto_rawDescGZIP(), []int{2}
}

func (x *SensorReadingStream) GetReadings() []*SensorReading {
	if x != nil {
		return x.Readings
	}
	return nil
}

type GetReadingRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DeviceId string `protobuf:"bytes,1,opt,name=device_id,json=deviceId,proto3" json:"device_id,omitempty"`
}

func (x *GetReadingRequest) Reset() {
	*x = GetReadingRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sensor_data_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetReadingRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetReadingRequest) ProtoMessage() {}

func (x *GetReadingRequest) ProtoReflect() protoreflect.Message {
	mi := &file_sensor_data_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetReadingRequest.ProtoReflect.Descriptor instead.
func (*GetReadingRequest) Descriptor() ([]byte, []int) {
	return file_sensor_data_proto_rawDescGZIP(), []int{3}
}

func (x *GetReadingRequest) GetDeviceId() string {
	if x != nil {
		return x.DeviceId
	}
	return ""
}

type GetHistoricalReadingsRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DeviceId  string `protobuf:"bytes,1,opt,name=device_id,json=deviceId,proto3" json:"device_id,omitempty"`
	StartTime *int64 `protobuf:"varint,2,opt,name=start_time,json=startTime,proto3,oneof" json:"start_time,omitempty"`
	EndTime   *int64 `protobuf:"varint,3,opt,name=end_time,json=endTime,proto3,oneof" json:"end_time,omitempty"`
}

func (x *GetHistoricalReadingsRequest) Reset() {
	*x = GetHistoricalReadingsRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sensor_data_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetHistoricalReadingsRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetHistoricalReadingsRequest) ProtoMessage() {}

func (x *GetHistoricalReadingsRequest) ProtoReflect() protoreflect.Message {
	mi := &file_sensor_data_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetHistoricalReadingsRequest.ProtoReflect.Descriptor instead.
func (*GetHistoricalReadingsRequest) Descriptor() ([]byte, []int) {
	return file_sensor_data_proto_rawDescGZIP(), []int{4}
}

func (x *GetHistoricalReadingsRequest) GetDeviceId() string {
	if x != nil {
		return x.DeviceId
	}
	return ""
}

func (x *GetHistoricalReadingsRequest) GetStartTime() int64 {
	if x != nil && x.StartTime != nil {
		return *x.StartTime
	}
	return 0
}

func (x *GetHistoricalReadingsRequest) GetEndTime() int64 {
	if x != nil && x.EndTime != nil {
		return *x.EndTime
	}
	return 0
}

type StreamReadingsRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DeviceIds []string `protobuf:"bytes,1,rep,name=device_ids,json=deviceIds,proto3" json:"device_ids,omitempty"`
}

func (x *StreamReadingsRequest) Reset() {
	*x = StreamReadingsRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sensor_data_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *StreamReadingsRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*StreamReadingsRequest) ProtoMessage() {}

func (x *StreamReadingsRequest) ProtoReflect() protoreflect.Message {
	mi := &file_sensor_data_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use StreamReadingsRequest.ProtoReflect.Descriptor instead.
func (*StreamReadingsRequest) Descriptor() ([]byte, []int) {
	return file_sensor_data_proto_rawDescGZIP(), []int{5}
}

func (x *StreamReadingsRequest) GetDeviceIds() []string {
	if x != nil {
		return x.DeviceIds
	}
	return nil
}

var File_sensor_data_proto protoreflect.FileDescriptor

var file_sensor_data_proto_rawDesc = []byte{
	0x0a, 0x11, 0x73, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x5f, 0x64, 0x61, 0x74, 0x61, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x12, 0x14, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65,
	0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x22, 0x33, 0x0a, 0x07, 0x52, 0x65, 0x61,
	0x64, 0x69, 0x6e, 0x67, 0x12, 0x14, 0x0a, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x01, 0x52, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65, 0x12, 0x12, 0x0a, 0x04, 0x75, 0x6e,
	0x69, 0x74, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x75, 0x6e, 0x69, 0x74, 0x22, 0x83,
	0x01, 0x0a, 0x0d, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67,
	0x12, 0x1b, 0x0a, 0x09, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x08, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x49, 0x64, 0x12, 0x1c, 0x0a,
	0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x18, 0x02, 0x20, 0x01, 0x28, 0x03,
	0x52, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x12, 0x37, 0x0a, 0x07, 0x72,
	0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1d, 0x2e, 0x70,
	0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72,
	0x6e, 0x61, 0x6c, 0x2e, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x52, 0x07, 0x72, 0x65, 0x61,
	0x64, 0x69, 0x6e, 0x67, 0x22, 0x56, 0x0a, 0x13, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x52, 0x65,
	0x61, 0x64, 0x69, 0x6e, 0x67, 0x53, 0x74, 0x72, 0x65, 0x61, 0x6d, 0x12, 0x3f, 0x0a, 0x08, 0x72,
	0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x23, 0x2e,
	0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65,
	0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x52, 0x65, 0x61, 0x64, 0x69,
	0x6e, 0x67, 0x52, 0x08, 0x72, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x22, 0x30, 0x0a, 0x11,
	0x47, 0x65, 0x74, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x12, 0x1b, 0x0a, 0x09, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x49, 0x64, 0x22, 0x9b,
	0x01, 0x0a, 0x1c, 0x47, 0x65, 0x74, 0x48, 0x69, 0x73, 0x74, 0x6f, 0x72, 0x69, 0x63, 0x61, 0x6c,
	0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x1b, 0x0a, 0x09, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x08, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x49, 0x64, 0x12, 0x22, 0x0a, 0x0a,
	0x73, 0x74, 0x61, 0x72, 0x74, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x03,
	0x48, 0x00, 0x52, 0x09, 0x73, 0x74, 0x61, 0x72, 0x74, 0x54, 0x69, 0x6d, 0x65, 0x88, 0x01, 0x01,
	0x12, 0x1e, 0x0a, 0x08, 0x65, 0x6e, 0x64, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x03, 0x48, 0x01, 0x52, 0x07, 0x65, 0x6e, 0x64, 0x54, 0x69, 0x6d, 0x65, 0x88, 0x01, 0x01,
	0x42, 0x0d, 0x0a, 0x0b, 0x5f, 0x73, 0x74, 0x61, 0x72, 0x74, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x42,
	0x0b, 0x0a, 0x09, 0x5f, 0x65, 0x6e, 0x64, 0x5f, 0x74, 0x69, 0x6d, 0x65, 0x22, 0x36, 0x0a, 0x15,
	0x53, 0x74, 0x72, 0x65, 0x61, 0x6d, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1d, 0x0a, 0x0a, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x5f,
	0x69, 0x64, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x09, 0x52, 0x09, 0x64, 0x65, 0x76, 0x69, 0x63,
	0x65, 0x49, 0x64, 0x73, 0x32, 0xb4, 0x03, 0x0a, 0x0d, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x53,
	0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x5a, 0x0a, 0x0a, 0x47, 0x65, 0x74, 0x52, 0x65, 0x61,
	0x64, 0x69, 0x6e, 0x67, 0x12, 0x27, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e,
	0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x47, 0x65, 0x74, 0x52,
	0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x23, 0x2e,
	0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65,
	0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x52, 0x65, 0x61, 0x64, 0x69,
	0x6e, 0x67, 0x12, 0x76, 0x0a, 0x15, 0x47, 0x65, 0x74, 0x48, 0x69, 0x73, 0x74, 0x6f, 0x72, 0x69,
	0x63, 0x61, 0x6c, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x12, 0x32, 0x2e, 0x70, 0x6c,
	0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e,
	0x61, 0x6c, 0x2e, 0x47, 0x65, 0x74, 0x48, 0x69, 0x73, 0x74, 0x6f, 0x72, 0x69, 0x63, 0x61, 0x6c,
	0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x29, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e,
	0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x52, 0x65, 0x61,
	0x64, 0x69, 0x6e, 0x67, 0x53, 0x74, 0x72, 0x65, 0x61, 0x6d, 0x12, 0x66, 0x0a, 0x14, 0x53, 0x74,
	0x72, 0x65, 0x61, 0x6d, 0x44, 0x65, 0x76, 0x69, 0x63, 0x65, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e,
	0x67, 0x73, 0x12, 0x27, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65,
	0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x47, 0x65, 0x74, 0x52, 0x65, 0x61,
	0x64, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x23, 0x2e, 0x70, 0x6c,
	0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e,
	0x61, 0x6c, 0x2e, 0x53, 0x65, 0x6e, 0x73, 0x6f, 0x72, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67,
	0x30, 0x01, 0x12, 0x67, 0x0a, 0x11, 0x53, 0x74, 0x72, 0x65, 0x61, 0x6d, 0x41, 0x6c, 0x6c, 0x52,
	0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x12, 0x2b, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f,
	0x73, 0x65, 0x6e, 0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x53,
	0x74, 0x72, 0x65, 0x61, 0x6d, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x73, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x1a, 0x23, 0x2e, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x6e,
	0x73, 0x65, 0x2e, 0x69, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x61, 0x6c, 0x2e, 0x53, 0x65, 0x6e, 0x73,
	0x6f, 0x72, 0x52, 0x65, 0x61, 0x64, 0x69, 0x6e, 0x67, 0x30, 0x01, 0x42, 0x3e, 0x5a, 0x3c, 0x67,
	0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x70, 0x6c, 0x61, 0x6e, 0x74, 0x2d,
	0x73, 0x65, 0x6e, 0x73, 0x65, 0x2f, 0x6d, 0x6f, 0x63, 0x6b, 0x2d, 0x6d, 0x6f, 0x6e, 0x69, 0x74,
	0x6f, 0x72, 0x69, 0x6e, 0x67, 0x2d, 0x61, 0x67, 0x65, 0x6e, 0x74, 0x2f, 0x69, 0x6e, 0x74, 0x65,
	0x72, 0x6e, 0x61, 0x6c, 0x2f, 0x67, 0x65, 0x6e, 0x2f, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x33,
}

var (
	file_sensor_data_proto_rawDescOnce sync.Once
	file_sensor_data_proto_rawDescData = file_sensor_data_proto_rawDesc
)

func file_sensor_data_proto_rawDescGZIP() []byte {
	file_sensor_data_proto_rawDescOnce.Do(func() {
		file_sensor_data_proto_rawDescData = protoimpl.X.CompressGZIP(file_sensor_data_proto_rawDescData)
	})
	return file_sensor_data_proto_rawDescData
}

var file_sensor_data_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_sensor_data_proto_goTypes = []interface{}{
	(*Reading)(nil),                      // 0: plant_sense.internal.Reading
	(*SensorReading)(nil),                // 1: plant_sense.internal.SensorReading
	(*SensorReadingStream)(nil),          // 2: plant_sense.internal.SensorReadingStream
	(*GetReadingRequest)(nil),            // 3: plant_sense.internal.GetReadingRequest
	(*GetHistoricalReadingsRequest)(nil), // 4: plant_sense.internal.GetHistoricalReadingsRequest
	(*StreamReadingsRequest)(nil),        // 5: plant_sense.internal.StreamReadingsRequest
}
var file_sensor_data_proto_depIdxs = []int32{
	0, // 0: plant_sense.internal.SensorReading.reading:type_name -> plant_sense.internal.Reading
	1, // 1: plant_sense.internal.SensorReadingStream.readings:type_name -> plant_sense.internal.SensorReading
	3, // 2: plant_sense.internal.SensorService.GetReading:input_type -> plant_sense.internal.GetReadingRequest
	4, // 3: plant_sense.internal.SensorService.GetHistoricalReadings:input_type -> plant_sense.internal.GetHistoricalReadingsRequest
	3, // 4: plant_sense.internal.SensorService.StreamDeviceReadings:input_type -> plant_sense.internal.GetReadingRequest
	5, // 5: plant_sense.internal.SensorService.StreamAllReadings:input_type -> plant_sense.internal.StreamReadingsRequest
	1, // 6: plant_sense.internal.SensorService.GetReading:output_type -> plant_sense.internal.SensorReading
	2, // 7: plant_sense.internal.SensorService.GetHistoricalReadings:output_type -> plant_sense.internal.SensorReadingStream
	1, // 8: plant_sense.internal.SensorService.StreamDeviceReadings:output_type -> plant_sense.internal.SensorReading
	1, // 9: plant_sense.internal.SensorService.StreamAllReadings:output_type -> plant_sense.internal.SensorReading
	6, // [6:10] is the sub-list for method output_type
	2, // [2:6] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_sensor_data_proto_init() }
func file_sensor_data_proto_init() {
	if File_sensor_data_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_sensor_data_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Reading); i {
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
		file_sensor_data_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SensorReading); i {
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
		file_sensor_data_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SensorReadingStream); i {
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
		file_sensor_data_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetReadingRequest); i {
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
		file_sensor_data_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetHistoricalReadingsRequest); i {
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
		file_sensor_data_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*StreamReadingsRequest); i {
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
	file_sensor_data_proto_msgTypes[4].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_sensor_data_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_sensor_data_proto_goTypes,
		DependencyIndexes: file_sensor_data_proto_depIdxs,
		MessageInfos:      file_sensor_data_proto_msgTypes,
	}.Build()
	File_sensor_data_proto = out.File
	file_sensor_data_proto_rawDesc = nil
	file_sensor_data_proto_goTypes = nil
	file_sensor_data_proto_depIdxs = nil
}
