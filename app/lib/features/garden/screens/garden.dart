import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/widgets/garden_status_bar.dart';
import 'package:app/components/title.dart';
import 'package:app/features/metrics/widgets/live_spark_chart.dart';
import 'package:app/features/plant/widgets/plant_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GardenPage extends StatelessWidget {
  final String id;

  const GardenPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final garden = Provider.of<GardenProvider>(context).getGardenById(id);
    final deviceTypes = Provider.of<DeviceProvider>(context)
        .devices
        .map((d) => d.deviceType)
        .toSet();

    if (garden == null) {
      return Scaffold(
        body: Center(child: Text('Garden not found')),
      );
    }

    return Scaffold(
      body: BreakpointContainer(
        child: Scaffold(
          appBar: AppBar(
            title: TitleText(title: garden.name),
            actions: [
              IconButton.filledTonal(
                icon: Icon(Icons.settings),
                tooltip: "Edit devices",
                onPressed: () => context.go("/gardens/$id/devices"),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GardenStatusBar(
                children: [
                  Card.outlined(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.shade800,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning,
                          size: 50,
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (deviceTypes.contains(SensorType(SensorKind.temperature)))
                    LiveSparkChart(
                      title: "Temperature",
                      color: Colors.red,
                      minValue: 0,
                      maxValue: 50,
                    ),
                  if (deviceTypes.contains(SensorType(SensorKind.soilMoisture)))
                    LiveSparkChart(
                      title: "Soil moisture",
                      color: Colors.green,
                      minValue: 0,
                      maxValue: 100,
                    ),
                  if (deviceTypes
                      .contains(SensorType(SensorKind.lightIntensity)))
                    LiveSparkChart(
                      title: "Light intensity",
                      color: Colors.blue,
                      minValue: 0,
                      maxValue: 1000,
                    ),
                ],
              ),
              TitleText(title: "Plants"),
              PlantCardGrid(
                gardenId: id,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/gardens/$id/plants/add"),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
