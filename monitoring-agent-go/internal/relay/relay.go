package relay

import (
	"log"
	"monitoring-agent/internal/common"
	"monitoring-agent/internal/gen/pb"
	pbservice "monitoring-agent/internal/pb_service"
	"net"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"github.com/redis/go-redis/v9"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func Relay_routine(rdb *redis.Client, lis net.Listener, mbroker mqtt.Client, dev_chan <-chan []common.Device, ctrl *common.Control) {

	devices := []common.Device{}

	grpc_server := grpc.NewServer(
		grpc.Creds(insecure.NewCredentials()),
	)

	pb.RegisterDeviceServiceServer(grpc_server, pbservice.NewDeviceService(&devices))
	pb.RegisterSensorServiceServer(grpc_server, pbservice.NewSensorService(rdb))
	pb.RegisterActuatorServiceServer(grpc_server, pbservice.NewActuatorService(mbroker))

	grpc_server.Serve(lis)

outer:
	for {
		select {
		case devices = <-dev_chan:
			// nil
		case <-ctrl.Parent:
			break outer
		}
	}

	grpc_server.Stop()

	log.Println("Relay: bye")

	ctrl.Child <- 1

}
