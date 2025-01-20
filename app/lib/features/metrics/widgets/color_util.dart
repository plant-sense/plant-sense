import 'package:app/features/devices/models/device_type.dart';
import 'package:flutter/material.dart';

MaterialColor colorForDeviceType(DeviceType type) {
  switch (type) {
    case SensorType(kind: SensorKind.lightIntensity):
      return Colors.green;
    case SensorType(kind: SensorKind.temperature):
      return Colors.red;
    case SensorType(kind: SensorKind.soilMoisture):
      return Colors.blue;
    default:
      return Colors.grey;
  }
}
