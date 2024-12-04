import 'package:app/components/status.dart';
import 'package:app/components/status_bar.dart';
import 'package:app/features/garden/widgets/garden_card_grid_with_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final _nameController = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BreakpointContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusBar(
                left: StatusWidget(),
                right: FilledButton.tonal(
                    onPressed: () => context.go("/devices"),
                    child: Text("Devices"))),
            Text(
              "Gardens",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GardenCardGridWithProvider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/gardens/add"),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
