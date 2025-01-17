import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryChart extends StatefulWidget {
  // final String plantId;
  const HistoryChart({super.key});

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
      backgroundColor: Theme.of(context).canvasColor,
      primaryXAxis: DateTimeAxis(name: "Date"),
      primaryYAxis: NumericAxis(plotBands: [
        PlotBand(
          start: 50,
          end: 100,
          color: Colors.green.shade400,
          opacity: 0.25,
        ),
      ]),
      trackballBehavior: _trackballBehavior,
      series: [
        LineSeries(
          dataSource: _metricsProvider.timeSeries.points,
          xValueMapper: (p, _) => p.timestamp,
          yValueMapper: (p, _) => p.value,
          markerSettings: MarkerSettings(isVisible: true),
        )
      ],
    );
  }
}
