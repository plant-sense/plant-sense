import 'package:app/features/garden/models/garden.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GardenPageHeader extends StatelessWidget {
  final Garden garden;
  const GardenPageHeader({super.key, required this.garden});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://images.unsplash.com/photo-1546580594-a64816022c1b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: Bor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.9],
                    colors: [
                      Colors.transparent,
                      Theme.of(context).colorScheme.surface
                    ],
                  ),
                ),
              ),
            ),
          ),
          BreakpointContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  garden.name,
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                IconButton.filledTonal(
                  icon: Icon(Icons.settings),
                  tooltip: "Edit devices",
                  onPressed: () => context.go("/gardens/${garden.id}/devices"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
