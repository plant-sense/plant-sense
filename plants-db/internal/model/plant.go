package model

import "github.com/google/uuid"

type Plant struct {
	ID              uuid.UUID
	CommonName      string
	ScientificName  string
	Temperature     Requirement
	SoilMoisture    Requirement
	LightIntensity  Requirement
	DefaultImageURL *string
}
