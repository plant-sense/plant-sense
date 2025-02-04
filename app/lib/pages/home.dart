import 'package:app/components/status.dart';
import 'package:app/components/status_bar.dart';
import 'package:app/features/garden/widgets/garden_card.dart';
import 'package:app/features/garden/widgets/garden_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: TextButton(
          onPressed: () => context.go("/"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.eco,
                color: Colors.green.shade900,
                size: 26,
              ),
              Text(
                "Plant Sense",
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go("/devices"),
            icon: Icon(Icons.sensors_rounded),
          ),
          // IconButton(
          //   onPressed: () => {},
          //   icon: Icon(Icons.notifications),
          // ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: BreakpointContainer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // StatusBar(
              //     left: StatusWidget(),
              //     right: FilledButton.tonal(
              //         onPressed: () => context.go("/devices"),
              //         child: Text("Devices"))),
              Text(
                "Gardens",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GardenCardGrid(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/gardens/add"),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
