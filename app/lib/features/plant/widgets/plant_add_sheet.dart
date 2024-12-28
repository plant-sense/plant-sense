import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/features/plant/widgets/plant_species_search.dart';
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
            PlantSpeciesSearch(
              onSelectCallback: (factsheetId) {
                debugPrint("f $factsheetId");
                setState(() => selectedFactSheetId = factsheetId);
              },
            ),
            SizedBox(height: 16),
            FilledButton(
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
