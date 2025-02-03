import 'package:app/layout/breakpoints.dart';
import 'package:flutter/material.dart';

class BreakpointContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const BreakpointContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: xlBreakpoint - 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: padding,
            child: child,
          ),
        ),
      ],
    );
  }
}
