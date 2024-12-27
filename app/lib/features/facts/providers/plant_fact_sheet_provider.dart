import 'package:flutter/foundation.dart';
import '../models/plant_fact_sheet.dart';

abstract class PlantFactSheetProvider extends ChangeNotifier {
  // List<PlantFactSheet> get factSheets;
  Future<List<Species>> get species;
  Future<PlantFactSheet?> getFactSheetById(String id);
  Future<List<Species>> searchByName(String name);
}
