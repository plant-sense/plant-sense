import 'package:app/components/card.dart';
import 'package:app/components/garden_status_bar.dart';
import 'package:app/components/spark_chart.dart';
import 'package:app/components/title.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: BreakpointContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: "Garden $id"),
            GardenStatusBar(
              children: [
                Expanded(
                  child: Card(
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
                ),
                Expanded(
                  child: SparkChart(
                    title: "Temperature",
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: SparkChart(
                    title: "Soil moisture",
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child:
                      SparkChart(title: "Light intensity", color: Colors.blue),
                ),
              ],
            ),
            TitleText(title: "Plants"),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // Maximum width of each card
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Square cards
                ),
                itemCount: 10,
                itemBuilder: (context, index) => CardWidget(
                  name: "Plant $index",
                  imageUrl: images[index % images.length],
                  redirectTo: "/plant/$index",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          BottomSheet(
            builder: (context) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("Add a new plant"),
                  TextField(
                    decoration: InputDecoration(labelText: "Plant name"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Add"),
                  ),
                ],
              ),
            ),
            onClosing: () {},
          )
        },
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
