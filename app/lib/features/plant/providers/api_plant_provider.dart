import 'package:app/apis.dart';
import 'package:app/gen/user-data-openapi/lib/api.dart' as api_model;
import 'package:flutter/foundation.dart';
import '../models/plant.dart';
import './plant_provider.dart';

class ApiPlantProvider extends PlantProvider {
  final UserDataApi api;

  ApiPlantProvider({required this.api});

  final Map<String, List<Plant>> _plantsByGarden = {};
  final Map<String, Plant> _plantsById = {};

  Plant _mapApiPlant(api_model.Plant apiPlant) {
    return Plant(
      id: apiPlant.id,
      name: apiPlant.name,
      gardenId: apiPlant.gardenId,
      factsheetId: apiPlant.factsheetId,
    );
  }

  Future<void> _fetchPlantsForGarden(String gardenId) async {
    if (_plantsByGarden.containsKey(gardenId)) return;

    final apiPlants = await api.gardensIdPlantsGet(gardenId);
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
  Future<Plant?> getPlantById(String plantId) {
    return api.plantsIdGet(plantId).then((apiPlant) {
      if (apiPlant == null) return null;
      final plant = _mapApiPlant(apiPlant);
      _plantsById[plantId] = plant;
      return plant;
    });
    // return _plantsById[plantId];
  }

  @override
  List<Plant> getPlantsByGardenId(String gardenId) {
    _fetchPlantsForGarden(gardenId);
    return List.unmodifiable(_plantsByGarden[gardenId] ?? []);
  }

  @override
  Future<void> addPlant(
      String gardenId, String name, String factsheetId) async {
    final plantCreate = api_model.PlantCreate(
      name: name,
      gardenId: gardenId,
      factsheetId: factsheetId,
    );

    debugPrint("Adding plant ${plantCreate.toString()}");

    final apiPlants = await api.gardensIdPlantsPost(
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
