package handler

import (
	"github.com/plant-sense/plants-db/internal/api"
	"github.com/plant-sense/plants-db/internal/repository"
)

var _ api.StrictServerInterface = (*handler)(nil)

type handler struct {
	plantRepo repository.PlantRepository
}

func NewHandler() api.StrictServerInterface {
	return &handler{
		plantRepo: repository.NewPlantRepository(),
	}
}
