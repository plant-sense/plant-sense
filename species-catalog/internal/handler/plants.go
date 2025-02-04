package handler

import (
	"context"

	"github.com/plant-sense/plants-db/internal/api"
)

// GetSpecies implements api.StrictServerInterface.
func (h *handler) GetSpecies(ctx context.Context, request api.GetSpeciesRequestObject) (api.GetSpeciesResponseObject, error) {
	plants, err := h.plantRepo.GetPlants()
	if err != nil {
		return api.GetSpecies500Response{}, err
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

	return api.GetSpecies200JSONResponse(plantResponses), nil
}

// GetSpeciesId implements api.StrictServerInterface.
func (h *handler) GetSpeciesId(ctx context.Context, request api.GetSpeciesIdRequestObject) (api.GetSpeciesIdResponseObject, error) {
	plant, err := h.plantRepo.GetPlantByID(request.Id)
	if err != nil {
		return api.GetSpeciesId500Response{}, err
	}
	if plant.ID == [16]byte{} { // checking for zero UUID
		return api.GetSpeciesId404Response{}, nil
	}

	return api.GetSpeciesId200JSONResponse{
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

// GetSpeciesIdRequirements implements api.StrictServerInterface.
func (h *handler) GetSpeciesIdRequirements(ctx context.Context, request api.GetSpeciesIdRequirementsRequestObject) (api.GetSpeciesIdRequirementsResponseObject, error) {
	plant, err := h.plantRepo.GetPlantByID(request.Id)
	if err != nil {
		return api.GetSpeciesIdRequirements500Response{}, err
	}
	if plant.ID == [16]byte{} {
		return api.GetSpeciesIdRequirements404Response{}, nil
	}

	return api.GetSpeciesIdRequirements200JSONResponse{
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

// GetSpeciesIdTaxonomy implements api.StrictServerInterface.
func (h *handler) GetSpeciesIdTaxonomy(ctx context.Context, request api.GetSpeciesIdTaxonomyRequestObject) (api.GetSpeciesIdTaxonomyResponseObject, error) {
	plant, err := h.plantRepo.GetPlantByID(request.Id)
	if err != nil {
		return api.GetSpeciesIdTaxonomy500Response{}, err
	}
	if plant.ID == [16]byte{} {
		return api.GetSpeciesIdTaxonomy404Response{}, nil
	}

	return api.GetSpeciesIdTaxonomy200JSONResponse{
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
