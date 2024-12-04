import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:app/features/devices/widgets/device_list.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/providers/mock_garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/device_provider.dart';
import '../models/device.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';

class GardenDeviceList extends StatelessWidget {
  final String gardenId;

  const GardenDeviceList({super.key, required this.gardenId});

  @override
  Widget build(BuildContext context) {
    final garden = Provider.of<GardenProvider>(context).getGardenById(gardenId);

    final all_devices = context.watch<DeviceProvider>().devices;
    final garden_devices = all_devices
        .where((device) => garden!.allDevices().contains(device.id))
        .toList();

    debugPrint(garden_devices.length.toString());

    // Device? selectedDevice = context.watch<DeviceProvider>().devices.first;

    return DeviceList(
      title: "Garden Devices",
      devices: garden_devices,
      listTileBuilder: (device) => ListTile(
        minVerticalPadding: 16.0,
        leading: DeviceIcon(
          type: device.deviceType,
        ),
        title: Text(device.deviceType.toString()),
        trailing: DeviceDropdown(
          predicate: (d) => d.deviceType == device.deviceType,
          current: device,
          onDeviceChanged: (Device newDevice) {
            debugPrint('Selected device: ${newDevice.id}');
          },
        ),
      ),
    );
  }
}
