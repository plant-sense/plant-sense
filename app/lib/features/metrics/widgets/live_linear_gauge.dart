import 'package:app/features/metrics/providers/time_series_metric_provider.dart';
import 'package:app/features/metrics/widgets/linear_gauge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveLinearGauge extends StatelessWidget {
  final String name;
  final double minimum;
  final double maximum;
  final double idealMinimum;
  final double idealMaximum;

  const LiveLinearGauge({
    super.key,
    required this.name,
    required this.minimum,
    required this.maximum,
    required this.idealMinimum,
    required this.idealMaximum,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimeSeriesMetricProvider(
        minValue: minimum,
        maxValue: maximum,
      )..startGenerating(),
      child: Consumer<TimeSeriesMetricProvider>(
        builder: (context, metrics, _) => LinearGauge(
          name: name,
          value: metrics.timeSeries.latest?.value.toDouble() ?? minimum,
          minimum: minimum,
          maximum: maximum,
          idealMinimum: idealMinimum,
          idealMaximum: idealMaximum,
        ),
      ),
    );
  }
}
