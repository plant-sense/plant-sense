import 'package:app/layout/breakpoints.dart';
import 'package:flutter/material.dart';

class GardenStatusBar extends StatelessWidget {
  final List<Widget> children;

  const GardenStatusBar({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > lgBreakpoint ? 4 : 2;
        return GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            padding: EdgeInsets.all(8),
            children: children);
      },
    );
  }
}
