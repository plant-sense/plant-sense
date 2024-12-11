package repository

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"gorm.io/gorm"
)

type GardenRepository interface {
	GetGardens() []model.Garden
	CreateGarden(garden model.Garden) (model.Garden, error)
	GetGardenByID(id uuid.UUID) (model.Garden, error)
}

var _ GardenRepository = &gardenRepository{}

type gardenRepository struct {
	db *gorm.DB
}

func (g *gardenRepository) GetGardens() []model.Garden {
	var gardens []model.Garden
	g.db.Find(&gardens)
	return gardens
}

func (g *gardenRepository) CreateGarden(garden model.Garden) (model.Garden, error) {
	result := g.db.Create(&garden)
	return garden, result.Error
}

func (g *gardenRepository) GetGardenByID(id uuid.UUID) (model.Garden, error) {
	var garden model.Garden
	result := g.db.First(&garden, "id = ?", id)
	return garden, result.Error
}

func NewGardenRepository(db *gorm.DB) *gardenRepository {
	return &gardenRepository{db: db}
}
