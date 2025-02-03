import 'package:app/components/title.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:app/features/plant/widgets/plant_card_grid.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';

class PlantsTab extends StatelessWidget {
  final Garden garden;

  const PlantsTab({super.key, required this.garden});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        BreakpointContainer(
          child: TitleText(title: "Plants"),
        ),
        BreakpointContainer(
          child: PlantCardGrid(
            gardenId: garden.id,
          ),
        )
      ],
    );
  }
}
