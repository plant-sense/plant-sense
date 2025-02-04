package handler

import (
	"github.com/plant-sense/plants-db/internal/api"
	"github.com/plant-sense/plants-db/internal/repository"
)

var _ api.StrictServerInterface = (*handler)(nil)

type handler struct {
	plantRepo repository.PlantRepository
}

func NewHandler(plantRepo repository.PlantRepository) api.StrictServerInterface {
	return &handler{
		plantRepo: plantRepo,
	}
}
