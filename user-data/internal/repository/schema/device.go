package schema

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
)

type Device struct {
	ID       string `gorm:"primaryKey"`
	GardenID uuid.UUID
	Garden   Garden
	Type     model.DeviceType
}
