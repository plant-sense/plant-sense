import 'package:app/components/status.dart';
import 'package:app/components/status_bar.dart';
import 'package:app/components/status_placeholder.dart';
import 'package:app/features/garden/providers/mock_garden_provider.dart';
import 'package:app/features/garden/widgets/garden_card_grid_with_provider.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
            GardenCardGridWithProvider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Garden Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Add Garden'),
                    onPressed: () {
                      if (_nameController.text.isNotEmpty) {
                        context
                            .read<MockGardenProvider>()
                            .addGarden(_nameController.text);
                        _nameController.clear();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
