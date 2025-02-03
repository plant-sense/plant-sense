package repository

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/repository/schema"
	"gorm.io/gorm"
)

type GardenRepository interface {
	GetGardens() []schema.Garden
	CreateGarden(garden schema.Garden) (schema.Garden, error)
	GetGardenByID(id uuid.UUID) (schema.Garden, error)
	UpdateGarden(garden schema.Garden) (schema.Garden, error)
	DeleteGarden(id uuid.UUID) error
}

var _ GardenRepository = &gardenRepository{}

type gardenRepository struct {
	db *gorm.DB
}

func (g *gardenRepository) GetGardens() []schema.Garden {
	var gardens []schema.Garden
	g.db.Find(&gardens)
	return gardens
}

func (g *gardenRepository) CreateGarden(garden schema.Garden) (schema.Garden, error) {
	result := g.db.Create(&garden)
	return garden, result.Error
}

func (g *gardenRepository) GetGardenByID(id uuid.UUID) (schema.Garden, error) {
	var garden schema.Garden
	result := g.db.First(&garden, id)
	return garden, result.Error
}

func (g *gardenRepository) UpdateGarden(garden schema.Garden) (schema.Garden, error) {
	result := g.db.Save(&garden)
	return garden, result.Error
}

func (g *gardenRepository) DeleteGarden(id uuid.UUID) error {
	result := g.db.Delete(&schema.Garden{}, id)
	return result.Error
}

func NewGardenRepository(db *gorm.DB) *gardenRepository {
	return &gardenRepository{db: db}
}
