package service

import (
	"context"
	"math/rand"
	"time"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
	"google.golang.org/grpc"
)

var _ pb.SensorServiceServer = &sensorService{}

type sensorService struct {
	pb.UnimplementedSensorServiceServer
}

func generateRandomReading(deviceID string, t time.Time) *pb.SensorReading {
	return &pb.SensorReading{
		DeviceId:  deviceID,
		Timestamp: t.Unix(),
		Reading: &pb.Reading{
			Value: rand.Float64() * 100,
			Unit:  "celsius",
		},
	}
}

// GetReading implements pb.SensorServiceServer.
func (s *sensorService) GetReading(_ context.Context, req *pb.GetReadingRequest) (*pb.SensorReading, error) {
	return generateRandomReading(req.DeviceId, time.Now()), nil
}

// StreamAllReadings implements pb.SensorServiceServer.
func (s *sensorService) StreamAllReadings(req *pb.StreamReadingsRequest, stream grpc.ServerStreamingServer[pb.SensorReading]) error {
	ticker := time.NewTicker(10 * time.Second)
	defer ticker.Stop()

	for {
		select {
		case <-stream.Context().Done():
			return nil
		case <-ticker.C:
			for _, deviceID := range req.DeviceIds {
				if err := stream.Send(generateRandomReading(deviceID, time.Now())); err != nil {
					return err
				}
			}
		}
	}
}

// StreamDeviceReadings implements pb.SensorServiceServer.
func (s *sensorService) StreamDeviceReadings(req *pb.GetReadingRequest, stream grpc.ServerStreamingServer[pb.SensorReading]) error {
	ticker := time.NewTicker(10 * time.Second)
	defer ticker.Stop()

	for {
		select {
		case <-stream.Context().Done():
			return nil
		case <-ticker.C:
			if err := stream.Send(generateRandomReading(req.DeviceId, time.Now())); err != nil {
				return err
			}
		}
	}
}

// GetHistoricalReadings implements pb.SensorServiceServer.
func (s *sensorService) GetHistoricalReadings(_ context.Context, req *pb.GetHistoricalReadingsRequest) (*pb.SensorReadingStream, error) {
	var startTime, endTime int64
	if req.StartTime != nil {
		startTime = *req.StartTime
	} else {
		// Default to an hour ago if start time not specified
		startTime = time.Now().Add(-1 * time.Hour).Unix()
	}
	if req.EndTime != nil {
		endTime = *req.EndTime
	} else {
		endTime = time.Now().Unix()
	}

	// Generate readings at 1-minute intervals
	var readings []*pb.SensorReading
	for t := startTime; t <= endTime; t += 60 {
		readings = append(readings, generateRandomReading(req.DeviceId, time.Unix(t, 0)))
	}

	return &pb.SensorReadingStream{
		Readings: readings,
	}, nil
}

func NewSensorService() *sensorService {
	return &sensorService{}
}
