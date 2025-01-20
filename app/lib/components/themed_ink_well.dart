import 'package:flutter/material.dart';

class ThemedInkWell extends InkWell {
  ThemedInkWell({
    super.key,
    super.child,
    super.onTap,
    super.onDoubleTap,
    super.onLongPress,
    super.onTapDown,
    super.onTapUp,
    super.onTapCancel,
    super.onSecondaryTap,
    super.onSecondaryTapUp,
    super.onSecondaryTapDown,
    super.onSecondaryTapCancel,
    super.onHighlightChanged,
    super.onHover,
    super.mouseCursor,
    super.overlayColor,
    super.splashFactory,
    super.radius,
    super.borderRadius,
    super.customBorder,
    bool? enableFeedback = true,
    super.excludeFromSemantics,
    super.focusNode,
    super.canRequestFocus,
    super.onFocusChange,
    super.autofocus,
    super.statesController,
    super.hoverDuration,
  }) : super(
          splashColor: Colors.grey.withAlpha(10),
          hoverColor: Colors.grey.withAlpha(10),
          focusColor: Colors.grey.withAlpha(10),
          highlightColor: Colors.grey.withAlpha(20),
        );
}
