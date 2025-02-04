package repository_test

import (
	"testing"

	"github.com/google/uuid"
	"github.com/plant-sense/plants-db/internal/repository"
	"github.com/stretchr/testify/assert"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func setupTestDB(t *testing.T) *gorm.DB {
	db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})
	if err != nil {
		t.Fatalf("failed to connect to database: %v", err)
	}

	err = db.AutoMigrate(&repository.PlantSchema{})
	if err != nil {
		t.Fatalf("failed to migrate database: %v", err)
	}

	return db
}

func seedTestData(t *testing.T, db *gorm.DB) []repository.PlantSchema {
	testPlants := []repository.PlantSchema{
		{
			ID:                 uuid.New(),
			CommonName:         "Snake Plant",
			ScientificName:     "Sansevieria trifasciata",
			TemperatureMin:     15,
			TemperatureMax:     30,
			TemperatureUnit:    "C",
			SoilMoistureMin:    20,
			SoilMoistureMax:    40,
			SoilMoistureUnit:   "%",
			LightIntensityMin:  100,
			LightIntensityMax:  1000,
			LightIntensityUnit: "lux",
		},
		{
			ID:                 uuid.New(),
			CommonName:         "Spider Plant",
			ScientificName:     "Chlorophytum comosum",
			TemperatureMin:     18,
			TemperatureMax:     32,
			TemperatureUnit:    "C",
			SoilMoistureMin:    30,
			SoilMoistureMax:    60,
			SoilMoistureUnit:   "%",
			LightIntensityMin:  200,
			LightIntensityMax:  1500,
			LightIntensityUnit: "lux",
		},
	}

	result := db.Create(&testPlants)
	if result.Error != nil {
		t.Fatalf("failed to seed test data: %v", result.Error)
	}

	return testPlants
}

func TestGetPlants(t *testing.T) {
	db := setupTestDB(t)
	repo := repository.NewPlantRepository(db)
	testPlants := seedTestData(t, db)

	plants, err := repo.GetPlants()
	assert.NoError(t, err)
	assert.Len(t, plants, len(testPlants))

	for i, plant := range plants {
		assert.Equal(t, testPlants[i].ID, plant.ID)
		assert.Equal(t, testPlants[i].CommonName, plant.CommonName)
		assert.Equal(t, testPlants[i].ScientificName, plant.ScientificName)
		assert.Equal(t, testPlants[i].TemperatureMin, plant.Temperature.Min)
		assert.Equal(t, testPlants[i].TemperatureMax, plant.Temperature.Max)
		assert.Equal(t, testPlants[i].TemperatureUnit, plant.Temperature.Unit)
	}
}

func TestGetPlantByID(t *testing.T) {
	db := setupTestDB(t)
	repo := repository.NewPlantRepository(db)
	testPlants := seedTestData(t, db)

	t.Run("existing plant", func(t *testing.T) {
		plant, err := repo.GetPlantByID(testPlants[0].ID)
		assert.NoError(t, err)
		assert.Equal(t, testPlants[0].ID, plant.ID)
		assert.Equal(t, testPlants[0].CommonName, plant.CommonName)
		assert.Equal(t, testPlants[0].ScientificName, plant.ScientificName)
	})

	t.Run("non-existing plant", func(t *testing.T) {
		plant, err := repo.GetPlantByID(uuid.New())
		assert.NoError(t, err)
		assert.Empty(t, plant)
	})
}

func TestSearchPlants(t *testing.T) {
	db := setupTestDB(t)
	repo := repository.NewPlantRepository(db)
	testPlants := seedTestData(t, db)

	t.Run("search by common name", func(t *testing.T) {
		plants, err := repo.SearchPlants("Snake")
		assert.NoError(t, err)
		assert.Len(t, plants, 1)
		assert.Equal(t, testPlants[0].ID, plants[0].ID)
		assert.Equal(t, testPlants[0].CommonName, plants[0].CommonName)
	})

	t.Run("search by scientific name", func(t *testing.T) {
		plants, err := repo.SearchPlants("comosum")
		assert.NoError(t, err)
		assert.Len(t, plants, 1)
		assert.Equal(t, testPlants[1].ID, plants[0].ID)
		assert.Equal(t, testPlants[1].ScientificName, plants[0].ScientificName)
	})

	t.Run("no results", func(t *testing.T) {
		plants, err := repo.SearchPlants("Cactus")
		assert.NoError(t, err)
		assert.Empty(t, plants)
	})
}
