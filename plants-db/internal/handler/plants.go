package handler

import (
	"context"

	"github.com/plant-sense/plants-db/internal/api"
)

// GetPlants implements api.StrictServerInterface.
func (h *handler) GetPlants(ctx context.Context, request api.GetPlantsRequestObject) (api.GetPlantsResponseObject, error) {
	plants, err := h.plantRepo.GetPlants()
	if err != nil {
		return api.GetPlants500Response{}, err
	}

	plantResponses := make([]api.Plant, 0, len(plants))
	for _, plant := range plants {
		plantResponses = append(plantResponses, api.Plant{
			Id:             plant.ID,
			CommonName:     plant.CommonName,
			ScientificName: plant.ScientificName,
		})
	}

	return api.GetPlants200JSONResponse(plantResponses), nil
}

// GetPlantsId implements api.StrictServerInterface.
func (h *handler) GetPlantsId(ctx context.Context, request api.GetPlantsIdRequestObject) (api.GetPlantsIdResponseObject, error) {
	panic("unimplemented")
}
