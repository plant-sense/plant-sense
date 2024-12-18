import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/facts/providers/mock_plant_fact_sheet_provider.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
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
  Future<List<Species>>? speciesFuture;
  String? selectedFactSheetId;

  @override
  void initState() {
    super.initState();
    speciesFuture = context.read<PlantFactSheetProvider>().species;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final speciesFuture = Provider.of<PlantFactSheetProvider>(context).species;
    return FutureBuilder(
      future: speciesFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            final species = snapshot.data!;
            return _buildLoaded(species);
        }
      },
    );
  }

  Widget _buildLoaded(List<Species> species) {
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
              items: species.map((sheet) {
                return DropdownMenuItem(
                  value: sheet.id,
                  child: Text(sheet.taxonomy.scientificName),
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
