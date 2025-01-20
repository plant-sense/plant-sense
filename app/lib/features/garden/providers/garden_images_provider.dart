import 'package:app/features/garden/models/garden.dart';
import 'package:flutter/foundation.dart';

abstract class GardenImagesProvider extends ChangeNotifier {
  Future<List<String>> getImagesForGarden(String gardenId);
}
