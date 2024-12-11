// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.28.3
// source: sensor_data.proto

package pb

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.64.0 or later.
const _ = grpc.SupportPackageIsVersion9

const (
	SensorService_GetReading_FullMethodName            = "/plant_sense.internal.SensorService/GetReading"
	SensorService_GetHistoricalReadings_FullMethodName = "/plant_sense.internal.SensorService/GetHistoricalReadings"
	SensorService_StreamDeviceReadings_FullMethodName  = "/plant_sense.internal.SensorService/StreamDeviceReadings"
	SensorService_StreamAllReadings_FullMethodName     = "/plant_sense.internal.SensorService/StreamAllReadings"
)

// SensorServiceClient is the client API for SensorService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type SensorServiceClient interface {
	GetReading(ctx context.Context, in *GetReadingRequest, opts ...grpc.CallOption) (*SensorReading, error)
	GetHistoricalReadings(ctx context.Context, in *GetHistoricalReadingsRequest, opts ...grpc.CallOption) (*SensorReadingStream, error)
	StreamDeviceReadings(ctx context.Context, in *GetReadingRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[SensorReading], error)
	StreamAllReadings(ctx context.Context, in *StreamReadingsRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[SensorReading], error)
}

type sensorServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewSensorServiceClient(cc grpc.ClientConnInterface) SensorServiceClient {
	return &sensorServiceClient{cc}
}

func (c *sensorServiceClient) GetReading(ctx context.Context, in *GetReadingRequest, opts ...grpc.CallOption) (*SensorReading, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(SensorReading)
	err := c.cc.Invoke(ctx, SensorService_GetReading_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *sensorServiceClient) GetHistoricalReadings(ctx context.Context, in *GetHistoricalReadingsRequest, opts ...grpc.CallOption) (*SensorReadingStream, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(SensorReadingStream)
	err := c.cc.Invoke(ctx, SensorService_GetHistoricalReadings_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *sensorServiceClient) StreamDeviceReadings(ctx context.Context, in *GetReadingRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[SensorReading], error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	stream, err := c.cc.NewStream(ctx, &SensorService_ServiceDesc.Streams[0], SensorService_StreamDeviceReadings_FullMethodName, cOpts...)
	if err != nil {
		return nil, err
	}
	x := &grpc.GenericClientStream[GetReadingRequest, SensorReading]{ClientStream: stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type SensorService_StreamDeviceReadingsClient = grpc.ServerStreamingClient[SensorReading]

func (c *sensorServiceClient) StreamAllReadings(ctx context.Context, in *StreamReadingsRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[SensorReading], error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	stream, err := c.cc.NewStream(ctx, &SensorService_ServiceDesc.Streams[1], SensorService_StreamAllReadings_FullMethodName, cOpts...)
	if err != nil {
		return nil, err
	}
	x := &grpc.GenericClientStream[StreamReadingsRequest, SensorReading]{ClientStream: stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type SensorService_StreamAllReadingsClient = grpc.ServerStreamingClient[SensorReading]

// SensorServiceServer is the server API for SensorService service.
// All implementations must embed UnimplementedSensorServiceServer
// for forward compatibility.
type SensorServiceServer interface {
	GetReading(context.Context, *GetReadingRequest) (*SensorReading, error)
	GetHistoricalReadings(context.Context, *GetHistoricalReadingsRequest) (*SensorReadingStream, error)
	StreamDeviceReadings(*GetReadingRequest, grpc.ServerStreamingServer[SensorReading]) error
	StreamAllReadings(*StreamReadingsRequest, grpc.ServerStreamingServer[SensorReading]) error
	mustEmbedUnimplementedSensorServiceServer()
}

// UnimplementedSensorServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedSensorServiceServer struct{}

func (UnimplementedSensorServiceServer) GetReading(context.Context, *GetReadingRequest) (*SensorReading, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetReading not implemented")
}
func (UnimplementedSensorServiceServer) GetHistoricalReadings(context.Context, *GetHistoricalReadingsRequest) (*SensorReadingStream, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetHistoricalReadings not implemented")
}
func (UnimplementedSensorServiceServer) StreamDeviceReadings(*GetReadingRequest, grpc.ServerStreamingServer[SensorReading]) error {
	return status.Errorf(codes.Unimplemented, "method StreamDeviceReadings not implemented")
}
func (UnimplementedSensorServiceServer) StreamAllReadings(*StreamReadingsRequest, grpc.ServerStreamingServer[SensorReading]) error {
	return status.Errorf(codes.Unimplemented, "method StreamAllReadings not implemented")
}
func (UnimplementedSensorServiceServer) mustEmbedUnimplementedSensorServiceServer() {}
func (UnimplementedSensorServiceServer) testEmbeddedByValue()                       {}

// UnsafeSensorServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to SensorServiceServer will
// result in compilation errors.
type UnsafeSensorServiceServer interface {
	mustEmbedUnimplementedSensorServiceServer()
}

func RegisterSensorServiceServer(s grpc.ServiceRegistrar, srv SensorServiceServer) {
	// If the following call pancis, it indicates UnimplementedSensorServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&SensorService_ServiceDesc, srv)
}

func _SensorService_GetReading_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetReadingRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SensorServiceServer).GetReading(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: SensorService_GetReading_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SensorServiceServer).GetReading(ctx, req.(*GetReadingRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _SensorService_GetHistoricalReadings_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetHistoricalReadingsRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SensorServiceServer).GetHistoricalReadings(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: SensorService_GetHistoricalReadings_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SensorServiceServer).GetHistoricalReadings(ctx, req.(*GetHistoricalReadingsRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _SensorService_StreamDeviceReadings_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(GetReadingRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(SensorServiceServer).StreamDeviceReadings(m, &grpc.GenericServerStream[GetReadingRequest, SensorReading]{ServerStream: stream})
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type SensorService_StreamDeviceReadingsServer = grpc.ServerStreamingServer[SensorReading]

func _SensorService_StreamAllReadings_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(StreamReadingsRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(SensorServiceServer).StreamAllReadings(m, &grpc.GenericServerStream[StreamReadingsRequest, SensorReading]{ServerStream: stream})
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type SensorService_StreamAllReadingsServer = grpc.ServerStreamingServer[SensorReading]

// SensorService_ServiceDesc is the grpc.ServiceDesc for SensorService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var SensorService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "plant_sense.internal.SensorService",
	HandlerType: (*SensorServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GetReading",
			Handler:    _SensorService_GetReading_Handler,
		},
		{
			MethodName: "GetHistoricalReadings",
			Handler:    _SensorService_GetHistoricalReadings_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "StreamDeviceReadings",
			Handler:       _SensorService_StreamDeviceReadings_Handler,
			ServerStreams: true,
		},
		{
			StreamName:    "StreamAllReadings",
			Handler:       _SensorService_StreamAllReadings_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "sensor_data.proto",
}
