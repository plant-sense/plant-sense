import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllDevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var devices = context.watch<DeviceProvider>().devices;
    return DeviceList(
      devices: devices,
    );
  }
}
