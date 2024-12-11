package repository

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"gorm.io/gorm"
)

type PlantSchema struct {
	ID          uuid.UUID `gorm:"primaryKey"`
	GardenID    uuid.UUID
	Garden      GardenSchema
	Name        string
	FactsheetID uuid.UUID
}

type PlantRepository interface {
	GetPlantsByGardenID(gardenID uuid.UUID) ([]model.Plant, error)
	AddPlant(plant model.Plant) (model.Plant, error)
	GetPlantByID(id uuid.UUID) (model.Plant, error)
}

type plantRepository struct {
	db *gorm.DB
}

func (p *plantRepository) GetPlantsByGardenID(gardenID uuid.UUID) ([]model.Plant, error) {
	var plants []model.Plant
	result := p.db.Where("garden_id = ?", gardenID).Find(&plants)
	return plants, result.Error
}

func (p *plantRepository) AddPlant(plant model.Plant) (model.Plant, error) {
	result := p.db.Create(&plant)
	return plant, result.Error
}

func (p *plantRepository) GetPlantByID(id uuid.UUID) (model.Plant, error) {
	var plant model.Plant
	result := p.db.First(&plant, "id = ?", id)
	return plant, result.Error
}

func NewPlantRepository(db *gorm.DB) PlantRepository {
	return &plantRepository{db: db}
}
