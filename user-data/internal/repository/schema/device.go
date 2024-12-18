package schema

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
)

type Device struct {
	DeviceID string
	GardenID uuid.UUID
	Garden   Garden
	Type     model.DeviceType
}
