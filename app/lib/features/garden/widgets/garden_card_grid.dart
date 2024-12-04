import 'package:app/components/card.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mock_garden_provider.dart';

class GardenCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gardens = Provider.of<GardenProvider>(context).gardens;

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: gardens.length,
        itemBuilder: (context, index) {
          final garden = gardens[index];
          return CardWidget(
            name: garden.name,
            imageUrl: garden.imageUrl ?? '',
            redirectTo: "/gardens/${garden.id}",
          );
        },
      ),
    );
  }
}
