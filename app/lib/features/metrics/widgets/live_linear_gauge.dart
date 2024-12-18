import 'package:app/features/metrics/providers/grpc_metrics_provider.dart';
import 'package:app/features/metrics/widgets/linear_gauge.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveLinearGauge extends StatelessWidget {
  final String name;
  final String deviceId;
  final double minimum;
  final double maximum;
  final double idealMinimum;
  final double idealMaximum;

  const LiveLinearGauge({
    super.key,
    required this.name,
    required this.deviceId,
    required this.minimum,
    required this.maximum,
    required this.idealMinimum,
    required this.idealMaximum,
  });

  @override
  Widget build(BuildContext context) {
    // return LinearGauge(
    //   name: name,
    //   value: minimum,
    //   minimum: minimum,
    //   maximum: maximum,
    //   idealMinimum: idealMinimum,
    //   idealMaximum: idealMaximum,
    // );
    return ChangeNotifierProvider(
      create: (_) => GrpcMetricsProvider(
        deviceId: deviceId,
        host: deviceGrpcHost,
        port: int.parse(deviceGrpcPort),
      )..startGenerating(),
      child: Consumer<GrpcMetricsProvider>(
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
