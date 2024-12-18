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

func setupTestDBDevice(t *testing.T) *gorm.DB {
	db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})
	assert.NoError(t, err)
	err = db.AutoMigrate(&schema.Device{})
	assert.NoError(t, err)
	return db
}

func TestDeviceRepository(t *testing.T) {
	db := setupTestDBDevice(t)
	repo := repository.NewDeviceRepository(db)

	t.Run("AddDevice", func(t *testing.T) {
		device := model.Device{
			ID:   "device-1",
			Type: model.TemperatureSensor,
		}
		gardenID := uuid.New()
		addedDevice, err := repo.AddDevice(gardenID, device)
		assert.NoError(t, err)
		assert.Equal(t, device.ID, addedDevice.ID)
	})

	t.Run("GetDevices", func(t *testing.T) {
		gardenID := uuid.New()
		device1 := model.Device{ID: "device-1", Type: model.TemperatureSensor}
		device2 := model.Device{ID: "device-2", Type: model.LightSensor}
		_, _ = repo.AddDevice(gardenID, device1)
		_, _ = repo.AddDevice(gardenID, device2)

		devices := repo.GetDevices(gardenID)
		assert.Len(t, devices, 2)
	})
}
