package service

import (
	"github.com/google/uuid"
	"github.com/plant-sense/user-data/internal/model"
	"github.com/plant-sense/user-data/internal/repository"
)

type DeviceService interface {
	GetDevices(gardenID uuid.UUID) []model.Device
	AddDevice(gardenID uuid.UUID, device model.Device) (model.Device, error)
	DeleteDevice(gardenID uuid.UUID, deviceID string) error
}

var _ DeviceService = &deviceService{}

type deviceService struct {
	deviceRepository repository.DeviceRepository
}

func (s *deviceService) GetDevices(gardenID uuid.UUID) []model.Device {
	return s.deviceRepository.GetDevices(gardenID)
}

func (s *deviceService) AddDevice(gardenID uuid.UUID, device model.Device) (model.Device, error) {
	return s.deviceRepository.AddDevice(gardenID, device)
}

func (s *deviceService) DeleteDevice(gardenID uuid.UUID, deviceID string) error {
	return s.deviceRepository.DeleteDevice(gardenID, deviceID)
}

func NewDeviceService(deviceRepository repository.DeviceRepository) DeviceService {
	return &deviceService{
		deviceRepository: deviceRepository,
	}
}
