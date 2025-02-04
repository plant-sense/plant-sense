import 'package:app/features/metrics/widgets/color_util.dart';
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
          SensorKind.temperature => Icons.thermostat_rounded,
          SensorKind.soilMoisture => Icons.water_drop_rounded,
          SensorKind.lightIntensity => Icons.light_mode_rounded,
        },
      ActuatorType(kind: final kind) => switch (kind) {
          ActuatorKind.light => Icons.lightbulb_rounded,
          ActuatorKind.outlet => Icons.power_rounded,
          ActuatorKind.irrigation => Icons.shower_rounded,
          ActuatorKind.other => Icons.rss_feed_rounded,
        },
    };
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getIconData(),
      size: size,
      color: color ?? colorForDeviceType(type),
    );
  }
}
