import 'dart:async';
import 'dart:math';
import '../models/time_series.dart';
import '../models/data_point.dart';
import 'metrics_provider.dart';

class MockMetricsProvider extends MetricsProvider {
  @override
  final TimeSeries<double> timeSeries = TimeSeries<double>();
  Timer? _timer;
  final _random = Random();

  final double minValue;
  final double maxValue;

  MockMetricsProvider({
    this.minValue = 0,
    this.maxValue = 100,
  });

  @override
  bool get isRunning => _timer?.isActive ?? false;

  @override
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

    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      final newPoint = DataPoint<double>(
        timestamp: DateTime.now(),
        value: minValue + _random.nextDouble() * (maxValue - minValue),
      );
      timeSeries.addPoint(newPoint);
      notifyListeners();
    });
  }

  @override
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

  @override
  void getHistoricalReadings(DateTime? start, DateTime? end) {
    // TODO: implement getHistoricalReadings
  }
}
