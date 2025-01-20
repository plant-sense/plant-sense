import 'package:app/components/card.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/features/garden/widgets/garden_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class GardenCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gardens = Provider.of<GardenProvider>(context).gardens;

    return AlignedGridView.extent(
      shrinkWrap: true,
      // crossAxisCount: 3,
      maxCrossAxisExtent: 500,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: gardens.length,
      itemBuilder: (context, index) {
        final garden = gardens[index];
        // return Center(
        //   child: Text(garden.name),
        // );
        return GardenCard(garden: garden, redirectTo: "/gardens/${garden.id}");
      },
    );

    // return GridView.builder(
    //   shrinkWrap: true,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     // maxCrossAxisExtent: 1000,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //   ),
    //   itemCount: gardens.length,
    //   itemBuilder: (context, index) {
    //     final garden = gardens[index];
    //     return GardenCard(garden: garden, redirectTo: "/gardens/${garden.id}");
    //   },
    // );
  }
}
