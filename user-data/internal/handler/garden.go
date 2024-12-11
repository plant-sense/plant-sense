package handler

import (
	"context"

	"github.com/plant-sense/user-data/internal/api"
	"github.com/plant-sense/user-data/internal/model"
)

func (h *handler) GetGardens(ctx context.Context, request api.GetGardensRequestObject) (api.GetGardensResponseObject, error) {
	return api.GetGardens200JSONResponse(convertGardens(h.gardenService.GetGardens())), nil
}

func (h *handler) GetGardensIdPlants(ctx context.Context, request api.GetGardensIdPlantsRequestObject) (api.GetGardensIdPlantsResponseObject, error) {
	plants, err := h.gardenService.GetGardenPlants(request.Id)
	if err != nil {
		return api.GetGardensIdPlants500Response{}, err
	}
	return api.GetGardensIdPlants200JSONResponse(convertPlants(plants)), nil
}

func (h *handler) PostGardens(ctx context.Context, request api.PostGardensRequestObject) (api.PostGardensResponseObject, error) {
	garden, err := h.gardenService.CreateGarden(request.Body.Name)
	if err != nil {
		return api.PostGardens500Response{}, err
	}
	return api.PostGardens200JSONResponse{
		Id:   garden.ID,
		Name: garden.Name,
	}, nil
}

func (h *handler) PostGardensIdPlants(ctx context.Context, request api.PostGardensIdPlantsRequestObject) (api.PostGardensIdPlantsResponseObject, error) {
	plant, err := h.gardenService.AddPlantToGarden(request.Id, request.Body.Name, request.Body.FactsheetId)
	if err != nil {
		return api.PostGardensIdPlants500Response{}, err
	}
	return api.PostGardensIdPlants200JSONResponse(convertPlants([]model.Plant{plant})), nil
}
