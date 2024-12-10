import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:app/features/devices/widgets/device_list.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';

class GardenDeviceList extends StatelessWidget {
  final String gardenId;

  const GardenDeviceList({super.key, required this.gardenId});

  @override
  Widget build(BuildContext context) {
    final garden = context.watch<GardenProvider>().getGardenById(gardenId);
    final deviceProvider = context.watch<DeviceProvider>();
    final gardenDevices = deviceProvider.devices
        .where((device) => garden!.allDevices().contains(device.id))
        .toList();

    return DeviceList(
      key: ValueKey(
          '${garden!.hashCode}-${deviceProvider.devices.length}'), // Force rebuild
      title: "Garden Devices",
      devices: gardenDevices,
      listTileBuilder: (device) => ListTile(
        minVerticalPadding: 16.0,
        leading: DeviceIcon(
          type: device.deviceType,
        ),
        title: Text(device.deviceType.toString()),
        trailing: DeviceDropdown(
          predicate: (d) => d.deviceType == device.deviceType,
          current: device,
        ),
      ),
    );
  }
}
