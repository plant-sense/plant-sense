import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/time_series.dart';
import '../models/data_point.dart';

class TimeSeriesMetricProvider extends ChangeNotifier {
  final TimeSeries<double> timeSeries = TimeSeries<double>();
  Timer? _timer;
  final _random = Random();

  final double minValue;
  final double maxValue;

  TimeSeriesMetricProvider({
    this.minValue = 0,
    this.maxValue = 100,
  });

  bool get isRunning => _timer?.isActive ?? false;

  void startGenerating() {
    if (_timer?.isActive ?? false) return;

    // Generate backfill data for the last hour
    final now = DateTime.now();
    for (int i = 60; i > 0; i--) {
      final point = DataPoint<double>(
        timestamp: now.subtract(Duration(minutes: i)),
        value: minValue + _random.nextDouble() * (maxValue - minValue),
      );
      timeSeries.addPoint(point);
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newPoint = DataPoint<double>(
        timestamp: DateTime.now(),
        value: minValue + _random.nextDouble() * (maxValue - minValue),
      );
      timeSeries.addPoint(newPoint);
      notifyListeners();
    });
  }

  void stopGenerating() {
    _timer?.cancel();
    _timer = null;
    notifyListeners();
  }

  @override
  void dispose() {
    stopGenerating();
    super.dispose();
  }
}
