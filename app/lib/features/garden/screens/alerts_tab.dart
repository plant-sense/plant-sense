import 'package:app/features/garden/models/garden.dart';
import 'package:flutter/material.dart';

class AlertsTab extends StatelessWidget {
  final Garden garden;

  const AlertsTab({super.key, required this.garden});

  @override
  Widget build(BuildContext context) {
    return Text('Alerts');
  }
}
