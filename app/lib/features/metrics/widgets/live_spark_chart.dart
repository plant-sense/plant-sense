import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/features/metrics/providers/grpc_metrics_provider.dart';
import 'package:app/features/metrics/providers/metrics_provider.dart';
import 'package:app/features/metrics/providers/mock_metrics_provider.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'spark_chart.dart';

class LiveSparkChart extends StatelessWidget {
  final String deviceId;
  final String title;
  final MaterialColor color;
  final double minValue;
  final double maxValue;

  const LiveSparkChart({
    required this.deviceId,
    required this.title,
    required this.color,
    this.minValue = 0,
    this.maxValue = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var device = context.watch<DeviceProvider>().getDeviceById(deviceId);

    return ChangeNotifierProvider<MetricsProvider>(
      create: (_) {
        var provider = GrpcMetricsProvider(
          deviceId: device.id,
          host: deviceGrpcHost,
          port: int.parse(deviceGrpcPort),
        );
        // var provider = MockMetricsProvider();
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
