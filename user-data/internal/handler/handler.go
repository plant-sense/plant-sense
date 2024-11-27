package handler

import (
	"context"
	"github.com/plant-sense/user-data/internal/api"
)

var _ api.StrictServerInterface = (*handler)(nil)

type handler struct {
}

// GetGardens implements api.StrictServerInterface.
func (h *handler) GetGardens(ctx context.Context, request api.GetGardensRequestObject) (api.GetGardensResponseObject, error) {
	panic("unimplemented")
}

// GetGardensIdPlants implements api.StrictServerInterface.
func (h *handler) GetGardensIdPlants(ctx context.Context, request api.GetGardensIdPlantsRequestObject) (api.GetGardensIdPlantsResponseObject, error) {
	panic("unimplemented")
}

// GetGardensIdSensors implements api.StrictServerInterface.
func (h *handler) GetGardensIdSensors(ctx context.Context, request api.GetGardensIdSensorsRequestObject) (api.GetGardensIdSensorsResponseObject, error) {
	panic("unimplemented")
}

// GetPlantsId implements api.StrictServerInterface.
func (h *handler) GetPlantsId(ctx context.Context, request api.GetPlantsIdRequestObject) (api.GetPlantsIdResponseObject, error) {
	panic("unimplemented")
}

// PatchGardensIdSensors implements api.StrictServerInterface.
func (h *handler) PatchGardensIdSensors(ctx context.Context, request api.PatchGardensIdSensorsRequestObject) (api.PatchGardensIdSensorsResponseObject, error) {
	panic("unimplemented")
}

// PostGardens implements api.StrictServerInterface.
func (h *handler) PostGardens(ctx context.Context, request api.PostGardensRequestObject) (api.PostGardensResponseObject, error) {
	panic("unimplemented")
}

// PostGardensIdPlants implements api.StrictServerInterface.
func (h *handler) PostGardensIdPlants(ctx context.Context, request api.PostGardensIdPlantsRequestObject) (api.PostGardensIdPlantsResponseObject, error) {
	panic("unimplemented")
}

// PutPlantsId implements api.StrictServerInterface.
func (h *handler) PutPlantsId(ctx context.Context, request api.PutPlantsIdRequestObject) (api.PutPlantsIdResponseObject, error) {
	panic("unimplemented")
}

func NewHandler() api.StrictServerInterface {
	return &handler{}
}
