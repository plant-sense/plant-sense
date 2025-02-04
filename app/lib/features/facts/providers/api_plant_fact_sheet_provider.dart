import 'package:app/apis.dart';
import 'package:app/gen/plants-db-openapi/lib/api.dart' as api_model;
import '../models/plant_fact_sheet.dart';
import '../providers/plant_fact_sheet_provider.dart';

class ApiPlantFactSheetProvider extends PlantFactSheetProvider {
  final PlantsDBApi api;

  ApiPlantFactSheetProvider({required this.api});

  final Map<String, PlantFactSheet> _factSheetsById = {};
  List<PlantFactSheet>? _allFactSheets;

  PlantFactSheet _mapApiFactsheet(api_model.Factsheet apiFactsheet) {
    return PlantFactSheet(
      id: apiFactsheet.id,
      taxonomy: Taxonomy(
        scientificName: apiFactsheet.taxonomy.scientificName,
        commonName: apiFactsheet.taxonomy.commonName,
      ),
      requirements: Requirements(
        lightIntensity: Requirement(
          min: apiFactsheet.requirements.lightIntensity.min,
          max: apiFactsheet.requirements.lightIntensity.max,
          unit: apiFactsheet.requirements.lightIntensity.unit,
        ),
        soilMoisture: Requirement(
          min: apiFactsheet.requirements.soilMoisture.min,
          max: apiFactsheet.requirements.soilMoisture.max,
          unit: apiFactsheet.requirements.soilMoisture.unit,
        ),
        temperature: Requirement(
          min: apiFactsheet.requirements.temperature.min,
          max: apiFactsheet.requirements.temperature.max,
          unit: apiFactsheet.requirements.temperature.unit,
        ),
      ),
      imageUrl: apiFactsheet.assets.defaultImageUrl,
    );
  }

  Future<PlantFactSheet?> getFactSheetById(String id) async {
    final apiFactsheet = await api.plantsIdGet(id);
    if (apiFactsheet == null) {
      return null;
    }
    final factSheet = _mapApiFactsheet(apiFactsheet);
    return factSheet;
    // _factSheetsById[id] = factSheet;
    // notifyListeners();
  }

  @override
  Future<List<Species>> get species async {
    var apiPlants = await api.plantsGet();

    return apiPlants!
        .map(
          (e) => Species(
            id: e.id,
            taxonomy: Taxonomy(
              scientificName: e.taxonomy.scientificName,
              commonName: e.taxonomy.commonName,
            ),
            assets: Assets(
              imageUrl: e.assets.defaultImageUrl ?? "",
            ),
          ),
        )
        .toList();
  }

  @override
  Future<List<Species>> searchByName(String name) async {
    var apiPlants = await api.searchPost(
        searchRequest: api_model.SearchRequest(name: name));

    return apiPlants!
        .map(
          (e) => Species(
            id: e.id,
            taxonomy: Taxonomy(
              scientificName: e.taxonomy.scientificName,
              commonName: e.taxonomy.commonName,
            ),
            assets: Assets(
              imageUrl: e.assets.defaultImageUrl ?? "",
            ),
          ),
        )
        .toList();
  }
}
