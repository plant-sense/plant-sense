package repository_test

import (
	"testing"

	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository"
	"github.com/stretchr/testify/assert"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func setupTestDB(t *testing.T) *gorm.DB {
	db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})
	assert.NoError(t, err)
	err = db.AutoMigrate(&model.Plant{})
	assert.NoError(t, err)
	return db
}

func TestPlantRepository(t *testing.T) {
	db := setupTestDB(t)
	repo := repository.NewPlantRepository(db)

	t.Run("AddPlant", func(t *testing.T) {
		plant := model.Plant{
			ID:          uuid.New(),
			GardenID:    uuid.New(),
			Name:        "Rose",
			FactsheetID: "123",
		}
		addedPlant, err := repo.AddPlant(plant)
		assert.NoError(t, err)
		assert.Equal(t, plant.Name, addedPlant.Name)
	})

	t.Run("GetPlantsByGardenID", func(t *testing.T) {
		gardenID := uuid.New()
		plant1 := model.Plant{ID: uuid.New(), GardenID: gardenID, Name: "Tulip", FactsheetID: "456"}
		plant2 := model.Plant{ID: uuid.New(), GardenID: gardenID, Name: "Daisy", FactsheetID: "789"}
		_, _ = repo.AddPlant(plant1)
		_, _ = repo.AddPlant(plant2)

		plants, err := repo.GetPlantsByGardenID(gardenID)
		assert.NoError(t, err)
		assert.Len(t, plants, 2)
	})

	t.Run("GetPlantByID", func(t *testing.T) {
		plant := model.Plant{
			ID:          uuid.New(),
			GardenID:    uuid.New(),
			Name:        "Sunflower",
			FactsheetID: "101",
		}
		_, _ = repo.AddPlant(plant)

		foundPlant, err := repo.GetPlantByID(plant.ID)
		assert.NoError(t, err)
		assert.Equal(t, plant.Name, foundPlant.Name)
	})

	t.Run("UpdatePlant", func(t *testing.T) {
		plant := model.Plant{
			ID:          uuid.New(),
			GardenID:    uuid.New(),
			Name:        "Lily",
			FactsheetID: "202",
		}
		_, _ = repo.AddPlant(plant)

		plant.Name = "Lily Updated"
		updatedPlant, err := repo.UpdatePlant(plant)
		assert.NoError(t, err)
		assert.Equal(t, "Lily Updated", updatedPlant.Name)
	})
}
