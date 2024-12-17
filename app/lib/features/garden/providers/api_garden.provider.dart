import 'package:app/apis.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/garden/models/garden.dart' as model;
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/gen/user-data-openapi/lib/api.dart';
import 'package:flutter/material.dart';

class ApiGardenProvider extends GardenProvider {
  final UserDataApi api;
  List<model.Garden>? _gardens;

  ApiGardenProvider({required this.api});

  @override
  List<model.Garden> get gardens {
    _fetchGardens();
    return _gardens ?? [];
  }

  model.Garden mapper(Garden garden) {
    return model.Garden(
      id: garden.id,
      name: garden.name,
      imageUrl: garden.imageUrl,
    );
  }

  Future<void> _fetchGardens() async {
    if (_gardens != null) return;

    final apiGardens = await api.gardensGet();
    _gardens = apiGardens!.map((g) => mapper(g)).toList();
    notifyListeners();
  }

  Future<void> _reloadGardens() async {
    _gardens = null;
    await _fetchGardens();
  }

  @override
  Future<void> addDevice(
      String gardenId, String deviceId, DeviceType deviceType) async {
    await api.gardensIdDevicesPatch(
      gardenId,
      {deviceId: deviceType.toString()},
    );
  }

  @override
  Future<void> addGarden(String name) async {
    await api.gardensPost(gardenCreate: GardenCreate(name: name));
    await _reloadGardens();
  }

  @override
  Future<model.Garden?> getGardenById(String id) async {
    await _fetchGardens();
    return gardens.firstWhere((g) => g.id == id);
  }

  @override
  Future<List<model.DeviceReference>> getDevicesByGardenId(
      String gardenId) async {
    var apiDevices = await api.gardensIdDevicesGet(gardenId);
    var dd = apiDevices!.map(
      (id, type) => (MapEntry<model.DeviceReference, bool>(
        model.DeviceReference(
          id: id,
          deviceType: SensorType(SensorKind.lightIntensity),
        ),
        true,
      )),
    );
    return dd.keys.toList();
  }
}
