import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:app/features/devices/widgets/device_list.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';

class GardenDeviceList extends StatelessWidget {
  final List<DeviceReference> deviceReferences;
  final List<Device> devices;

  const GardenDeviceList({
    super.key,
    required this.deviceReferences,
    required this.devices,
  });

  @override
  Widget build(BuildContext context) {
    // final devicesFuture =
    //     context.watch<GardenProvider>().getDevicesByGardenId(gardenId);

    final deviceReferencesIDs = deviceReferences
        .map(
          (e) => e.id,
        )
        .toSet();

    final deviceProvider = context.watch<DeviceProvider>();
    final gardenDevices = deviceProvider.devices
        .where((device) => deviceReferencesIDs.contains(device.id))
        .toList();

    return DeviceList(
      key: ValueKey('${deviceProvider.devices.length}'), // Force rebuild
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
          devices: devices,
        ),
      ),
    );
  }
}
