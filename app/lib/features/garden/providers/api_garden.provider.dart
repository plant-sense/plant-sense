import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/garden/models/garden.dart' as model;
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/gen/openapi/lib/api.dart';
import 'package:flutter/material.dart';

class ApiGardenProvider extends GardenProvider {
  final api = DefaultApi();
  List<model.Garden>? _gardens;

  @override
  List<model.Garden> get gardens {
    _fetchGardens();
    return _gardens ?? [];
  }

  model.Garden mapper(Garden garden) {
    return model.Garden(
      id: garden.id,
      name: garden.name,
      sensors: {},
      actuators: [],
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
  void addDevice(String gardenId, String deviceId, DeviceType deviceType) {
    await api.gardensDevices
  }

  @override
  Future<void> addGarden(String name) async {
    await api.gardensPost(gardenCreate: GardenCreate(name: name));
    await _reloadGardens();
  }

  @override
  model.Garden? getGardenById(String id) {
    return gardens.firstWhere((g) => g.id == id);
  }
}
