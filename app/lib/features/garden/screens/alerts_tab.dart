import 'dart:async';

import 'package:app/features/alerts/widgets/garden_alerts_list.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../devices/models/device.dart';

class AlertsTab extends StatefulWidget {
  final Garden garden;
  final Duration refreshInterval;

  const AlertsTab({
    super.key,
    required this.garden,
    this.refreshInterval = const Duration(seconds: 30),
  });

  @override
  State<AlertsTab> createState() => _AlertsTabState();
}

class _AlertsTabState extends State<AlertsTab> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.refreshInterval, (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final plants =
        context.watch<PlantProvider>().getPlantsByGardenId(widget.garden.id);
    final devicesReference =
        context.watch<GardenProvider>().getDevicesByGardenId(widget.garden.id);
    final devices = context.watch<DeviceProvider>().getDevices();

    var futures = Future.wait([devicesReference, devices]);

    return BreakpointContainer(
      child: FutureBuilder(
        future: futures,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final devicesReference =
                  (snapshot.data![0] as List<DeviceReference>).toSet();
              final devices = (snapshot.data![1] as List<Device>).toSet();
              final devices_in_garden = devices
                  .where((d) =>
                      devicesReference.any((deviceRef) => d.id == deviceRef.id))
                  .toList();
              final sensors_in_garden = devices_in_garden
                  .where((d) => d.deviceType.isSensor)
                  .toList();
              return GardenAlertsList(
                garden: widget.garden,
                plants: plants,
                sensors: sensors_in_garden,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
