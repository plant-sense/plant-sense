import 'data_point.dart';

class TimeSeries<T extends num> {
  final List<DataPoint<T>> _points = [];

  List<DataPoint<T>> get points => List.unmodifiable(_points);

  void addPoint(DataPoint<T> point) {
    _points.add(point);
    _sortPoints();
  }

  void addPoints(List<DataPoint<T>> newPoints) {
    _points.addAll(newPoints);
    _sortPoints();
  }

  void clear() {
    _points.clear();
  }

  void _sortPoints() {
    _points.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  DataPoint<T>? get latest => _points.isEmpty ? null : _points.last;

  DataPoint<T>? get earliest => _points.isEmpty ? null : _points.first;

  List<DataPoint<T>> getWindowedPoints(Duration window) {
    final now = DateTime.now();
    final cutoff = now.subtract(window);
    return points.where((point) => point.timestamp.isAfter(cutoff)).toList();
  }

  List<DataPoint<T>> downsample(int targetPoints) {
    final data = points;
    if (data.length <= targetPoints) return data;

    final result = <DataPoint<T>>[];
    final step = data.length / targetPoints;

    for (var i = 0.0; i < data.length; i += step) {
      final index = i.floor();
      if (index < data.length) {
        result.add(data[index]);
      }
    }

    if (result.isNotEmpty && result.last != data.last) {
      result.add(data.last);
    }

    return result;
  }
}
