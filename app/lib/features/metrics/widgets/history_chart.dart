import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/facts/models/plant_fact_sheet.dart';
import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:app/features/metrics/widgets/color_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryChart extends StatefulWidget {
  // final String plantId;
  final DeviceType deviceType;
  final double minimum;
  final double maximum;
  final double idealMinimum;
  final double idealMaximum;
  const HistoryChart(
      {super.key,
      required this.deviceType,
      required this.minimum,
      required this.maximum,
      required this.idealMinimum,
      required this.idealMaximum});

  @override
  State<HistoryChart> createState() => _HistoryChartState();
}

class _HistoryChartState extends State<HistoryChart> {
  late TrackballBehavior _trackballBehavior;
  late TooltipBehavior _tooltipBehavior;
  late MetricsProvider _metricsProvider;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      shouldAlwaysShow: true,
      builder: (BuildContext context, TrackballDetails trackballDetails) {
        DateTime datetime = trackballDetails.point!.x;
        double value = trackballDetails.point!.y;
        var dateFormat = DateFormat.yMMMEd().add_jms();
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateFormat.format(datetime),
                style: TextStyle(color: Colors.white),
              ),
              Text(
                value.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _metricsProvider = context.watch<MetricsProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // backgroundColor: Theme.of(context).canvasColor
      primaryXAxis: DateTimeAxis(
        desiredIntervals: 6,
        name: "Date",
        intervalType: DateTimeIntervalType.auto,
        dateFormat: DateFormat.yMMMd().add_Hm(),
        borderColor: Theme.of(context).textTheme.bodyMedium!.color,
        labelStyle: Theme.of(context).textTheme.bodyMedium!,
      ),
      primaryYAxis: NumericAxis(
        visibleMaximum: widget.maximum,
        visibleMinimum: widget.minimum,
        plotBands: [
          PlotBand(
            start: widget.idealMinimum,
            end: widget.idealMaximum,
            color: Colors.green.shade400,
            opacity: 0.25,
          ),
        ],
        labelStyle: Theme.of(context).textTheme.bodyMedium!,
      ),
      trackballBehavior: _trackballBehavior,
      series: [
        LineSeries(
          color: colorForDeviceType(widget.deviceType),
          dataSource: _metricsProvider.timeSeries.points,
          xValueMapper: (p, _) => p.timestamp,
          yValueMapper: (p, _) => p.value,
          markerSettings: MarkerSettings(isVisible: false),
        )
      ],
    );
  }
}
