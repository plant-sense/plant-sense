package main

import (
	"log"
	"net"
	"os"

	"github.com/plant-sense/monitoring-agent-reader/internal/gen/pb"
	"github.com/plant-sense/monitoring-agent-reader/internal/service"
	"github.com/redis/go-redis/v9"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/reflection"
)

func main() {
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	server := grpc.NewServer(
		grpc.Creds(insecure.NewCredentials()),
	)

	addr := os.Getenv("REDIS_ADDRESS")

	if addr == "" {
		addr = "localhost:6379"
	}

	rdb := redis.NewClient(&redis.Options{
		Addr:     addr,
		Password: "", // no password set
		DB:       0,  // use default DB
	})

	pb.RegisterSensorServiceServer(server, service.NewSensorService(rdb))
	pb.RegisterDeviceServiceServer(server, service.NewDeviceService(rdb))
	reflection.Register(server)

	log.Println("Starting server on port :50051")
	server.Serve(lis)
}
