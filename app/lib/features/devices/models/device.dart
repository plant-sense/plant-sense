import 'package:app/features/devices/models/device_type.dart';

class Device {
  final String id;
  final DeviceType deviceType;

  const Device({
    required this.id,
    required this.deviceType,
  });

  bool isSensor() {
    return deviceType is SensorType;
  }
}
