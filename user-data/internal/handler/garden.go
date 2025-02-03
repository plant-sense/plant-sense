package handler

import (
	"context"

	"github.com/plant-sense/user-data/internal/api"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/rs/zerolog/log"
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

// PutGardensId implements api.StrictServerInterface.
func (h *handler) PutGardensId(ctx context.Context, request api.PutGardensIdRequestObject) (api.PutGardensIdResponseObject, error) {
	garden, err := h.gardenService.UpdateGarden(model.Garden{ID: request.Id, Name: request.Body.Name})
	if err != nil {
		return api.PutGardensId500Response{}, err
	}
	return api.PutGardensId200JSONResponse{
		Id:   garden.ID,
		Name: garden.Name,
	}, nil
}

// DeleteGardensId implements api.StrictServerInterface.
func (h *handler) DeleteGardensId(ctx context.Context, request api.DeleteGardensIdRequestObject) (api.DeleteGardensIdResponseObject, error) {
	err := h.gardenService.DeleteGarden(request.Id)
	if err != nil {
		return api.DeleteGardensId500Response{}, err
	}
	return api.DeleteGardensId200Response{}, nil
}

func (h *handler) PostGardensIdPlants(ctx context.Context, request api.PostGardensIdPlantsRequestObject) (api.PostGardensIdPlantsResponseObject, error) {
	plant, err := h.gardenService.AddPlantToGarden(request.Id, request.Body.Name, request.Body.FactsheetId)
	if err != nil {
		log.Error().Err(err).Msg("failed to add plant to garden")
		return api.PostGardensIdPlants500Response{}, err
	}
	return api.PostGardensIdPlants200JSONResponse(convertPlants([]model.Plant{plant})), nil
}
