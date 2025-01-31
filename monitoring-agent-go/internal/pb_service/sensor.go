package pbservice

import (
	"context"
	"monitoring-agent/internal/gen/pb"
	"time"

	"github.com/redis/go-redis/v9"
	"google.golang.org/grpc"
)

var _ pb.SensorServiceServer = &sensorService{}

type sensorService struct {
	redisClient *redis.Client
	pb.UnimplementedSensorServiceServer
}

// GetHistoricalReadings implements pb.SensorServiceServer.
func (s *sensorService) GetHistoricalReadings(_ context.Context, req *pb.GetHistoricalReadingsRequest) (*pb.SensorReadingStream, error) {
	var startTime, endTime int64

	if req.StartTime != nil {
		startTime = *req.StartTime
	} else { //default to 1h ago
		startTime = time.Now().Add(-1 * time.Hour).UnixMilli()
	}

	if req.EndTime != nil {
		endTime = *req.EndTime
	} else {
		endTime = time.Now().UnixMilli()
	}

	ts := s.redisClient.TSRangeWithArgs(context.Background(), req.DeviceId, int(startTime), int(endTime), &redis.TSRangeOptions{
		Count:      100,
		Aggregator: redis.Avg,
	})

	var readings []*pb.SensorReading
	for _, r := range ts.Val() {
		reading := pb.SensorReading{
			DeviceId:  req.DeviceId,
			Timestamp: r.Timestamp,
			Reading: &pb.Reading{
				Value: r.Value,
				Unit:  "",
			},
		}
		readings = append(readings, &reading)
	}

	return &pb.SensorReadingStream{
		Readings: readings,
	}, nil
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
			ts := s.redisClient.TSGet(context.Background(), req.DeviceId)

			reading := pb.SensorReading{
				DeviceId:  req.DeviceId,
				Timestamp: ts.Val().Timestamp,
				Reading: &pb.Reading{
					Value: ts.Val().Value,
					Unit:  "",
				},
			}
			if err := stream.Send(&reading); err != nil {
				return err
			}
		}
	}
}

func NewSensorService(redisClient *redis.Client) *sensorService {
	return &sensorService{redisClient: redisClient}
}
