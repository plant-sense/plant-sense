import 'package:app/gen/openapi/lib/api.dart' as api;
import 'package:flutter/foundation.dart';
import '../models/plant.dart';
import './plant_provider.dart';

class ApiPlantProvider extends PlantProvider {
  final api.DefaultApi _api = api.DefaultApi();
  final Map<String, List<Plant>> _plantsByGarden = {};
  final Map<String, Plant> _plantsById = {};

  Plant _mapApiPlant(api.Plant apiPlant) {
    return Plant(
      id: apiPlant.id,
      name: apiPlant.name,
      gardenId: apiPlant.gardenId,
      factsheetId: apiPlant.factsheetId,
    );
  }

  Future<void> _fetchPlantsForGarden(String gardenId) async {
    if (_plantsByGarden.containsKey(gardenId)) return;

    final apiPlants = await _api.gardensIdPlantsGet(gardenId);
    if (apiPlants == null) return;

    final plants = apiPlants.map(_mapApiPlant).toList();
    _plantsByGarden[gardenId] = plants;
    for (var plant in plants) {
      _plantsById[plant.id] = plant;
    }
    notifyListeners();
  }

  Future<void> _reloadPlants(String gardenId) async {
    _plantsByGarden.remove(gardenId);
    await _fetchPlantsForGarden(gardenId);
  }

  @override
  Plant? getPlantById(String plantId) {
    return _plantsById[plantId];
  }

  @override
  List<Plant> getPlantsByGardenId(String gardenId) {
    _fetchPlantsForGarden(gardenId);
    return List.unmodifiable(_plantsByGarden[gardenId] ?? []);
  }

  @override
  Future<void> addPlant(
      String gardenId, String name, String factsheetId) async {
    final plantCreate = api.PlantCreate(
      name: name,
      gardenId: gardenId,
      factsheetId: factsheetId,
    );

    debugPrint("Adding plant ${plantCreate.toString()}");

    final apiPlants = await _api.gardensIdPlantsPost(
      gardenId,
      plantCreate: plantCreate,
    );

    await _reloadPlants(gardenId);
    // if (apiPlants != null) {
    //   final plants = apiPlants.map(_mapApiPlant).toList();
    //   _plantsByGarden[gardenId] = plants;
    //   for (var plant in plants) {
    //     _plantsById[plant.id] = plant;
    //   }
    //   notifyListeners();
    // }
  }

  @override
  Future<void> removePlant(String plantId) async {
    // Note: API doesn't seem to have a delete endpoint
    // When it's added, implement the deletion here
    debugPrint('Plant deletion not implemented in API');
  }
}
