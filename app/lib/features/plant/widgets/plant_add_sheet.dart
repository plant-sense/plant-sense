import 'package:app/features/facts/providers/mock_plant_fact_sheet_provider.dart';
import 'package:app/features/plant/providers/mock_plant_provider.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantAddSheet extends StatefulWidget {
  final String gardenId;

  const PlantAddSheet({required this.gardenId, super.key});

  @override
  State<PlantAddSheet> createState() => _PlantAddSheetState();
}

class _PlantAddSheetState extends State<PlantAddSheet> {
  final nameController = TextEditingController();
  String? selectedFactSheetId;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final factSheets =
        Provider.of<MockPlantFactSheetProvider>(context).factSheets;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Plant Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Plant Type',
                border: OutlineInputBorder(),
              ),
              value: selectedFactSheetId,
              items: factSheets.map((sheet) {
                return DropdownMenuItem(
                  value: sheet.uuid,
                  child: Text(sheet.commonName),
                );
              }).toList(),
              onChanged: (value) {
                debugPrint('Selected FactSheetId: $value');
                setState(() => selectedFactSheetId = value);
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Add Plant'),
              onPressed: () {
                debugPrint(
                    'Name: ${nameController.text}, FactSheetId: $selectedFactSheetId');
                if (nameController.text.isNotEmpty &&
                    selectedFactSheetId != null) {
                  debugPrint("Adding plant");
                  context.read<PlantProvider>().addPlant(
                        widget.gardenId,
                        nameController.text,
                        selectedFactSheetId!,
                      );
                  nameController.clear();
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
