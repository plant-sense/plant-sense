import 'package:app/features/garden/widgets/garden_status_bar.dart';
import 'package:app/components/title.dart';
import 'package:app/features/metrics/widgets/live_spark_chart.dart';
import 'package:app/features/plant/widgets/plant_add_sheet.dart';
import 'package:app/features/plant/widgets/plant_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mock_garden_provider.dart';

class GardenPage extends StatelessWidget {
  final String id;

  const GardenPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final garden = Provider.of<MockGardenProvider>(context).getGardenById(id);

    if (garden == null) {
      return Scaffold(
        body: Center(child: Text('Garden not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: TitleText(title: garden.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            tooltip: "Edit garden",
            onPressed: () => {},
          ),
        ],
      ),
      body: BreakpointContainer(
        child: Column(
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
                LiveSparkChart(
                  title: "Temperature",
                  color: Colors.red,
                  minValue: 0,
                  maxValue: 50,
                ),
                LiveSparkChart(
                  title: "Soil moisture",
                  color: Colors.green,
                  minValue: 0,
                  maxValue: 100,
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => StatefulBuilder(
            builder: (context, setState) {
              return PlantAddSheet(
                gardenId: id,
              );
            },
          ),
        ),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
