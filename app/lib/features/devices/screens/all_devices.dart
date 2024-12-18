import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/devices/widgets/device_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllDevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var devicesFuture = context.read<DeviceProvider>().getDevices();
    return FutureBuilder(
        future: devicesFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('An error occurred'));
              } else {
                final devices = snapshot.data as List<Device>;
                return _buildLoaded(context, devices);
              }
          }
        });
  }

  Widget _buildLoaded(BuildContext context, List<Device> devices) {
    return DeviceList(
      devices: devices,
    );
  }
}
