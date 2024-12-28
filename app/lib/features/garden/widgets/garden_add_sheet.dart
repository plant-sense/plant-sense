import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GardenAddSheet extends StatelessWidget {
  GardenAddSheet({
    super.key,
  });

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      .read<GardenProvider>()
                      .addGarden(_nameController.text);
                  _nameController.clear();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
