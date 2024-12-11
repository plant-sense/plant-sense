package main

import (
	"context"
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

	// Create a new gRPC server with CORS options
	server := grpc.NewServer(
		grpc.Creds(insecure.NewCredentials()),
		grpc.UnaryInterceptor(allowCORS),
		grpc.StreamInterceptor(allowCORSStream),
	)

	pb.RegisterSensorServiceServer(server, service.NewSensorService())
	reflection.Register(server)

	log.Println("Starting server on port :50051")
	server.Serve(lis)
}

func allowCORS(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	// Add CORS headers here if needed
	resp, err := handler(ctx, req)
	return resp, err
}

func allowCORSStream(srv interface{}, ss grpc.ServerStream, info *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
	// Add CORS headers here if needed
	return handler(srv, ss)
}
