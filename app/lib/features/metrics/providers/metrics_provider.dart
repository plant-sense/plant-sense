import 'package:flutter/foundation.dart';
import '../models/time_series.dart';

abstract class MetricsProvider extends ChangeNotifier {
  TimeSeries<double> get timeSeries;
  void getHistoricalReadings(DateTime? start, DateTime? end);
  bool get isRunning;
  void startGenerating();
  void stopGenerating();
}
