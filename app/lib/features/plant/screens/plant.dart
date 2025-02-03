import 'package:app/components/confirm_delete_dialog.dart';
import 'package:app/components/network_loading_image.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/metrics/providers/grpc_metrics_provider.dart';
import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:app/features/metrics/screens/history.dart';
import 'package:app/features/metrics/widgets/color_util.dart';
import 'package:app/features/metrics/widgets/fl_chart_history_chart.dart';
import 'package:app/features/metrics/widgets/history_chart.dart';
import 'package:app/features/metrics/widgets/linear_gauge.dart';
import 'package:app/features/metrics/widgets/time_range_segmented_button.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:app/layout/breakpoints.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            final sensors =
                devices.where((d) => d.deviceType.isSensor).toList();

            return _buildLoadedFactSheet(
              context,
              plant,
              factSheet,
              gardenDeviceReferences,
              sensors,
            );
        }
      },
    );
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

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: BackButton(
          onPressed: () {
            context.go("/gardens/${plant.gardenId}");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BreakpointContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Card(
                        clipBehavior: Clip.hardEdge,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SizedBox(
                          width:
                              MediaQuery.of(context).size.width > lgBreakpoint
                                  ? 300
                                  : 200,
                          height:
                              MediaQuery.of(context).size.width > lgBreakpoint
                                  ? 300
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
                          fontSize:
                              MediaQuery.of(context).size.width > lgBreakpoint
                                  ? 40
                                  : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        factSheet.taxonomy.scientificName,
                        style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width > lgBreakpoint
                                  ? 30
                                  : 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(factSheet.taxonomy.commonName),
                      SizedBox(height: 10),
                      Row(
                        spacing: 8,
                        children: [
                          FilledButton.tonalIcon(
                            icon: Icon(Icons.edit_rounded),
                            onPressed: () {
                              context.go("/plant/${plant.id}/edit");
                            },
                            label: Text(
                              "Edit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          FilledButton.tonalIcon(
                            icon: Icon(Icons.delete_rounded),
                            onPressed: () {
                              ConfirmDeleteDialog.show(
                                  context, "plant ${plant.name}", () {
                                context
                                    .read<PlantProvider>()
                                    .deletePlant(plant);
                                context.go("/gardens/${plant.gardenId}");
                              });
                            },
                            label: Text(
                              "Delete",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          // FilledButton.tonalIcon(
                          //   icon: Icon(Icons.line_axis_rounded),
                          //   onPressed: () {
                          //     showDialog<void>(
                          //       context: context,
                          //       builder: (context) {
                          //         return HistoryPage(
                          //           devices: devices_in_garden,
                          //         );
                          //       },
                          //     );
                          //   },
                          //   label: Text(
                          //     "History",
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          // SizedBox(width: 5),
                          // FilledButton.tonalIcon(
                          //   icon: Icon(Icons.notifications_active_outlined),
                          //   onPressed: () {
                          //     // TODO
                          //   },
                          //   label: Text(
                          //     "Alerts",
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Readings(devices: devices_in_garden, factsheet: factSheet),
            ],
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: [
      //           Container(
      //             width: 400,
      //             height: 100,
      //             color: Colors.red,
      //             child: Text('Item 1'),
      //           ),
      //           Container(
      //             width: 400,
      //             height: 100,
      //             color: Colors.blue,
      //             child: Text('Item 2'),
      //           ),
      //           Container(
      //             width: 400,
      //             height: 100,
      //             color: Colors.green,
      //             child: Text('Item 3'),
      //           ),
      //           // Add more widgets as needed
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 10),
      //     Container(height: 100, color: Colors.amber)
      //   ],
      // ),
    );
  }
}

class Readings extends StatefulWidget {
  final List<Device> devices;
  final PlantFactSheet factsheet;
  const Readings({super.key, required this.devices, required this.factsheet});

  @override
  State<Readings> createState() => _ReadingsState();
}

class _ReadingsState extends State<Readings> {
  HistoryChartTimeRange _timeRange = HistoryChartTimeRange.day;

  @override
  Widget build(BuildContext context) {
    if (widget.devices.isEmpty) {
      // todo this checks devices in general, not sensors!
      return const Center(child: Text('No sensors connected'));
    }

    return Column(
      key: ValueKey(_timeRange),
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Icon(Icons.update),
                TimeRangeSegmentedButton(
                  initialTimeRange: _timeRange,
                  onSelectionChanged: (timeRange) {
                    setState(() {
                      _timeRange = timeRange;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        ...sensorCharts(widget.devices, widget.factsheet, _timeRange),
      ],
    );
  }

  Iterable<Widget> sensorCharts(List<Device> devices, PlantFactSheet factsheet,
      HistoryChartTimeRange timeRange) sync* {
    for (var device in devices) {
      var r =
          requirementsForDeviceType(device.deviceType as SensorType, factsheet);
      final idealMinimum = r?.min ?? 0;
      final idealMaximum = r?.max ?? maximumForDeviceType(device.deviceType);

      yield ChangeNotifierProvider<MetricsProvider>(
        create: (_) => GrpcMetricsProvider(
          deviceId: device.id,
          host: deviceGrpcHost,
          port: int.parse(deviceGrpcPort),
          from: timeRange.getStartDate(),
        )..startGenerating(),
        child: Consumer<MetricsProvider>(
          builder: (context, metrics, _) => Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      DeviceIcon(
                          type: device.deviceType,
                          color: colorForDeviceType(device.deviceType)),
                      SizedBox(width: 10),
                      Text(
                        device.deviceType.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 30),
                      Text(
                          metrics.timeSeries.latest?.value
                                  .toDouble()
                                  .toStringAsFixed(1) ??
                              "0",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                      "ideal: (${idealMinimum.toStringAsFixed(1)} - ${idealMaximum.toStringAsFixed(1)})"),
                  Container(
                    height: 200,
                    padding: EdgeInsets.only(top: 16),
                    child: HistoryChart(
                      deviceType: device.deviceType,
                      minimum: 0,
                      maximum: maximumForDeviceType(device.deviceType),
                      idealMinimum: idealMinimum,
                      idealMaximum: idealMaximum,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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

  // TODO this should be in the factsheet
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
