package model

import "github.com/google/uuid"

type Plant struct {
	ID          uuid.UUID
	GardenID    uuid.UUID
	FactsheetID string
	Name        string
}
