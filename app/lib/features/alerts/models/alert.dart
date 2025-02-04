import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/plant/models/plant.dart';

class Alert {
  final String gardenId;
  final Plant plant;
  final Device sensor;
  final SensorKind sensorKind;
  final ValueAlertType valueAlertType;
  final PlantFactSheet plantFactSheet;

  Alert({
    required this.gardenId,
    required this.plant,
    required this.sensor,
    required this.sensorKind,
    required this.valueAlertType,
    required this.plantFactSheet,
  });
}

enum ValueAlertType {
  below,
  above,
}
