package handler

import (
	"context"

	"github.com/plant-sense/user-data/internal/api"
)

func (h *handler) GetPlantsId(ctx context.Context, request api.GetPlantsIdRequestObject) (api.GetPlantsIdResponseObject, error) {
	plant, err := h.plantService.GetPlantByID(request.Id)
	if err != nil {
		return api.GetPlantsId404Response{}, nil
	}

	return api.GetPlantsId200JSONResponse{
		FactsheetId: plant.FactsheetID,
		GardenId:    plant.GardenID,
		Id:          plant.ID,
		Name:        plant.Name,
	}, nil
}

func (h *handler) PutPlantsId(ctx context.Context, request api.PutPlantsIdRequestObject) (api.PutPlantsIdResponseObject, error) {
	plant, err := h.plantService.GetPlantByID(request.Id)
	if err != nil {
		return api.PutPlantsId404Response{}, nil
	}

	plant.Name = request.Body.Name
	plant.FactsheetID = request.Body.FactsheetId
	plant.GardenID = request.Body.GardenId

	updatedPlant, err := h.plantService.UpdatePlant(plant)
	if err != nil {
		return api.PutPlantsId500Response{}, nil
	}

	return api.PutPlantsId200JSONResponse{
		FactsheetId: updatedPlant.FactsheetID,
		GardenId:    updatedPlant.GardenID,
		Id:          updatedPlant.ID,
		Name:        updatedPlant.Name,
	}, nil
}
