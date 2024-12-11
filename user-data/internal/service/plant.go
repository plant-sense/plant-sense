package service

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository"
)

type PlantService interface {
	GetPlantByID(id uuid.UUID) (model.Plant, error)
	UpdatePlant(plant model.Plant) (model.Plant, error)
	GetPlantsByGardenID(gardenID uuid.UUID) ([]model.Plant, error)
	AddPlant(plant model.Plant) (model.Plant, error)
}

type plantService struct {
	plantRepo repository.PlantRepository
}

func (s *plantService) GetPlantByID(id uuid.UUID) (model.Plant, error) {
	return s.plantRepo.GetPlantByID(id)
}

func (s *plantService) UpdatePlant(plant model.Plant) (model.Plant, error) {
	return s.plantRepo.UpdatePlant(plant)
}

func (s *plantService) GetPlantsByGardenID(gardenID uuid.UUID) ([]model.Plant, error) {
	return s.plantRepo.GetPlantsByGardenID(gardenID)
}

func (s *plantService) AddPlant(plant model.Plant) (model.Plant, error) {
	return s.plantRepo.AddPlant(plant)
}

func NewPlantService(plantRepo repository.PlantRepository) PlantService {
	return &plantService{
		plantRepo: plantRepo,
	}
}
