import 'package:app/features/devices/models/device.dart';
import 'package:app/features/metrics/widgets/live_spark_chart.dart';
import 'package:app/layout/breakpoints.dart';
import 'package:flutter/material.dart';

class GardenStatusBar extends StatelessWidget {
  final List<Device> devices_in_garden;

  const GardenStatusBar({required this.devices_in_garden, super.key});

  @override
  Widget build(BuildContext context) {
    var alertsCount = 0;

    var children = [
      // Card.filled(
      //   color: Colors.grey.shade400.withOpacity(0.2),
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(
      //       color: Colors.grey.shade800,
      //       width: 0,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(
      //         Icons.warning_amber_rounded,
      //         size: 50,
      //       ),
      //       Text(
      //         "0",
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      ...sensorCharts(devices_in_garden)
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > lgBreakpoint ? 4 : 2;
        return GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          padding: EdgeInsets.all(8),
          children: children,
        );
      },
    );
  }

  Iterable<Widget> sensorCharts(List<Device> devices) sync* {
    for (var device in devices) {
      yield LiveSparkChart(
        deviceType: device.deviceType,
        deviceId: device.id,
        title: device.deviceType.toString(),
        minValue: 0,
        maxValue: 1000,
      );
    }
  }
}
