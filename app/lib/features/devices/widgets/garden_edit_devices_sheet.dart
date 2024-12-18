import 'package:app/components/title.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';
import 'package:app/features/devices/widgets/garden_device_list.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GardenEditDevices extends StatefulWidget {
  final String gardenId;

  const GardenEditDevices({super.key, required this.gardenId});

  @override
  State<GardenEditDevices> createState() => _GardenEditDevicesState();
}

class _GardenEditDevicesState extends State<GardenEditDevices> {
  final _deviceController = ValueNotifier<Device?>(null);

  @override
  void dispose() {
    _deviceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var devicesReferenceFuture =
        context.watch<GardenProvider>().getDevicesByGardenId(widget.gardenId);
    var devicesFuture = context.read<DeviceProvider>().getDevices();

    return FutureBuilder(
        future: Future.wait([devicesReferenceFuture, devicesFuture]),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              return snapshot.data == null
                  ? Center(child: Text('Garden not found'))
                  : _buildFound(
                      context,
                      snapshot.data![0] as List<DeviceReference>,
                      snapshot.data![1] as List<Device>,
                    );
          }
        });
  }

  Widget _buildFound(BuildContext context,
      List<DeviceReference> deviceReferences, List<Device> devices) {
    debugPrint(devices.length.toString());
    // var devicesInGarden = garden.allDevices();
    var deviceIds = deviceReferences.map((d) => d.id).toSet();

    containsSensorType(DeviceType type) => deviceReferences
        .any((d) => d.deviceType is SensorType && d.deviceType == type);

    return Column(
      key: ValueKey("${deviceReferences.length}-${devices.length}"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GardenDeviceList(
          deviceReferences: deviceReferences,
          devices: devices,
        ),
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
                    widget.gardenId), // Force recreation when garden changes
                current: _deviceController.value,
                predicate: (p) =>
                    !deviceIds.contains(p.id) &&
                    !containsSensorType(p.deviceType),
                additionalFormatting: true,
                controller: _deviceController,
                devices: devices,
              ),
              SizedBox(width: 16),
              ValueListenableBuilder<Device?>(
                valueListenable: _deviceController,
                builder: (context, selectedDevice, _) {
                  return FilledButton.icon(
                    onPressed: selectedDevice == null
                        ? null
                        : () {
                            context.read<GardenProvider>().addDevice(
                                  widget.gardenId,
                                  selectedDevice.id,
                                  selectedDevice.deviceType,
                                );
                            _deviceController.value = null;
                          },
                    label: Text("Connect"),
                    icon: Icon(Icons.add),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
