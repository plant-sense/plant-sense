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
          title: Text("Plant Sense"),
          backgroundColor: Colors.green.shade100,
        ),
        body: child,
        bottomNavigationBar: TabBar(
          tabs: const [
            Tab(icon: Icon(Icons.bar_chart_rounded)),
            Tab(icon: Icon(Icons.home_rounded)),
            Tab(icon: Icon(Icons.add_rounded))
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                context.go("/gauges");
              case 1:
                context.go("/home");
              case 2:
                context.go("/details");
            }
          },
        ),
      ),
    );
  }
}
