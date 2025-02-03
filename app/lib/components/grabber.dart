import 'package:flutter/material.dart';

// Source: https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html#widgets.DraggableScrollableSheet.1

/// A draggable widget that accepts vertical drag gestures
/// and this is only visible on desktop and web platforms.
class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
