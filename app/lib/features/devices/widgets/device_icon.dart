import 'package:flutter/material.dart';
import '../models/device_type.dart';

class DeviceIcon extends StatelessWidget {
  final DeviceType type;
  final double? size;
  final Color? color;

  const DeviceIcon({
    super.key,
    required this.type,
    this.size,
    this.color,
  });

  IconData _getIconData() {
    return switch (type) {
      SensorType(kind: final kind) => switch (kind) {
          SensorKind.temperature => Icons.thermostat,
          SensorKind.soilMoisture => Icons.water_drop,
          SensorKind.lightIntensity => Icons.light_mode,
        },
      ActuatorType(kind: final kind) => switch (kind) {
          ActuatorKind.light => Icons.lightbulb,
          ActuatorKind.outlet => Icons.power,
          ActuatorKind.irrigation => Icons.shower,
          ActuatorKind.other => Icons.rss_feed_rounded,
        },
    };
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getIconData(),
      size: size,
      color: color,
    );
  }
}
