import 'package:flutter/foundation.dart';
import '../../facts/providers/mock_plant_fact_sheet_provider.dart';
import '../models/plant.dart';

class MockPlantProvider extends ChangeNotifier {
  static final MockPlantProvider _instance = MockPlantProvider._internal();
  factory MockPlantProvider() => _instance;

  MockPlantProvider._internal() {
    // Initialize static list of plants
    final factSheets = _factSheetProvider.factSheets;
    _allPlants = List.generate(10, (index) {
      return Plant(
        id: '$index',
        name: 'Plant $index',
        gardenId: '${index % 3}', // Distribute plants across 3 gardens
        factsheetId: factSheets[index % factSheets.length].uuid,
      );
    });
  }

  final _factSheetProvider = MockPlantFactSheetProvider();
  late final List<Plant> _allPlants;
  final Map<String, List<Plant>> _plantsByGarden = {};

  Plant? getPlantById(String plantId) {
    try {
      return _allPlants.firstWhere((p) => p.id == plantId);
    } catch (_) {
      return null;
    }
  }

  List<Plant> getPlantsByGardenId(String gardenId) {
    if (!_plantsByGarden.containsKey(gardenId)) {
      // Return id+1 plants for each garden
      final numberOfPlants = (int.tryParse(gardenId) ?? 0) + 1;
      _plantsByGarden[gardenId] = _allPlants
          .where((p) => _allPlants.indexOf(p) < numberOfPlants)
          .map((p) => Plant(
                id: p.id,
                name: p.name,
                gardenId: gardenId,
                factsheetId: p.factsheetId,
              ))
          .toList();
    }

    return List.unmodifiable(_plantsByGarden[gardenId]!);
  }

  void addPlant(String gardenId, String name, String factsheetId) {
    debugPrint("add plant $name to garden $gardenId");
    final plants = _plantsByGarden[gardenId] ?? [];
    final newPlant = Plant(
      id: '${plants.length}',
      name: name,
      gardenId: gardenId,
      factsheetId: factsheetId,
    );

    _plantsByGarden[gardenId] = [...plants, newPlant];
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
