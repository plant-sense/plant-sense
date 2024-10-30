package repository

import (
	"github.com/google/uuid"
	"github.com/plant-sense/plants-db/internal/model"
)

type PlantRepository interface {
	GetPlants() ([]model.Plant, error)
	GetPlantByID(id uuid.UUID) (model.Plant, error)
}

type plantRepository struct {
}

var _ PlantRepository = (*plantRepository)(nil)

func NewPlantRepository() *plantRepository {
	return &plantRepository{}
}

var plants = []model.Plant{
	{
		ID:             uuid.New(),
		CommonName:     "Aloe Vera",
		ScientificName: "Aloe Vera",
	},
	{
		ID:             uuid.New(),
		CommonName:     "Basil",
		ScientificName: "Ocimum basilicum",
	},
	{
		ID:             uuid.New(),
		CommonName:     "Mint",
		ScientificName: "Mentha",
	},
}

// GetPlantByID implements PlantRepository.
func (p *plantRepository) GetPlantByID(id uuid.UUID) (model.Plant, error) {
	for _, plant := range plants {
		if plant.ID == id {
			return plant, nil
		}
	}
	return model.Plant{}, nil
}

// GetPlants implements PlantRepository.
func (p *plantRepository) GetPlants() ([]model.Plant, error) {
	return plants, nil
}
