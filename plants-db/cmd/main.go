package main

import (
	"context"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/plant-sense/plants-db/internal/api"
	"github.com/plant-sense/plants-db/internal/config"
	"github.com/plant-sense/plants-db/internal/handler"
	custLog "github.com/plant-sense/plants-db/internal/log"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func main() {
	if config.DefaultConfig.PrettyLog {
		log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
	}

	r := chi.NewRouter()
	r.Use(custLog.RequestLogger)
	r.Use(middleware.Recoverer)

	handler := handler.NewHandler()
	sh := api.NewStrictHandler(handler, nil)
	r.Mount("/", api.Handler(sh))

	log.Info().Msg("Starting server on :8080")
	server := &http.Server{
		Addr:    ":8080",
		Handler: r,
	}

	sig := make(chan os.Signal, 1)
	signal.Notify(sig, syscall.SIGHUP, syscall.SIGINT, syscall.SIGTERM, syscall.SIGQUIT)
	serverCtx, serverStopCtx := context.WithCancel(context.Background())
	go func() {
		<-sig

		// Shutdown signal with grace period of 30 seconds
		shutdownCtx, _ := context.WithTimeout(serverCtx, 30*time.Second)

		go func() {
			<-shutdownCtx.Done()
			if shutdownCtx.Err() == context.DeadlineExceeded {
				log.Fatal().Msg("graceful shutdown timed out.. forcing exit.")
			}
		}()

		// Trigger graceful shutdown
		err := server.Shutdown(shutdownCtx)
		if err != nil {
			log.Fatal().Msg(err.Error())
		}
		serverStopCtx()
	}()

	err := server.ListenAndServe()
	if err != nil && err != http.ErrServerClosed {
		log.Fatal().Msg(err.Error())
	}
	<-serverCtx.Done()
}
