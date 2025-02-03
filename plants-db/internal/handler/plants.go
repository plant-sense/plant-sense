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
			Id: plant.ID,
			Taxonomy: api.Taxonomy{
				CommonName:     plant.CommonName,
				ScientificName: plant.ScientificName,
			},
		})
	}

	return api.GetPlants200JSONResponse(plantResponses), nil
}

// GetPlantsId implements api.StrictServerInterface.
func (h *handler) GetPlantsId(ctx context.Context, request api.GetPlantsIdRequestObject) (api.GetPlantsIdResponseObject, error) {
	plant, err := h.plantRepo.GetPlantByID(request.Id)
	if err != nil {
		return api.GetPlantsId500Response{}, err
	}
	if plant.ID == [16]byte{} { // checking for zero UUID
		return api.GetPlantsId404Response{}, nil
	}

	return api.GetPlantsId200JSONResponse{
		Id: plant.ID,
		Taxonomy: api.Taxonomy{
			CommonName:     plant.CommonName,
			ScientificName: plant.ScientificName,
		},
		Requirements: api.Requirements{
			Temperature: api.Requirement{
				Max:  plant.Temperature.Max,
				Min:  plant.Temperature.Min,
				Unit: plant.Temperature.Unit,
			},
			SoilMoisture: api.Requirement{
				Max:  plant.SoilMoisture.Max,
				Min:  plant.SoilMoisture.Min,
				Unit: plant.SoilMoisture.Unit,
			},
			LightIntensity: api.Requirement{
				Max:  plant.LightIntensity.Max,
				Min:  plant.LightIntensity.Min,
				Unit: plant.LightIntensity.Unit,
			},
		},
		Assets: api.Assets{
			DefaultImageUrl: plant.DefaultImageURL,
		},
	}, nil
}

// GetPlantsIdRequirements implements api.StrictServerInterface.
func (h *handler) GetPlantsIdRequirements(ctx context.Context, request api.GetPlantsIdRequirementsRequestObject) (api.GetPlantsIdRequirementsResponseObject, error) {
	plant, err := h.plantRepo.GetPlantByID(request.Id)
	if err != nil {
		return api.GetPlantsIdRequirements500Response{}, err
	}
	if plant.ID == [16]byte{} {
		return api.GetPlantsIdRequirements404Response{}, nil
	}

	return api.GetPlantsIdRequirements200JSONResponse{
		Temperature: api.Requirement{
			Max:  plant.Temperature.Max,
			Min:  plant.Temperature.Min,
			Unit: plant.Temperature.Unit,
		},
		SoilMoisture: api.Requirement{
			Max:  plant.SoilMoisture.Max,
			Min:  plant.SoilMoisture.Min,
			Unit: plant.SoilMoisture.Unit,
		},
		LightIntensity: api.Requirement{
			Max:  plant.LightIntensity.Max,
			Min:  plant.LightIntensity.Min,
			Unit: plant.LightIntensity.Unit,
		},
	}, nil
}

// GetPlantsIdTaxonomy implements api.StrictServerInterface.
func (h *handler) GetPlantsIdTaxonomy(ctx context.Context, request api.GetPlantsIdTaxonomyRequestObject) (api.GetPlantsIdTaxonomyResponseObject, error) {
	plant, err := h.plantRepo.GetPlantByID(request.Id)
	if err != nil {
		return api.GetPlantsIdTaxonomy500Response{}, err
	}
	if plant.ID == [16]byte{} {
		return api.GetPlantsIdTaxonomy404Response{}, nil
	}

	return api.GetPlantsIdTaxonomy200JSONResponse{
		CommonName:     plant.CommonName,
		ScientificName: plant.ScientificName,
	}, nil
}

// PostSearch implements api.StrictServerInterface.
func (h *handler) PostSearch(ctx context.Context, request api.PostSearchRequestObject) (api.PostSearchResponseObject, error) {
	if request.Body.Name == nil {
		return api.PostSearch200JSONResponse{}, nil
	}

	name := *request.Body.Name
	plants, err := h.plantRepo.SearchPlants(name)
	if err != nil {
		return api.PostSearch500Response{}, err
	}

	plantResponses := make([]api.Plant, 0, len(plants))
	for _, plant := range plants {
		plantResponses = append(plantResponses, api.Plant{
			Id: plant.ID,
			Taxonomy: api.Taxonomy{
				CommonName:     plant.CommonName,
				ScientificName: plant.ScientificName,
			},
			Assets: api.Assets{
				DefaultImageUrl: plant.DefaultImageURL,
			},
		})
	}

	return api.PostSearch200JSONResponse(plantResponses), nil
}

// DeletePlantsId implements api.StrictServerInterface.
func (h *handler) DeletePlantsId(ctx context.Context, request api.DeletePlantsIdRequestObject) (api.DeletePlantsIdResponseObject, error) {
	panic("unimplemented")
}

// PostPlants implements api.StrictServerInterface.
func (h *handler) PostPlants(ctx context.Context, request api.PostPlantsRequestObject) (api.PostPlantsResponseObject, error) {
	panic("unimplemented")
}

// PutPlantsId implements api.StrictServerInterface.
func (h *handler) PutPlantsId(ctx context.Context, request api.PutPlantsIdRequestObject) (api.PutPlantsIdResponseObject, error) {
	panic("unimplemented")
}
