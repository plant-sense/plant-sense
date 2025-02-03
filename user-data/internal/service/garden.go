package service

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository"
	"github.com/plant-sense/user-data/internal/repository/schema"
)

type GardenService interface {
	GetGardens() []model.Garden
	CreateGarden(name string) (model.Garden, error)
	UpdateGarden(garden model.Garden) (model.Garden, error)
	DeleteGarden(id uuid.UUID) error
	GetGardenPlants(gardenID uuid.UUID) ([]model.Plant, error)
	AddPlantToGarden(gardenID uuid.UUID, name string, factsheetID string) (model.Plant, error)
}

type gardenService struct {
	gardenRepo repository.GardenRepository
	plantRepo  repository.PlantRepository
}

func (s *gardenService) modelToSchema(garden model.Garden) schema.Garden {
	return schema.Garden{
		ID:   garden.ID,
		Name: garden.Name,
	}
}

func (s *gardenService) schemaToModel(garden schema.Garden) model.Garden {
	return model.Garden{
		ID:   garden.ID,
		Name: garden.Name,
	}
}

func (s *gardenService) schemasToModels(gardens []schema.Garden) []model.Garden {
	var result []model.Garden
	for _, garden := range gardens {
		result = append(result, s.schemaToModel(garden))
	}
	return result
}

func (s *gardenService) GetGardens() []model.Garden {
	return s.schemasToModels(s.gardenRepo.GetGardens())
}

func (s *gardenService) CreateGarden(name string) (model.Garden, error) {
	garden := model.Garden{
		ID:   uuid.New(),
		Name: name,
	}
	schema, err := s.gardenRepo.CreateGarden(s.modelToSchema(garden))

	return s.schemaToModel(schema), err
}

func (s *gardenService) UpdateGarden(garden model.Garden) (model.Garden, error) {
	schema, err := s.gardenRepo.UpdateGarden(s.modelToSchema(garden))

	return s.schemaToModel(schema), err
}

func (s *gardenService) DeleteGarden(id uuid.UUID) error {
	return s.gardenRepo.DeleteGarden(id)
}

func (s *gardenService) GetGardenPlants(gardenID uuid.UUID) ([]model.Plant, error) {
	return s.plantRepo.GetPlantsByGardenID(gardenID)
}

func (s *gardenService) AddPlantToGarden(gardenID uuid.UUID, name string, factsheetID string) (model.Plant, error) {
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
