import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: TextButton(
          onPressed: () => context.go("/"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.eco,
                color: Colors.green.shade900,
                size: 26,
              ),
              Text(
                "Plant Sense",
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go("/devices"),
            icon: Icon(Icons.hub_outlined),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 16),
        ],
        // backgroundColor: Colors.green.shade100,
      ),
      body: child,
    );
  }
}
