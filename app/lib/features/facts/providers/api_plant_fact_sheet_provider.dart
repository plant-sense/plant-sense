import 'package:flutter/foundation.dart';
import 'package:app/gen/plants-db-openapi/lib/api.dart' as api;
import '../models/plant_fact_sheet.dart';

class ApiPlantFactSheetProvider extends ChangeNotifier {
  static final ApiPlantFactSheetProvider _instance =
      ApiPlantFactSheetProvider._internal();
  factory ApiPlantFactSheetProvider() => _instance;
  ApiPlantFactSheetProvider._internal();

  final api.DefaultApi _api = api.DefaultApi();
  final Map<String, PlantFactSheet> _factSheetsById = {};
  List<PlantFactSheet>? _allFactSheets;

  PlantFactSheet _mapApiFactsheet(api.Factsheet apiFactsheet) {
    // Map the requirements to growing conditions
    final requirements = apiFactsheet.requirements;
    final conditions = GrowingConditions(
      minTemperature: requirements.temperature.min.toDouble(),
      maxTemperature: requirements.temperature.max.toDouble(),
      minSoilHumidity: requirements.soilMoisture.min.toDouble(),
      maxSoilHumidity: requirements.soilMoisture.max.toDouble(),
      minLightIntensity: requirements.lightIntensity.min.toDouble(),
      maxLightIntensity: requirements.lightIntensity.max.toDouble(),
    );

    return PlantFactSheet(
      uuid: apiFactsheet.id,
      scientificName: apiFactsheet.taxonomy.scientificName,
      commonName: apiFactsheet.taxonomy.commonName,
      imageUrl: '',
      idealConditions: conditions,
    );
  }

  Future<void> _fetchFactSheetById(String id) async {
    if (_factSheetsById.containsKey(id)) return;

    final apiFactsheet = await _api.plantsIdGet(id);
    if (apiFactsheet == null) return;

    final factSheet = _mapApiFactsheet(apiFactsheet);
    _factSheetsById[id] = factSheet;
    notifyListeners();
  }

  Future<void> _fetchAllFactSheets() async {
    if (_allFactSheets != null) return;

    final apiPlants = await _api.plantsGet();
    if (apiPlants == null) return;

    // For each plant, fetch its full factsheet
    // final factSheets = <PlantFactSheet>[];
    for (final plant in apiPlants) {
      if (plant.id != null) {
        final factsheet = await _api.plantsIdGet(plant.id);
        if (factsheet != null) {
          final mappedFactsheet = _mapApiFactsheet(factsheet);
          factSheets.add(mappedFactsheet);
          _factSheetsById[mappedFactsheet.uuid] = mappedFactsheet;
        }
      }
    }

    _allFactSheets = factSheets;
    notifyListeners();
  }

  List<PlantFactSheet> get factSheets {
    _fetchAllFactSheets();
    return List.unmodifiable(_allFactSheets ?? []);
  }

  PlantFactSheet? getFactSheetById(String id) {
    _fetchFactSheetById(id);
    return _factSheetsById[id];
  }
}
