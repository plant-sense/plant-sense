import 'package:flutter/foundation.dart';
import '../../facts/providers/mock_plant_fact_sheet_provider.dart';
import '../models/plant.dart';

class MockPlantProvider extends ChangeNotifier {
  static final MockPlantProvider _instance = MockPlantProvider._internal();
  factory MockPlantProvider() => _instance;

  MockPlantProvider._internal() {
    final factSheets = _factSheetProvider.factSheets;
    // Create 10 gardens with increasing number of plants
    for (int gardenId = 0; gardenId < 10; gardenId++) {
      final numberOfPlants = gardenId + 1;
      final gardenPlants = List.generate(numberOfPlants, (plantIndex) {
        return Plant(
          id: '${gardenId}_$plantIndex',
          name: 'Plant $plantIndex',
          gardenId: '$gardenId',
          factsheetId: factSheets[plantIndex % factSheets.length].uuid,
        );
      });
      _plantsByGarden['$gardenId'] = gardenPlants;
      _allPlants.addAll(gardenPlants);
    }
  }

  final _factSheetProvider = MockPlantFactSheetProvider();
  final List<Plant> _allPlants = [];
  final Map<String, List<Plant>> _plantsByGarden = {};

  Plant? getPlantById(String plantId) {
    try {
      return _allPlants.firstWhere((p) => p.id == plantId);
    } catch (_) {
      return null;
    }
  }

  List<Plant> getPlantsByGardenId(String gardenId) {
    return List.unmodifiable(_plantsByGarden[gardenId] ?? []);
  }

  void addPlant(String gardenId, String name, String factsheetId) {
    final plants = _plantsByGarden[gardenId] ?? [];
    final newPlant = Plant(
      id: '${gardenId}_${plants.length}',
      name: name,
      gardenId: gardenId,
      factsheetId: factsheetId,
    );
    debugPrint("add plant ${newPlant.id}, $name to garden $gardenId");

    _plantsByGarden[gardenId] = [...plants, newPlant];
    _allPlants.add(newPlant);
    notifyListeners();
  }

  void removePlant(String plantId) {
    final parts = plantId.split('_');
    if (parts.length != 3) return;

    final gardenId = parts[1];
    final plants = _plantsByGarden[gardenId];
    if (plants == null) return;

    _plantsByGarden[gardenId] = plants.where((p) => p.id != plantId).toList();
    notifyListeners();
  }
}
