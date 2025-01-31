import 'dart:async';

import 'package:app/gen/grpc/sensor_data.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/grpc_web.dart';
import 'package:grpc/service_api.dart';

import '../models/time_series.dart';
import '../models/data_point.dart';
import 'metrics_provider.dart';

class GrpcMetricsProvider extends MetricsProvider {
  @override
  final TimeSeries<double> timeSeries = TimeSeries<double>();

  final String deviceId;
  late final GrpcWebClientChannel channel;
  final DateTime from;
  late final SensorServiceClient client;
  StreamSubscription<SensorReading>? _subscription;

  GrpcMetricsProvider({
    required this.deviceId,
    required String host,
    DateTime? from,
    int port = 80,
  }) : from = from ?? DateTime.now().subtract(Duration(hours: 24)) {
    print("Metrics: GRPC host $host, port $port");
    var uri = getUri(host, port);
    print("Metrics: GRPC base path ${uri.toString()}");
    channel = GrpcWebClientChannel.xhr(uri);
    client = SensorServiceClient(channel);
    debugPrint(from.toString());
  }

  Uri getUri(String host, int port) {
    if (!kIsWeb) {
      return Uri(host: host, port: port);
    }

    var base = Uri.base;
    return base.replace(host: "grpc.${base.host}", path: "");
  }

  @override
  bool get isRunning => _subscription != null;

  @override
  void startGenerating() async {
    if (isRunning) return;

    final request = GetReadingRequest()..deviceId = deviceId;

    try {
      var fromTimestamp = Int64(from.millisecondsSinceEpoch);
      // Get initial reading
      final initial = await client
          .getHistoricalReadings(GetHistoricalReadingsRequest()
            ..startTime = fromTimestamp
            ..deviceId = deviceId)
        ..readings.forEach(_addStreamingReading);
      notifyListeners();

      // Start streaming updates
      final stream = client.streamDeviceReadings(request);
      _subscription = stream.listen(_addStreamingReading);
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
    // debugPrint(point.toString());
  }

  void _addStreamingReading(SensorReading reading) {
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

  @override
  void getHistoricalReadings(DateTime? start, DateTime? end) async {
    try {
      debugPrint("before: ${timeSeries.points.length}");
      timeSeries.clear();
      notifyListeners();
      debugPrint("after clear: ${timeSeries.points.length}");
      var request = GetHistoricalReadingsRequest();

      if (start != null) {
        request.startTime = Int64(start.millisecondsSinceEpoch);
      }

      if (end != null) {
        request.endTime = Int64(end.millisecondsSinceEpoch);
      }

      var readings = await client.getHistoricalReadings(request);
      readings.readings.forEach(_addReading);
      notifyListeners();
      debugPrint("after adding: ${timeSeries.points.length}");
    } catch (e) {
      print('Error getting historical readings: $e');
    }
  }
}
