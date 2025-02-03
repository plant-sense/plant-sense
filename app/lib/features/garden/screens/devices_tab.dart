import 'package:app/features/devices/screens/garden_edit_devices.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:flutter/material.dart';

class DevicesTab extends StatelessWidget {
  final Garden garden;

  const DevicesTab({super.key, required this.garden});

  @override
  Widget build(BuildContext context) {
    return GardenEditDevices(gardenId: garden.id);
  }
}
