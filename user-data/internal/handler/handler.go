package handler

import (
	"github.com/plant-sense/user-data/internal/api"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/service"
)

var _ api.StrictServerInterface = (*handler)(nil)

type handler struct {
	gardenService service.GardenService
	plantService  service.PlantService
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

func NewHandler(gardenService service.GardenService, plantService service.PlantService) api.StrictServerInterface {
	return &handler{
		gardenService: gardenService,
		plantService:  plantService,
	}
}
