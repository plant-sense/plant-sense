package seed

import (
	"encoding/csv"
	"io"
	"math"
	"os"
	"strconv"

	"github.com/google/uuid"
	"github.com/plant-sense/plants-db/internal/repository"
	"github.com/rs/zerolog/log"
	"gorm.io/gorm"
)

type PlantCSV struct {
	PlantName       string
	CommonName      string
	SoilMoistureMin float64
	SoilMoistureMax float64
	TemperatureMin  float64
	TemperatureMax  float64
	LightMin        float64
	LightMax        float64
}

func ReadPlantsCSV(filename string) ([]PlantCSV, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	reader := csv.NewReader(file)
	reader.Comma = ';'

	// Skip header
	_, err = reader.Read()
	if err != nil {
		return nil, err
	}

	var plants []PlantCSV
	for {
		record, err := reader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			return nil, err
		}

		soilMoistureMin, _ := strconv.ParseFloat(record[21], 64)
		soilMoistureMax, _ := strconv.ParseFloat(record[22], 64)
		tempMin, _ := strconv.ParseFloat(record[27], 64)
		tempMax, _ := strconv.ParseFloat(record[28], 64)
		lightMin, _ := strconv.ParseFloat(record[31], 64)
		lightMax, _ := strconv.ParseFloat(record[32], 64)

		plant := PlantCSV{
			PlantName:       record[0],
			CommonName:      record[1],
			SoilMoistureMin: math.Min(soilMoistureMin, soilMoistureMax),
			SoilMoistureMax: math.Max(soilMoistureMin, soilMoistureMax),
			TemperatureMin:  math.Min(tempMin, tempMax),
			TemperatureMax:  math.Max(tempMin, tempMax),
			LightMin:        math.Min(lightMin, lightMax),
			LightMax:        math.Max(lightMin, lightMax),
		}
		plants = append(plants, plant)
	}
	return plants, nil
}

func SeedPlants(db *gorm.DB, filename string) error {
	plants, err := ReadPlantsCSV(filename)
	if err != nil {
		return err
	}

	for _, p := range plants {
		plant := repository.PlantSchema{
			ID:                 uuid.New(),
			CommonName:         p.CommonName,
			ScientificName:     p.PlantName,
			TemperatureMin:     p.TemperatureMin,
			TemperatureMax:     p.TemperatureMax,
			TemperatureUnit:    "°C",
			SoilMoistureMin:    p.SoilMoistureMin,
			SoilMoistureMax:    p.SoilMoistureMax,
			SoilMoistureUnit:   "%",
			LightIntensityMin:  p.LightMin,
			LightIntensityMax:  p.LightMax,
			LightIntensityUnit: "lux",
		}

		result := db.Create(&plant)
		if result.Error != nil {
			log.Error().Err(result.Error).Msg("Failed to seed plant")
		}
	}
	return nil
}
