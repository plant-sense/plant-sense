import 'package:app/components/card.dart';
import 'package:app/components/network_loading_image.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  final PlantFactSheet factsheet;

  const PlantCard({required this.plant, required this.factsheet, super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      redirectTo: "/plant/${plant.id}",
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: NetworkLoadingImage(url: factsheet.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(plant.name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(factsheet.taxonomy.scientificName),
                Text(
                  factsheet.taxonomy.commonName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
