import 'package:app/components/title.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';
import 'package:app/features/devices/widgets/garden_device_list.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GardenEditDevices extends StatefulWidget {
  final String gardenId;

  const GardenEditDevices({super.key, required this.gardenId});

  @override
  State<GardenEditDevices> createState() => _GardenEditDevicesState();
}

class _GardenEditDevicesState extends State<GardenEditDevices> {
  final _deviceController = ValueNotifier<Device?>(null);
  late Future<List<dynamic>> futures;

  @override
  void dispose() {
    _deviceController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final devicesReferenceFuture =
        context.watch<GardenProvider>().getDevicesByGardenId(widget.gardenId);
    final devicesFuture = context.read<DeviceProvider>().getDevices();

    futures = Future.wait([devicesReferenceFuture, devicesFuture]);
  }

  @override
  Widget build(BuildContext context) {
    return BreakpointContainer(
      child: FutureBuilder(
          future: futures,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return snapshot.data == null
                    ? Center(child: Text('Not found'))
                    : _buildFound(
                        context,
                        snapshot.data![0] as List<DeviceReference>,
                        snapshot.data![1] as List<Device>,
                      );
            }
          }),
    );
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
          gardenId: widget.gardenId,
          deviceReferences: deviceReferences,
          devices: devices,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: TitleText(title: "Connect new devices"),
        ),
        SizedBox(
          height: 100,
          child: Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DeviceDropdown(
                  expandedInsets: EdgeInsets.zero,
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
                // child: Container(
                //   color: Colors.red,
                // ),
              ),
              // Container(width: 100, color: Colors.green)
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
