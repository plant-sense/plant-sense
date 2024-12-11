package schema

import "github.com/google/uuid"

type Garden struct {
	ID   uuid.UUID `gorm:"primaryKey"`
	Name string
}
