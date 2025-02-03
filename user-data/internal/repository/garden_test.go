package repository_test

import (
	"testing"

	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository"
	"github.com/plant-sense/user-data/internal/repository/schema"
	"github.com/stretchr/testify/assert"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func setupTestDBGarden(t *testing.T) *gorm.DB {
	db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})
	assert.NoError(t, err)
	err = db.AutoMigrate(&model.Garden{})
	assert.NoError(t, err)
	return db
}

func TestGardenRepository(t *testing.T) {
	db := setupTestDBGarden(t)
	repo := repository.NewGardenRepository(db)

	t.Run("CreateGarden", func(t *testing.T) {
		garden := schema.Garden{
			ID:   uuid.New(),
			Name: "My Garden",
		}
		createdGarden, err := repo.CreateGarden(garden)
		assert.NoError(t, err)
		assert.Equal(t, garden.Name, createdGarden.Name)
	})

	t.Run("GetGardens", func(t *testing.T) {
		garden1 := schema.Garden{ID: uuid.New(), Name: "Garden 1"}
		garden2 := schema.Garden{ID: uuid.New(), Name: "Garden 2"}
		_, _ = repo.CreateGarden(garden1)
		_, _ = repo.CreateGarden(garden2)

		gardens := repo.GetGardens()
		assert.Len(t, gardens, 3)
	})

	t.Run("GetGardenByID", func(t *testing.T) {
		garden := schema.Garden{
			ID:   uuid.New(),
			Name: "Special Garden",
		}
		_, _ = repo.CreateGarden(garden)

		foundGarden, err := repo.GetGardenByID(garden.ID)
		assert.NoError(t, err)
		assert.Equal(t, garden.Name, foundGarden.Name)
	})
}
