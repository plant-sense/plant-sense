package service

import (
	"context"
	"time"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
	"google.golang.org/grpc"
)

var _ pb.SensorServiceServer = &sensorService{}

type sensorService struct {
	pb.UnimplementedSensorServiceServer
}

func generateRandomReading(deviceID string, t time.Time) *pb.SensorReading {
	scale := 0.0
	if deviceID == tempID {
		scale = 50
	} else if deviceID == smID {
		scale = 100.0
	} else if deviceID == lightID {
		scale = 1000.0
	}
	_ = scale

	v := 7.0

	if (t.Minute() % 2) == 1 {
		v = scale
	}

	return &pb.SensorReading{
		DeviceId:  deviceID,
		Timestamp: t.UnixMilli(),
		Reading: &pb.Reading{
			// Value: scale * (0.5*math.Sin(float64(t.Unix())/1000.0) + 0.5),
			Value: v,
			Unit:  "",
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
		startTime = time.Now().Add(-24 * time.Hour).UnixMilli()
	}
	if req.EndTime != nil {
		endTime = *req.EndTime
	} else {
		endTime = time.Now().UnixMilli()
	}

	// Generate readings at 15-minute intervals
	var readings []*pb.SensorReading
	for t := startTime; t <= endTime; t += 15 * 60 * 1000 {
		readings = append(readings, generateRandomReading(req.DeviceId, time.UnixMilli(t)))
	}
	// todo add latest reading maybe for larger intervals

	return &pb.SensorReadingStream{
		Readings: readings,
	}, nil
}

func NewSensorService() *sensorService {
	return &sensorService{}
}
