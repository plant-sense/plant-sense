import 'package:app/components/title.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';
import 'package:app/features/devices/widgets/garden_device_list.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GardenEditDevices extends StatefulWidget {
  final String gardenId;

  const GardenEditDevices({super.key, required this.gardenId});

  @override
  State<GardenEditDevices> createState() => _GardenEditDevicesState();
}

class _GardenEditDevicesState extends State<GardenEditDevices> {
  Device? selectedDevice;

  @override
  Widget build(BuildContext context) {
    // Use watch when you need the UI to update when data changes
    var garden = context.watch<GardenProvider>().getGardenById(widget.gardenId);
    var devicesInGarden = garden!.allDevices();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GardenDeviceList(gardenId: widget.gardenId),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: TitleText(title: "Connect new devices"),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DeviceDropdown(
                key: ValueKey(
                    garden.hashCode), // Force recreation when garden changes
                current: selectedDevice,
                predicate: (p) =>
                    !devicesInGarden.contains(p.id) &&
                    !garden.sensors.containsKey(p.deviceType),
                additionalFormatting: true,
                onDeviceChanged: (device) =>
                    setState(() => selectedDevice = device),
              ),
              SizedBox(width: 16),
              FilledButton.icon(
                onPressed: () {
                  if (selectedDevice != null) {
                    context.read<GardenProvider>().addDevice(
                          widget.gardenId,
                          selectedDevice!.id,
                          selectedDevice!.deviceType,
                        );
                    setState(() {
                      selectedDevice = null; // Reset selection after adding
                    });
                  }
                },
                label: Text("Connect"),
                icon: Icon(Icons.add),
              )
            ],
          ),
        )
      ],
    );
  }
}
