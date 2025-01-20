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
          SensorKind.temperature => Icons.thermostat_outlined,
          SensorKind.soilMoisture => Icons.water_drop_outlined,
          SensorKind.lightIntensity => Icons.light_mode_outlined,
        },
      ActuatorType(kind: final kind) => switch (kind) {
          ActuatorKind.light => Icons.lightbulb_outlined,
          ActuatorKind.outlet => Icons.power_outlined,
          ActuatorKind.irrigation => Icons.shower_outlined,
          ActuatorKind.other => Icons.rss_feed_outlined,
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
