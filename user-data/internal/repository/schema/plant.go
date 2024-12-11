package schema

import "github.com/google/uuid"

type Plant struct {
	ID          uuid.UUID `gorm:"primaryKey"`
	GardenID    uuid.UUID
	Garden      Garden
	Name        string
	FactsheetID string
}
