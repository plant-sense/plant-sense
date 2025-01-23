package main

import (
	"context"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"
	"time"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"github.com/redis/go-redis/v9"

	"monitoring-agent/internal/common"
	"monitoring-agent/internal/listener"
	"monitoring-agent/internal/relay"
)

func setIfNone(envvar *string, defval string) {
	if envvar == nil {
		envvar = new(string)
		*envvar = defval
		return
	}
	if *envvar == "" {
		*envvar = defval
	}
}

func main() {

	// Get env

	m_addr := os.Getenv("MQTT_ADDRESS")
	r_addr := os.Getenv("REDIS_ADDRESS")

	setIfNone(&m_addr, "localhost:1883")
	setIfNone(&r_addr, "localhost:6379")

	// Open Relay Port

	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("failed to listen on port 50051: %v", err)
	}

	r_opts := redis.Options{
		Network:  "tcp",
		Addr:     r_addr,
		Password: "", //no pass
		DB:       0,  // default db
	}

	rdb := redis.NewClient(&r_opts)

	if r_ping := rdb.Ping(context.Background()); r_ping == nil || r_ping.Err() != nil {
		log.Fatalf("failed to connect to the redis db @ %s: %v", r_addr, r_ping.Err())
	}

	m_opts := mqtt.NewClientOptions().
		AddBroker("tcp://" + m_addr).
		SetClientID("monitoring-agent").
		SetCleanSession(true).
		SetAutoReconnect(true).
		SetConnectTimeout(time.Second)

	mbroker := mqtt.NewClient(m_opts)

	if token := mbroker.Connect(); token.Wait() && token.Error() != nil {
		log.Fatalf("failed to connec to to mqtt broker")
	}

	// Setup IPC

	sig_chan := make(chan os.Signal, 1)
	dev_chan := make(chan []common.Device)
	relay_ctrl := common.Control{
		Parent: make(chan int, 1),
		Child:  make(chan int, 1),
	}
	listener_ctrl := common.Control{
		Parent: make(chan int, 1),
		Child:  make(chan int, 1),
	}

	go listener.Listener_routine(mbroker, rdb, dev_chan, &listener_ctrl)
	go relay.Relay_routine(rdb, lis, mbroker, dev_chan, &relay_ctrl)

	signal.Notify(sig_chan, syscall.SIGINT, syscall.SIGTERM)

	<-sig_chan

	relay_ctrl.Parent <- 1
	listener_ctrl.Parent <- 1

	// ignore noncompliant children

	timeout_ch := make(chan bool)
	go func(checked chan<- bool) {
		time.Sleep(1 * time.Second)
		checked <- true
	}(timeout_ch)

	select {
	case <-relay_ctrl.Child:
		break
	case <-timeout_ch:
		log.Println("Children timed out")
		goto cleanup
	}
	select {
	case <-listener_ctrl.Child:
		break
	case <-timeout_ch:
		log.Println("Children timed out")
		goto cleanup
	}

cleanup:
	mbroker.Disconnect(10)
	rdb.Close()
	lis.Close()

	log.Println("Goodbye")
	return
}
