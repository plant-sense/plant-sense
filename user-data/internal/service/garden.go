package service

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository"
)

type GardenService interface {
	GetGardens() []model.Garden
	CreateGarden(name string) (model.Garden, error)
	GetGardenPlants(gardenID uuid.UUID) ([]model.Plant, error)
	AddPlantToGarden(gardenID uuid.UUID, name string, factsheetID uuid.UUID) (model.Plant, error)
}

type gardenService struct {
	gardenRepo repository.GardenRepository
	plantRepo  repository.PlantRepository
}

func (s *gardenService) GetGardens() []model.Garden {
	return s.gardenRepo.GetGardens()
}

func (s *gardenService) CreateGarden(name string) (model.Garden, error) {
	garden := model.Garden{
		ID:   uuid.New(),
		Name: name,
	}
	return s.gardenRepo.CreateGarden(garden)
}

func (s *gardenService) GetGardenPlants(gardenID uuid.UUID) ([]model.Plant, error) {
	return s.plantRepo.GetPlantsByGardenID(gardenID)
}

func (s *gardenService) AddPlantToGarden(gardenID uuid.UUID, name string, factsheetID uuid.UUID) (model.Plant, error) {
	plant := model.Plant{
		ID:          uuid.New(),
		GardenID:    gardenID,
		Name:        name,
		FactsheetID: factsheetID,
	}
	return s.plantRepo.AddPlant(plant)
}

func NewGardenService(gardenRepo repository.GardenRepository, plantRepo repository.PlantRepository) GardenService {
	return &gardenService{
		gardenRepo: gardenRepo,
		plantRepo:  plantRepo,
	}
}
