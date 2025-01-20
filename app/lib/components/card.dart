import 'package:app/components/themed_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardWidget extends StatelessWidget {
  final String? redirectTo;
  final Widget? child;

  const CardWidget({this.redirectTo, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(child: child),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: ThemedInkWell(
                onTap: () {
                  if (redirectTo != null) context.go(redirectTo!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
