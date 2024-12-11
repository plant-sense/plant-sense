import 'package:flutter/foundation.dart';
import '../models/plant.dart';

abstract class PlantProvider extends ChangeNotifier {
  Plant? getPlantById(String plantId);
  List<Plant> getPlantsByGardenId(String gardenId);
  void addPlant(String gardenId, String name, String factsheetId);
  void removePlant(String plantId);
}
