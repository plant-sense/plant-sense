import 'package:app/components/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../facts/providers/mock_plant_fact_sheet_provider.dart';
import '../providers/mock_plant_provider.dart';

class PlantCardGrid extends StatelessWidget {
  final String gardenId;

  const PlantCardGrid({required this.gardenId, super.key});

  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<MockPlantProvider>(context);
    final factSheetProvider = Provider.of<MockPlantFactSheetProvider>(context);

    final plants = plantProvider.getPlantsByGardenId(gardenId);

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          final factSheet =
              factSheetProvider.getFactSheetById(plant.factsheetId);

          return CardWidget(
            name: plant.name,
            imageUrl: factSheet?.imageUrl ?? '',
            redirectTo: "/plant/${plant.id}",
          );
        },
      ),
    );
  }
}
