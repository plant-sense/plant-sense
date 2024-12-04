import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () => context.go("/"),
            child: Text(
              "Plant Sense",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          backgroundColor: Colors.green.shade100,
        ),
        body: child,
      ),
    );
  }
}
