import 'package:app/components/card.dart';
import 'package:app/features/facts/providers/plant_fact_sheet_provider.dart';
import 'package:app/features/plant/models/plant.dart';
import 'package:app/features/plant/providers/plant_provider.dart';
import 'package:app/features/plant/widgets/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PlantCardGrid extends StatefulWidget {
  final String gardenId;

  const PlantCardGrid({required this.gardenId, super.key});

  @override
  State<PlantCardGrid> createState() => _PlantCardGridState();
}

class _PlantCardGridState extends State<PlantCardGrid> {
  late Future<List<dynamic>> futures;
  late List<Plant> plants;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final plantProvider = context.watch<PlantProvider>();
    final factSheetProvider = context.watch<PlantFactSheetProvider>();

    plants =
        context.watch<PlantProvider>().getPlantsByGardenId(widget.gardenId);
    futures = Future.wait(plants
        .map((plant) => factSheetProvider.getFactSheetById(plant.factsheetId)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futures,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final factsheets = snapshot.data;
            return AlignedGridView.extent(
              shrinkWrap: true,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                final factsheet = factsheets![index];
                return PlantCard(plant: plant, factsheet: factsheet!);
              },
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );

    // return GridView.builder(
    //   shrinkWrap: true,
    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //     childAspectRatio: 1,
    //   ),
    //   itemCount: plants.length,
    //   itemBuilder: (context, index) {
    //     final plant = plants[index];
    //     final factSheetFuture =
    //         factSheetProvider.getFactSheetById(plant.factsheetId);

    //     return FutureBuilder(
    //       future: factSheetFuture,
    //       builder: (context, snapshot) {
    //         // final factsheet = snapshot.data;
    //         switch (snapshot.connectionState) {
    //           case ConnectionState.none:
    //           case ConnectionState.waiting:
    //             return CircularProgressIndicator();
    //           case ConnectionState.active:
    //           case ConnectionState.done:
    //             return PlantCard(plant: plant, factsheet: snapshot.data!);
    //         }
    //         // return CardWidget(
    //         //   name: plant.name,
    //         //   imageUrl: factsheet?.imageUrl,
    //         //   redirectTo: "/plant/${plant.id}",
    //         // );
    //       },
    //     );
    //   },
    // );
  }
}
