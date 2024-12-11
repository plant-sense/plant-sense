import 'dart:async';

import 'package:app/gen/grpc/sensor_data.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

import '../models/time_series.dart';
import '../models/data_point.dart';
import 'metrics_provider.dart';

class GrpcMetricsProvider extends MetricsProvider {
  @override
  final TimeSeries<double> timeSeries = TimeSeries<double>();

  final String deviceId;
  final GrpcOrGrpcWebClientChannel channel;
  late final SensorServiceClient client;
  StreamSubscription<SensorReading>? _subscription;

  GrpcMetricsProvider({
    required this.deviceId,
    required String host,
    int port = 50051,
  }) : channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: host, port: port, transportSecure: false) {
    client = SensorServiceClient(channel);
  }

  @override
  bool get isRunning => _subscription != null;

  @override
  void startGenerating() async {
    if (isRunning) return;

    final request = GetReadingRequest()..deviceId = deviceId;

    try {
      // Get initial reading
      final initial = await client.getHistoricalReadings(
          GetHistoricalReadingsRequest()..deviceId = deviceId)
        ..readings.forEach(_addReading);

      // Start streaming updates
      final stream = client.streamDeviceReadings(request);
      _subscription = stream.listen(_addReading);
    } catch (e) {
      print('Error connecting to gRPC service: $e');
    }
  }

  void _addReading(SensorReading reading) {
    final point = DataPoint<double>(
      timestamp: DateTime.fromMillisecondsSinceEpoch(reading.timestamp.toInt()),
      value: reading.reading.value,
    );
    timeSeries.addPoint(point);
    notifyListeners();
  }

  @override
  void stopGenerating() {
    _subscription?.cancel();
    _subscription = null;
    notifyListeners();
  }

  @override
  void dispose() {
    stopGenerating();
    channel.shutdown();
    super.dispose();
  }
}
