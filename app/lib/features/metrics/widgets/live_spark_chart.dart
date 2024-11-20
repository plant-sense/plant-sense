import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/time_series_metric_provider.dart';
import 'spark_chart.dart';

class LiveSparkChart extends StatelessWidget {
  final String title;
  final MaterialColor color;
  final double minValue;
  final double maxValue;

  const LiveSparkChart({
    required this.title,
    required this.color,
    this.minValue = 0,
    this.maxValue = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimeSeriesMetricProvider(
        minValue: minValue,
        maxValue: maxValue,
      )..startGenerating(),
      child: Consumer<TimeSeriesMetricProvider>(
        builder: (context, metrics, _) => SparkChart(
          title: title,
          color: color,
          timeSeries: metrics.timeSeries,
        ),
      ),
    );
  }
}
