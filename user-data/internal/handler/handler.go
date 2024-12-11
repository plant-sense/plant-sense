package handler

import (
	"context"

	"github.com/plant-sense/user-data/internal/api"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/service"
)

var _ api.StrictServerInterface = (*handler)(nil)

type handler struct {
	gardenService service.GardenService
}

func convertGardens(gardens_models []model.Garden) []api.Garden {
	gardens := make([]api.Garden, len(gardens_models))
	for i, garden := range gardens_models {
		gardens[i] = api.Garden{
			Name: garden.Name,
			Id:   garden.ID,
		}
	}
	return gardens
}

func convertPlants(plants []model.Plant) []api.Plant {
	result := make([]api.Plant, len(plants))
	for i, p := range plants {
		result[i] = api.Plant{
			Id:          p.ID,
			Name:        p.Name,
			FactsheetId: p.FactsheetID,
		}
	}
	return result
}

// GetGardens implements api.StrictServerInterface.
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

func (h *handler) GetGardensIdSensors(ctx context.Context, request api.GetGardensIdSensorsRequestObject) (api.GetGardensIdSensorsResponseObject, error) {
	panic("unimplemented")
}

func (h *handler) GetPlantsId(ctx context.Context, request api.GetPlantsIdRequestObject) (api.GetPlantsIdResponseObject, error) {
	panic("unimplemented")
}

func (h *handler) PatchGardensIdSensors(ctx context.Context, request api.PatchGardensIdSensorsRequestObject) (api.PatchGardensIdSensorsResponseObject, error) {
	panic("unimplemented")
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

func (h *handler) PutPlantsId(ctx context.Context, request api.PutPlantsIdRequestObject) (api.PutPlantsIdResponseObject, error) {
	panic("unimplemented")
}

func NewHandler(gardenService service.GardenService) api.StrictServerInterface {
	return &handler{
		gardenService: gardenService,
	}
}
