package repository

import (
	"github.com/google/uuid"
	"github.com/plant-sense/plants-db/internal/model"
	"github.com/rs/zerolog/log"
	"gorm.io/gorm"
)

type PlantSchema struct {
	ID                 uuid.UUID `gorm:"primaryKey"`
	CommonName         string
	ScientificName     string
	TemperatureMin     float64
	TemperatureMax     float64
	TemperatureUnit    string
	SoilMoistureMin    float64
	SoilMoistureMax    float64
	SoilMoistureUnit   string
	LightIntensityMin  float64
	LightIntensityMax  float64
	LightIntensityUnit string
}

type PlantRepository interface {
	GetPlants() ([]model.Plant, error)
	GetPlantByID(id uuid.UUID) (model.Plant, error)
	SearchPlants(query string) ([]model.Plant, error)
}

type plantRepository struct {
	db *gorm.DB
}

var _ PlantRepository = (*plantRepository)(nil)

func NewPlantRepository(db *gorm.DB) *plantRepository {
	return &plantRepository{db: db}
}

func (p *plantRepository) schemaToModel(schema PlantSchema) model.Plant {
	return model.Plant{
		ID:             schema.ID,
		CommonName:     schema.CommonName,
		ScientificName: schema.ScientificName,
		Temperature: model.Requirement{
			Min:  schema.TemperatureMin,
			Max:  schema.TemperatureMax,
			Unit: schema.TemperatureUnit,
		},
		SoilMoisture: model.Requirement{
			Min:  schema.SoilMoistureMin,
			Max:  schema.SoilMoistureMax,
			Unit: schema.SoilMoistureUnit,
		},
		LightIntensity: model.Requirement{
			Min:  schema.LightIntensityMin,
			Max:  schema.LightIntensityMax,
			Unit: schema.LightIntensityUnit,
		},
	}
}

// GetPlantByID implements PlantRepository.
func (p *plantRepository) GetPlantByID(id uuid.UUID) (model.Plant, error) {
	var plantSchema PlantSchema
	result := p.db.First(&plantSchema, "id = ?", id)
	if result.Error != nil {
		if result.Error == gorm.ErrRecordNotFound {
			return model.Plant{}, nil
		}
		return model.Plant{}, result.Error
	}

	return p.schemaToModel(plantSchema), nil
}

// GetPlants implements PlantRepository.
func (p *plantRepository) GetPlants() ([]model.Plant, error) {
	var plantSchemas []PlantSchema
	result := p.db.Find(&plantSchemas)
	if result.Error != nil {
		return nil, result.Error
	}

	plants := make([]model.Plant, len(plantSchemas))
	for i, schema := range plantSchemas {
		plants[i] = p.schemaToModel(schema)
	}
	return plants, nil
}

// SearchPlants implements PlantRepository
func (p *plantRepository) SearchPlants(query string) ([]model.Plant, error) {
	var plantSchemas []PlantSchema
	result := p.db.Where("common_name LIKE ? OR scientific_name LIKE ?", "%"+query+"%", "%"+query+"%").Find(&plantSchemas)
	if result.Error != nil {
		return nil, result.Error
	}
	log.Info().Msgf("Found %d plants for query %s", len(plantSchemas), query)

	plants := make([]model.Plant, len(plantSchemas))
	for i, schema := range plantSchemas {
		plants[i] = p.schemaToModel(schema)
	}
	return plants, nil
}
