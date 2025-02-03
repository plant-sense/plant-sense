package main

import (
	"log"
	"net"

	"github.com/plant-sense/mock-monitoring-agent/internal/gen/pb"
	"github.com/plant-sense/mock-monitoring-agent/internal/service"
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

	pb.RegisterSensorServiceServer(server, service.NewSensorService())
	pb.RegisterDeviceServiceServer(server, service.NewDeviceService())
	pb.RegisterActuatorServiceServer(server, service.NewActuatorService())
	reflection.Register(server)

	log.Println("Starting server on port :50051")
	server.Serve(lis)
}
