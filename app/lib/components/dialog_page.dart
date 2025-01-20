import 'package:flutter/material.dart';

class DialogPage<T> extends Page<T> {
  DialogPage({super.key, required this.builder});
  final Widget Function(BuildContext) builder;
  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute(
      settings: this,
      builder: (context) => builder(context),
      context: context,
    );
  }
}
