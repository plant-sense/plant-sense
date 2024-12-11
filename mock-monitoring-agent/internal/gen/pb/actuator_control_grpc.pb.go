// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.28.3
// source: actuator_control.proto

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
	ActuatorService_GetState_FullMethodName    = "/plant_sense.internal.ActuatorService/GetState"
	ActuatorService_SetState_FullMethodName    = "/plant_sense.internal.ActuatorService/SetState"
	ActuatorService_StreamState_FullMethodName = "/plant_sense.internal.ActuatorService/StreamState"
)

// ActuatorServiceClient is the client API for ActuatorService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ActuatorServiceClient interface {
	GetState(ctx context.Context, in *GetActuatorStateRequest, opts ...grpc.CallOption) (*ActuatorState, error)
	SetState(ctx context.Context, in *SetActuatorStateRequest, opts ...grpc.CallOption) (*ActuatorState, error)
	StreamState(ctx context.Context, in *GetActuatorStateRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[ActuatorState], error)
}

type actuatorServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewActuatorServiceClient(cc grpc.ClientConnInterface) ActuatorServiceClient {
	return &actuatorServiceClient{cc}
}

func (c *actuatorServiceClient) GetState(ctx context.Context, in *GetActuatorStateRequest, opts ...grpc.CallOption) (*ActuatorState, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(ActuatorState)
	err := c.cc.Invoke(ctx, ActuatorService_GetState_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *actuatorServiceClient) SetState(ctx context.Context, in *SetActuatorStateRequest, opts ...grpc.CallOption) (*ActuatorState, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(ActuatorState)
	err := c.cc.Invoke(ctx, ActuatorService_SetState_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *actuatorServiceClient) StreamState(ctx context.Context, in *GetActuatorStateRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[ActuatorState], error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	stream, err := c.cc.NewStream(ctx, &ActuatorService_ServiceDesc.Streams[0], ActuatorService_StreamState_FullMethodName, cOpts...)
	if err != nil {
		return nil, err
	}
	x := &grpc.GenericClientStream[GetActuatorStateRequest, ActuatorState]{ClientStream: stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type ActuatorService_StreamStateClient = grpc.ServerStreamingClient[ActuatorState]

// ActuatorServiceServer is the server API for ActuatorService service.
// All implementations must embed UnimplementedActuatorServiceServer
// for forward compatibility.
type ActuatorServiceServer interface {
	GetState(context.Context, *GetActuatorStateRequest) (*ActuatorState, error)
	SetState(context.Context, *SetActuatorStateRequest) (*ActuatorState, error)
	StreamState(*GetActuatorStateRequest, grpc.ServerStreamingServer[ActuatorState]) error
	mustEmbedUnimplementedActuatorServiceServer()
}

// UnimplementedActuatorServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedActuatorServiceServer struct{}

func (UnimplementedActuatorServiceServer) GetState(context.Context, *GetActuatorStateRequest) (*ActuatorState, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetState not implemented")
}
func (UnimplementedActuatorServiceServer) SetState(context.Context, *SetActuatorStateRequest) (*ActuatorState, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SetState not implemented")
}
func (UnimplementedActuatorServiceServer) StreamState(*GetActuatorStateRequest, grpc.ServerStreamingServer[ActuatorState]) error {
	return status.Errorf(codes.Unimplemented, "method StreamState not implemented")
}
func (UnimplementedActuatorServiceServer) mustEmbedUnimplementedActuatorServiceServer() {}
func (UnimplementedActuatorServiceServer) testEmbeddedByValue()                         {}

// UnsafeActuatorServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ActuatorServiceServer will
// result in compilation errors.
type UnsafeActuatorServiceServer interface {
	mustEmbedUnimplementedActuatorServiceServer()
}

func RegisterActuatorServiceServer(s grpc.ServiceRegistrar, srv ActuatorServiceServer) {
	// If the following call pancis, it indicates UnimplementedActuatorServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&ActuatorService_ServiceDesc, srv)
}

func _ActuatorService_GetState_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetActuatorStateRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ActuatorServiceServer).GetState(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ActuatorService_GetState_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ActuatorServiceServer).GetState(ctx, req.(*GetActuatorStateRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ActuatorService_SetState_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SetActuatorStateRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ActuatorServiceServer).SetState(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ActuatorService_SetState_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ActuatorServiceServer).SetState(ctx, req.(*SetActuatorStateRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ActuatorService_StreamState_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(GetActuatorStateRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(ActuatorServiceServer).StreamState(m, &grpc.GenericServerStream[GetActuatorStateRequest, ActuatorState]{ServerStream: stream})
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type ActuatorService_StreamStateServer = grpc.ServerStreamingServer[ActuatorState]

// ActuatorService_ServiceDesc is the grpc.ServiceDesc for ActuatorService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var ActuatorService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "plant_sense.internal.ActuatorService",
	HandlerType: (*ActuatorServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GetState",
			Handler:    _ActuatorService_GetState_Handler,
		},
		{
			MethodName: "SetState",
			Handler:    _ActuatorService_SetState_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "StreamState",
			Handler:       _ActuatorService_StreamState_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "actuator_control.proto",
}
