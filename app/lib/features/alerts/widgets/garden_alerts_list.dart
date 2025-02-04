import 'package:app/components/network_loading_image.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/widgets/device_icon.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/alert_provider.dart';
import '../models/alert.dart';

class GardenAlertsList extends StatelessWidget {
  final Garden garden;
  final List<Plant> plants;
  final List<Device> sensors;

  const GardenAlertsList({
    super.key,
    required this.garden,
    required this.plants,
    required this.sensors,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FutureBuilder<List<Alert>>(
      future: context.watch<AlertProvider>().getAlertsForGarden(
            garden.id,
            plants,
            sensors,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final alerts = snapshot.data ?? [];

        if (alerts.isEmpty) {
          return Text('No alerts');
        }

        return ListView.builder(
          itemCount: alerts.length,
          itemBuilder: (context, index) {
            final alert = alerts[index];
            return ListTile(
              minTileHeight: 100,
              visualDensity: VisualDensity.comfortable,

              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SizedBox(
                      width: 36,
                      height: 36,
                      child: NetworkLoadingImage(
                          url: alert.plantFactSheet.imageUrl),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Icon(
                    Icons.warning_rounded,
                    color: colorScheme.error,
                    size: 36,
                  ),
                  DeviceIcon(
                    type: alert.sensor.deviceType,
                    size: 24,
                  ),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
              // leading: Icon(_getAlertIcon(alert.sensorKind)),
              title: Text(
                  '${alert.plant.name}: ${alert.valueAlertType == ValueAlertType.above ? 'High' : 'Low'} ${alert.sensorKind} Alert'),
              onTap: () {
                context.go("/plant/${alert.plant.id}");
              },
            );
          },
        );
      },
    );
  }
}
