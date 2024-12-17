import 'package:app/components/network_loading_image.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/metrics/widgets/live_linear_gauge.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:app/layout/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../facts/providers/mock_plant_fact_sheet_provider.dart';

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
    final factSheet = factSheetProvider.getFactSheetById(plant.factsheetId);
    return FutureBuilder(
        future: factSheet,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              final factSheet = snapshot.data;
              return _buildLoadedFactSheet(context, plant, factSheet);
          }
        });
  }

  Widget _buildLoadedFactSheet(
      BuildContext context, Plant plant, PlantFactSheet? factSheet) {
    if (factSheet == null) {
      return const Center(child: Text('Factsheet not found'));
    }

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
                  Row(
                    children: [
                      FilledButton.tonalIcon(
                        icon: Icon(Icons.edit_outlined),
                        onPressed: () {
                          // TODO
                        },
                        label: Text(
                          "Edit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      FilledButton.tonalIcon(
                        icon: Icon(Icons.line_axis_rounded),
                        onPressed: () {
                          // TODO
                        },
                        label: Text(
                          "History",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      FilledButton.tonalIcon(
                        icon: Icon(Icons.notifications_active_outlined),
                        onPressed: () {
                          // TODO
                        },
                        label: Text(
                          "Alerts",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              LiveLinearGauge(
                name: "Soil humidity",
                minimum: 0.0,
                maximum: 100.0,
                idealMinimum: factSheet.requirements.soilMoisture.min,
                idealMaximum: factSheet.requirements.soilMoisture.max,
              ),
              LiveLinearGauge(
                name: "Light intensity",
                minimum: 0.0,
                maximum: 5000.0,
                idealMinimum: factSheet.requirements.lightIntensity.min,
                idealMaximum: factSheet.requirements.lightIntensity.max,
              ),
              LiveLinearGauge(
                name: "Temperature",
                minimum: 0.0,
                maximum: 50.0,
                idealMinimum: factSheet.requirements.temperature.min,
                idealMaximum: factSheet.requirements.temperature.max,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
