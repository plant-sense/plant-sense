package handler

import (
	"context"

	"github.com/plant-sense/user-data/internal/api"
	"github.com/plant-sense/user-data/internal/model"
)

func convertDevices(devices []model.Device) api.Devices {
	result := make(api.Devices, len(devices))
	for _, d := range devices {
		result[d.ID] = string(d.Type.ToString())
	}
	return result
}

// GetGardensIdDevices implements api.StrictServerInterface.
func (h *handler) GetGardensIdDevices(ctx context.Context, request api.GetGardensIdDevicesRequestObject) (api.GetGardensIdDevicesResponseObject, error) {
	return api.GetGardensIdDevices200JSONResponse(convertDevices(h.deviceService.GetDevices(request.Id))), nil
}

// PatchGardensIdDevices implements api.StrictServerInterface.
func (h *handler) PatchGardensIdDevices(ctx context.Context, request api.PatchGardensIdDevicesRequestObject) (api.PatchGardensIdDevicesResponseObject, error) {
	if request.Body == nil {
		return api.PatchGardensIdDevices200JSONResponse{}, nil
	}

	var d api.Devices = api.Devices(*request.Body)
	devices_created := make([]model.Device, len(d))

	for id, t := range d {
		device := model.Device{
			ID:   id,
			Type: model.DeviceTypeFromString(t),
		}
		device_created, err := h.deviceService.AddDevice(request.Id, device)
		devices_created = append(devices_created, device_created)
		if err != nil {
			return api.PatchGardensIdDevices500Response{}, err
		}
	}
	return api.PatchGardensIdDevices200JSONResponse(convertDevices(devices_created)), nil
}

// DeleteGardensIdDevicesDeviceId implements api.StrictServerInterface.
func (h *handler) DeleteGardensIdDevicesDeviceId(ctx context.Context, request api.DeleteGardensIdDevicesDeviceIdRequestObject) (api.DeleteGardensIdDevicesDeviceIdResponseObject, error) {
	err := h.deviceService.DeleteDevice(request.Id, request.DeviceId)
	if err != nil {
		return api.DeleteGardensIdDevicesDeviceId500Response{}, err
	}
	return api.DeleteGardensIdDevicesDeviceId200Response{}, nil
}
