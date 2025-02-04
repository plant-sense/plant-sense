import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:flutter/material.dart';

import '../../devices/models/device.dart';
import '../models/alert.dart';

abstract class AlertProvider extends ChangeNotifier {
  Future<List<Alert>> getAlertsForGarden(
      String gardenId, List<Plant> plants, List<Device> sensors);
}
