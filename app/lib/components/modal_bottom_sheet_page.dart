import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  ModalBottomSheetPage({super.key, required this.builder});
  final Widget Function(BuildContext) builder;
  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      builder: (context) => builder(context),
      isScrollControlled: false,
      clipBehavior: Clip.hardEdge,
    );
  }
}
