import 'package:app/components/card.dart';
import 'package:app/components/garden_status_bar.dart';
import 'package:app/components/title.dart';
import 'package:app/features/metrics/widgets/live_spark_chart.dart';
import 'package:app/features/plant/widgets/plant_add_sheet.dart';
import 'package:app/features/plant/widgets/plant_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/features/facts/providers/mock_plant_fact_sheet_provider.dart';
import 'package:app/features/plant/providers/mock_plant_provider.dart';
import '../providers/mock_garden_provider.dart';

class GardenPage extends StatelessWidget {
  final String id;
  final images = const [
    "https://images.unsplash.com/photo-1545165375-1b744b9ed444?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1515595967223-f9fa59af5a3b?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1498612753354-772a30629934?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1518130242561-edb760734bee?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1527061011665-3652c757a4d4?q=80&w=2186&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

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
