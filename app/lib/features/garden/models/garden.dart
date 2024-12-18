import 'package:app/features/devices/models/device_type.dart';

class Garden {
  final String id;
  final String name;
  final String? imageUrl;

  const Garden({
    required this.id,
    required this.name,
    this.imageUrl,
  });
}

class DeviceReference {
  final String id;
  final DeviceType deviceType;

  const DeviceReference({
    required this.id,
    required this.deviceType,
  });
}
