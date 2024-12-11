import 'package:app/features/metrics/providers/grpc_metrics_provider.dart';
import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:app/features/metrics/providers/mock_metrics_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider<MetricsProvider>(
      create: (_) {
        // var provider =
        //     GrpcMetricsProvider(deviceId: "", host: "localhost", port: 50052);
        var provider = MockMetricsProvider();
        provider.startGenerating();
        return provider;
      },
      child: Consumer<MetricsProvider>(
        builder: (context, metrics, _) => SparkChart(
          title: title,
          color: color,
          timeSeries: metrics.timeSeries,
        ),
      ),
    );
  }
}
