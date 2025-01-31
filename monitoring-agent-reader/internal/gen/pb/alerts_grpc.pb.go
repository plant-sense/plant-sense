// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.29.2
// source: alerts.proto

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
	AlertService_SetAlert_FullMethodName      = "/plant_sense.internal.AlertService/SetAlert"
	AlertService_ReceiveAlerts_FullMethodName = "/plant_sense.internal.AlertService/ReceiveAlerts"
)

// AlertServiceClient is the client API for AlertService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AlertServiceClient interface {
	SetAlert(ctx context.Context, in *SetAlertRequest, opts ...grpc.CallOption) (*SetAlertResponse, error)
	ReceiveAlerts(ctx context.Context, in *SetAlertRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[Alert], error)
}

type alertServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewAlertServiceClient(cc grpc.ClientConnInterface) AlertServiceClient {
	return &alertServiceClient{cc}
}

func (c *alertServiceClient) SetAlert(ctx context.Context, in *SetAlertRequest, opts ...grpc.CallOption) (*SetAlertResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(SetAlertResponse)
	err := c.cc.Invoke(ctx, AlertService_SetAlert_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *alertServiceClient) ReceiveAlerts(ctx context.Context, in *SetAlertRequest, opts ...grpc.CallOption) (grpc.ServerStreamingClient[Alert], error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	stream, err := c.cc.NewStream(ctx, &AlertService_ServiceDesc.Streams[0], AlertService_ReceiveAlerts_FullMethodName, cOpts...)
	if err != nil {
		return nil, err
	}
	x := &grpc.GenericClientStream[SetAlertRequest, Alert]{ClientStream: stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type AlertService_ReceiveAlertsClient = grpc.ServerStreamingClient[Alert]

// AlertServiceServer is the server API for AlertService service.
// All implementations must embed UnimplementedAlertServiceServer
// for forward compatibility.
type AlertServiceServer interface {
	SetAlert(context.Context, *SetAlertRequest) (*SetAlertResponse, error)
	ReceiveAlerts(*SetAlertRequest, grpc.ServerStreamingServer[Alert]) error
	mustEmbedUnimplementedAlertServiceServer()
}

// UnimplementedAlertServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedAlertServiceServer struct{}

func (UnimplementedAlertServiceServer) SetAlert(context.Context, *SetAlertRequest) (*SetAlertResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SetAlert not implemented")
}
func (UnimplementedAlertServiceServer) ReceiveAlerts(*SetAlertRequest, grpc.ServerStreamingServer[Alert]) error {
	return status.Errorf(codes.Unimplemented, "method ReceiveAlerts not implemented")
}
func (UnimplementedAlertServiceServer) mustEmbedUnimplementedAlertServiceServer() {}
func (UnimplementedAlertServiceServer) testEmbeddedByValue()                      {}

// UnsafeAlertServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AlertServiceServer will
// result in compilation errors.
type UnsafeAlertServiceServer interface {
	mustEmbedUnimplementedAlertServiceServer()
}

func RegisterAlertServiceServer(s grpc.ServiceRegistrar, srv AlertServiceServer) {
	// If the following call pancis, it indicates UnimplementedAlertServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&AlertService_ServiceDesc, srv)
}

func _AlertService_SetAlert_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SetAlertRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AlertServiceServer).SetAlert(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: AlertService_SetAlert_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AlertServiceServer).SetAlert(ctx, req.(*SetAlertRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _AlertService_ReceiveAlerts_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(SetAlertRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(AlertServiceServer).ReceiveAlerts(m, &grpc.GenericServerStream[SetAlertRequest, Alert]{ServerStream: stream})
}

// This type alias is provided for backwards compatibility with existing code that references the prior non-generic stream type by name.
type AlertService_ReceiveAlertsServer = grpc.ServerStreamingServer[Alert]

// AlertService_ServiceDesc is the grpc.ServiceDesc for AlertService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var AlertService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "plant_sense.internal.AlertService",
	HandlerType: (*AlertServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "SetAlert",
			Handler:    _AlertService_SetAlert_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "ReceiveAlerts",
			Handler:       _AlertService_ReceiveAlerts_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "alerts.proto",
}
