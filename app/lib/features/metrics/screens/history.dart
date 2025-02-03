import 'package:app/components/title.dart';
import 'package:app/features/devices/models/device.dart';
import 'package:app/features/devices/widgets/device_dropdown.dart';
import 'package:app/features/metrics/providers/grpc_metrics_provider.dart';
import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:app/features/metrics/widgets/history_chart.dart';
import 'package:app/layout/breakpoint_container.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum HistoryChartTimeRange {
  hour,
  day,
  week,
  month,
  year,
  allTime;

  String get label {
    switch (this) {
      case HistoryChartTimeRange.hour:
        return '1H';
      case HistoryChartTimeRange.day:
        return '1D';
      case HistoryChartTimeRange.week:
        return '7D';
      case HistoryChartTimeRange.month:
        return '30D';
      case HistoryChartTimeRange.year:
        return '365D';
      case HistoryChartTimeRange.allTime:
        return 'All time';
    }
  }

  Duration? get duration {
    switch (this) {
      case HistoryChartTimeRange.hour:
        return const Duration(hours: 1);
      case HistoryChartTimeRange.day:
        return const Duration(days: 1);
      case HistoryChartTimeRange.week:
        return const Duration(days: 7);
      case HistoryChartTimeRange.month:
        return const Duration(days: 30);
      case HistoryChartTimeRange.year:
        return const Duration(days: 365);
      case HistoryChartTimeRange.allTime:
        return null;
    }
  }

  DateTime getStartDate() {
    if (duration == null) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }

    return DateTime.now().subtract(duration!);
  }
}

class HistoryPage extends StatefulWidget {
  final List<Device> devices;

  const HistoryPage({super.key, required this.devices});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var timeRange = HistoryChartTimeRange.day;
  var startDate = DateTime.now().subtract(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleText(title: "History"),
            DeviceDropdown(
              predicate: (d) => d.isSensor(),
              devices: widget.devices,
              additionalFormatting: false,
              keyboardEnabled: false,
            )
          ],
        ),
      ),
      body: BreakpointContainer(
        child: Container(
          color: Theme.of(context).canvasColor,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 8),
                    SegmentedButton<HistoryChartTimeRange>(
                      segments: HistoryChartTimeRange.values
                          .map(
                            (t) => ButtonSegment(
                              value: t,
                              label: Text(
                                t.label,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                          .toList(),
                      selected: {
                        timeRange,
                      },
                      onSelectionChanged: (newTimeRange) {
                        setState(() {
                          var first = newTimeRange.first;
                          timeRange = first;
                          startDate = first.getStartDate();
                        });
                      },
                      showSelectedIcon: false,
                    ),
                  ],
                ),
              ),
              ChangeNotifierProvider<MetricsProvider>(
                key: ValueKey(startDate),
                create: (context) => GrpcMetricsProvider(
                  deviceId: widget.devices[0].id,
                  host: deviceGrpcHost,
                  port: int.parse(deviceGrpcPort),
                  from: startDate,
                )..startGenerating(),
                child: Consumer<MetricsProvider>(
                    builder: (context, metrics, _) => Expanded(
                        child: HistoryChart(
                            deviceType: widget.devices[0].deviceType,
                            minimum: 0,
                            maximum: 100,
                            idealMinimum: 50,
                            idealMaximum: 100))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
