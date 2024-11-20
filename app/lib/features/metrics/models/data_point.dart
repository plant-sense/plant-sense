class DataPoint<T extends num> {
  final DateTime timestamp;
  final T value;

  const DataPoint({
    required this.timestamp,
    required this.value,
  });

  @override
  String toString() => 'DataPoint(timestamp: $timestamp, value: $value)';

  DataPoint<T> copyWith({
    DateTime? timestamp,
    T? value,
  }) {
    return DataPoint<T>(
      timestamp: timestamp ?? this.timestamp,
      value: value ?? this.value,
    );
  }
}
