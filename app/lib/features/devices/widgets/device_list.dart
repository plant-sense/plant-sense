import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/device.dart';
import '../providers/device_provider.dart';
import 'device_icon.dart';

class DeviceList extends StatelessWidget {
  final Widget Function(Device device)? listTileBuilder;
  final List<Device> devices;
  final String title;

  DeviceList({
    super.key,
    this.listTileBuilder,
    required this.devices,
    this.title = "All devices",
  });

  List<Device> _getSensors(List<Device> devices) {
    return devices.where((d) => d.deviceType.isSensor).toList();
  }

  List<Device> _getActuators(List<Device> devices) {
    return devices.where((d) => d.deviceType.isActuator).toList();
  }

  Widget _buildDeviceTile(Device device) {
    return ListTile(
      leading: DeviceIcon(type: device.deviceType),
      title: Text(device.deviceType.toString()),
      subtitle: Text(device.id),
    );
  }

  Widget _buildHeader(String title, [double fontSize = 16.0]) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final devices = context.watch<DeviceProvider>().devices;
    final builder = listTileBuilder ?? _buildDeviceTile;

    if (devices.isEmpty) {
      return const Center(child: Text('No devices found'));
    }

    final sensors = _getSensors(devices);
    final actuators = _getActuators(devices);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(title, 20),
        ListView(
          shrinkWrap: true,
          children: [
            if (sensors.isNotEmpty) ...[
              _buildHeader('Sensors'),
              ...sensors.map(builder),
            ],
            Divider(),
            if (actuators.isNotEmpty) ...[
              _buildHeader('Actuators'),
              ...actuators.map(builder),
            ],
          ],
        )
      ],
    );
  }
}
