package seed

import (
	"encoding/csv"
	"io"
	"os"

	"github.com/plant-sense/plants-db/internal/repository"
	"github.com/rs/zerolog/log"
	"gorm.io/gorm"
)

func SeedPlantImages(csvFilePath string, db *gorm.DB) {
	file, err := os.Open(csvFilePath)
	if err != nil {
		log.Fatal().Err(err).Msg("Failed to open CSV file")
	}
	defer file.Close()

	reader := csv.NewReader(file)
	// Skip header
	_, err = reader.Read()
	if err != nil {
		log.Fatal().Err(err).Msg("Failed to read CSV file")
	}

	for {
		record, err := reader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal().Err(err).Msg("Failed to read CSV file")
		}

		scientificName := record[0]
		imageURL := record[3]

		var plant repository.PlantSchema
		if err := db.Where("scientific_name = ?", scientificName).First(&plant).Error; err != nil {
			log.Error().Msgf("Plant not found: %s", scientificName)
			continue
		}

		plant.ImageURL = &imageURL
		if err := db.Save(&plant).Error; err != nil {
			log.Error().Msgf("Failed to update plant: %s", scientificName)
		}
	}
}
