import 'package:flutter/foundation.dart';
import '../models/plant.dart';

abstract class PlantProvider extends ChangeNotifier {
  Future<Plant?> getPlantById(String plantId);
  List<Plant> getPlantsByGardenId(String gardenId);
  void addPlant(String gardenId, Plant plant);
  void deletePlant(Plant plant);
  void updatePlant(Plant plant);
}
