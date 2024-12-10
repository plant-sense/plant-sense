import 'package:app/features/devices/models/device_type.dart';

class Garden {
  final String id;
  final String name;
  final String? imageUrl;

  final Map<SensorType, String> sensors;
  final List<String> actuators;

  const Garden({
    required this.id,
    required this.name,
    required this.sensors,
    required this.actuators,
    this.imageUrl,
  });

  Set<String> allDevices() {
    return {
      ...sensors.values,
      ...actuators,
    };
  }
}
