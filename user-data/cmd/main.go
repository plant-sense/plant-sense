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
	"github.com/go-chi/cors"
	"github.com/ironstar-io/chizerolog"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"

	"github.com/plant-sense/user-data/internal/api"
	"github.com/plant-sense/user-data/internal/config"
	"github.com/plant-sense/user-data/internal/handler"
	"github.com/plant-sense/user-data/internal/repository"
	"github.com/plant-sense/user-data/internal/repository/schema"
	"github.com/plant-sense/user-data/internal/service"
)

func main() {
	if config.DefaultConfig.PrettyLog {
		log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
	}

	r := chi.NewRouter()
	r.Use(chizerolog.LoggerMiddleware(&log.Logger))
	r.Use(middleware.Recoverer)
	r.Use(cors.Handler(cors.Options{
		AllowedOrigins:   []string{"*"},
		AllowedMethods:   []string{http.MethodGet, http.MethodPost, http.MethodPatch, http.MethodPut, http.MethodDelete},
		AllowedHeaders:   []string{"*"},
		ExposedHeaders:   []string{"*"},
		AllowCredentials: true,
		MaxAge:           300,
	}))

	db, err := gorm.Open(sqlite.Open("user-data.db"), &gorm.Config{})
	if err != nil {
		log.Fatal().Msg(err.Error())
	}
	db.AutoMigrate(&schema.Plant{}, &schema.Garden{})

	gardenRepo := repository.NewGardenRepository(db)
	plantRepo := repository.NewPlantRepository(db)

	gardenService := service.NewGardenService(gardenRepo, plantRepo)
	plantService := service.NewPlantService(plantRepo)
	handler := handler.NewHandler(gardenService, plantService)

	sh := api.NewStrictHandler(handler, nil)
	r.Mount("/", api.Handler(sh))

	log.Info().Msg("Starting server on :9090")
	server := &http.Server{
		Addr:    ":9090",
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

	err = server.ListenAndServe()
	if err != nil && err != http.ErrServerClosed {
		log.Fatal().Msg(err.Error())
	}
	<-serverCtx.Done()
}
