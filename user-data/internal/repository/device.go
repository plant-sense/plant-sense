package repository

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository/schema"
	"gorm.io/gorm"
)

type DeviceRepository interface {
	GetDevices(gardenID uuid.UUID) []model.Device
	AddDevice(gardenID uuid.UUID, device model.Device) (model.Device, error)
	DeleteDevice(gardenID uuid.UUID, deviceID string) error
}

var _ DeviceRepository = &deviceRepository{}

type deviceRepository struct {
	db *gorm.DB
}

func (d *deviceRepository) GetDevices(gardenID uuid.UUID) []model.Device {
	var devices []schema.Device
	d.db.Where("garden_id = ?", gardenID).Find(&devices)

	var result []model.Device
	for _, device := range devices {
		result = append(result, model.Device{
			ID:   device.DeviceID,
			Type: device.Type,
		})
	}
	return result
}

// AddDevice implements DeviceRepository.
func (d *deviceRepository) AddDevice(gardenID uuid.UUID, device model.Device) (model.Device, error) {
	schemaDevice := schema.Device{
		DeviceID: device.ID,
		GardenID: gardenID,
		Type:     device.Type,
	}
	result := d.db.Create(&schemaDevice)
	return model.Device{
		ID:   schemaDevice.DeviceID,
		Type: schemaDevice.Type,
	}, result.Error
}

func (d *deviceRepository) DeleteDevice(gardenID uuid.UUID, deviceID string) error {
	result := d.db.Where("garden_id = ? AND device_id = ?", gardenID, deviceID).Delete(&schema.Device{})
	return result.Error
}

func NewDeviceRepository(db *gorm.DB) DeviceRepository {
	return &deviceRepository{db: db}
}
