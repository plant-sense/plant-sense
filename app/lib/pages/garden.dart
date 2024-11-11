import 'package:app/components/card.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';

class GardenPage extends StatelessWidget {
  final String id;

  const GardenPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BreakpointContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Garden $id"),
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
                    name: "Plant $index", redirectTo: "/plant/$index"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
