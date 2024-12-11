package model

import "github.com/google/uuid"

type Garden struct {
	ID   uuid.UUID
	Name string
}
