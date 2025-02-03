package service

import (
	"context"
	"fmt"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
	"google.golang.org/grpc"
)

var _ pb.ActuatorServiceServer = &actuatorService{}

type actuatorService struct {
	pb.UnimplementedActuatorServiceServer
	actuatorStates map[string]*pb.ActuatorState
}

func NewActuatorService() *actuatorService {
	return &actuatorService{
		actuatorStates: make(map[string]*pb.ActuatorState),
	}
}

// GetState implements pb.ActuatorServiceServer.
func (a *actuatorService) GetState(ctx context.Context, r *pb.GetActuatorStateRequest) (*pb.ActuatorState, error) {
	state, ok := a.actuatorStates[r.DeviceId]
	if !ok {
		return &pb.ActuatorState{DeviceId: r.DeviceId, State: false}, nil
	}
	return state, nil
}

// SetState implements pb.ActuatorServiceServer.
func (a *actuatorService) SetState(ctx context.Context, r *pb.SetActuatorStateRequest) (*pb.ActuatorState, error) {
	state := &pb.ActuatorState{DeviceId: r.DeviceId, State: r.State, Intensity: r.Intensity}
	a.actuatorStates[r.DeviceId] = state

	intensity := 0.0
	if r.Intensity != nil {
		intensity = *r.Intensity
	}
	fmt.Printf("SetState called for %s, state: %v, intensity: %f\n", r.DeviceId, r.State, intensity)
	return state, nil
}

// StreamState implements pb.ActuatorServiceServer.
func (a *actuatorService) StreamState(*pb.GetActuatorStateRequest, grpc.ServerStreamingServer[pb.ActuatorState]) error {
	return nil
}
