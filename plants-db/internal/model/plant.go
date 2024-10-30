package model

import "github.com/google/uuid"

type Plant struct {
	ID             uuid.UUID
	CommonName     string
	ScientificName string
}
