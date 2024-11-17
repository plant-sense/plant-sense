import 'package:app/components/card.dart';
import 'package:app/components/status.dart';
import 'package:app/components/status_bar.dart';
import 'package:app/components/status_placeholder.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BreakpointContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusBar(left: StatusWidget(), right: StatusPlaceholderWidget()),
            Text(
              "Gardens",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
                  name: "Garden $index",
                  imageUrl:
                      "https://images.unsplash.com/photo-1529313780224-1a12b68bed16?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  redirectTo: "/gardens/$index",
                ),
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
