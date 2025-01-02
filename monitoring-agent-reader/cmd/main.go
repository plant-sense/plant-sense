package main

import (
	"context"
	"log"
	"net"
	"os"
	"time"

	mqtt "github.com/eclipse/paho.mqtt.golang"
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

	m_addr := os.Getenv("MQTT_ADDRESS")

	if m_addr == "" {
		m_addr = "localhost:1883"
	}

	addr := os.Getenv("REDIS_ADDRESS")

	if addr == "" {
		addr = "localhost:6379"
	}

	rdb := redis.NewClient(&redis.Options{
		Addr:     addr,
		Password: "", // no password set
		DB:       0,  // use default DB
	})

	m_opts := mqtt.NewClientOptions()
	m_opts.AddBroker("tcp://" + m_addr)
	m_opts.SetClientID("actuator-service")
	m_opts.SetCleanSession(true)
	m_opts.SetAutoReconnect(true)
	m_opts.SetConnectTimeout(time.Second * 10)

	m_client := mqtt.NewClient(m_opts)

	if token := m_client.Connect(); token.Wait() && token.Error() != nil {
		log.Fatalf("Failed to connect to mqtt broker")
	}

	defer m_client.Disconnect(0)

	// s := service.NewActuatorService(m_client)

	if err != nil {
		log.Fatalf("%v", err)
	}

	log.Println(rdb.Keys(context.TODO(), "*"))

	pb.RegisterSensorServiceServer(server, service.NewSensorService(rdb))
	pb.RegisterDeviceServiceServer(server, service.NewDeviceService(rdb))
	pb.RegisterActuatorServiceServer(server, service.NewActuatorService(m_client))

	reflection.Register(server)

	log.Println("Starting server on port :50051")
	server.Serve(lis)
}
