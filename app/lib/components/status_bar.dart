import 'package:app/layout/breakpoints.dart';
import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final Widget left;
  final Widget right;

  const StatusBar({required this.left, required this.right, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > lgBreakpoint ? 2 : 1;
        return GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            padding: EdgeInsets.all(8),
            children: [left, right]);
      },
    );
  }
}
