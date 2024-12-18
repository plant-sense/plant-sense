import 'package:app/components/network_loading_image.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/metrics/widgets/live_linear_gauge.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:app/layout/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantPage extends StatelessWidget {
  final String id;

  const PlantPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    final plantFuture = plantProvider.getPlantById(id);
    return FutureBuilder(
        future: plantFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              final plant = snapshot.data;
              return _buildLoadedPlant(context, plant);
          }
        });
  }

  Widget _buildLoadedPlant(BuildContext context, Plant? plant) {
    if (plant == null) {
      return const Center(child: Text('Plant not found'));
    }

    final factSheetProvider = Provider.of<PlantFactSheetProvider>(context);
    final factSheetFuture =
        factSheetProvider.getFactSheetById(plant.factsheetId);

    final gardenDeviceReferences_Future = Provider.of<GardenProvider>(context)
        .getDevicesByGardenId(plant.gardenId);
    final devicesFuture = Provider.of<DeviceProvider>(context).getDevices();

    return FutureBuilder(
        future: Future.wait(
            [factSheetFuture, gardenDeviceReferences_Future, devicesFuture]),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              final factSheet = snapshot.data![0] as PlantFactSheet?;
              final gardenDeviceReferences =
                  snapshot.data![1] as List<DeviceReference>;
              final devices = snapshot.data![2] as List<Device>;

              return _buildLoadedFactSheet(
                context,
                plant,
                factSheet,
                gardenDeviceReferences,
                devices,
              );
          }
        });
  }

  Widget _buildLoadedFactSheet(
      BuildContext context,
      Plant plant,
      PlantFactSheet? factSheet,
      List<DeviceReference> gardenDeviceReferences,
      List<Device> devices) {
    if (factSheet == null) {
      return const Center(child: Text('Factsheet not found'));
    }

    final deviceTypes = devices.map((d) => d.deviceType).toSet();
    final devices_in_garden = devices
        .where((d) =>
            gardenDeviceReferences.any((deviceRef) => d.id == deviceRef.id))
        .toList();

    debugPrint(factSheet.requirements.toString());

    return BreakpointContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > lgBreakpoint
                          ? 400
                          : 200,
                      height: MediaQuery.of(context).size.width > lgBreakpoint
                          ? 400
                          : 200,
                      child: NetworkLoadingImage(url: factSheet.imageUrl),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    plant.name,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width > lgBreakpoint
                          ? 40
                          : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    factSheet.taxonomy.scientificName,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width > lgBreakpoint
                          ? 30
                          : 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(factSheet.taxonomy.commonName),
                  SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     FilledButton.tonalIcon(
                  //       icon: Icon(Icons.edit_outlined),
                  //       onPressed: () {
                  //         // TODO
                  //       },
                  //       label: Text(
                  //         "Edit",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     SizedBox(width: 5),
                  //     FilledButton.tonalIcon(
                  //       icon: Icon(Icons.line_axis_rounded),
                  //       onPressed: () {
                  //         // TODO
                  //       },
                  //       label: Text(
                  //         "History",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     SizedBox(width: 5),
                  //     FilledButton.tonalIcon(
                  //       icon: Icon(Icons.notifications_active_outlined),
                  //       onPressed: () {
                  //         // TODO
                  //       },
                  //       label: Text(
                  //         "Alerts",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [...sensorCharts(devices_in_garden, factSheet)],
          ),
        ],
      ),
    );
  }

  Iterable<Widget> sensorCharts(
      List<Device> devices, PlantFactSheet factsheet) sync* {
    for (var device in devices) {
      var r =
          requirementsForDeviceType(device.deviceType as SensorType, factsheet);
      yield LiveLinearGauge(
        deviceId: device.id,
        name: device.deviceType.toString(),
        minimum: 0,
        maximum: maximumForDeviceType(device.deviceType),
        idealMinimum: r?.min ?? 0,
        idealMaximum: r?.max ?? maximumForDeviceType(device.deviceType),
      );
    }
  }

  Requirement? requirementsForDeviceType(
      SensorType type, PlantFactSheet factsheet) {
    switch (type) {
      case SensorType(kind: SensorKind.lightIntensity):
        return factsheet.requirements.lightIntensity;
      case SensorType(kind: SensorKind.temperature):
        return factsheet.requirements.temperature;
      case SensorType(kind: SensorKind.soilMoisture):
        return factsheet.requirements.soilMoisture;
    }
    return null;
  }

  double maximumForDeviceType(DeviceType type) {
    switch (type) {
      case SensorType(kind: SensorKind.lightIntensity):
        return 10000;
      case SensorType(kind: SensorKind.temperature):
        return 50;
      case SensorType(kind: SensorKind.soilMoisture):
        return 100;
      default:
        return 100;
    }
  }
}
