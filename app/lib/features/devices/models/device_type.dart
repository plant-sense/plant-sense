sealed class DeviceType {
  const DeviceType();

  bool get isSensor => this is SensorType;
  bool get isActuator => this is ActuatorType;
}

final class SensorType extends DeviceType {
  final SensorKind kind;

  const SensorType(this.kind);

  @override
  String toString() => kind.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SensorType &&
          runtimeType == other.runtimeType &&
          kind == other.kind;

  @override
  int get hashCode => kind.hashCode;
}

final class ActuatorType extends DeviceType {
  final ActuatorKind kind;

  const ActuatorType(this.kind);

  @override
  String toString() => kind.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActuatorType &&
          runtimeType == other.runtimeType &&
          kind == other.kind;

  @override
  int get hashCode => kind.hashCode;
}

enum SensorKind {
  temperature,
  soilMoisture,
  lightIntensity,
}

enum ActuatorKind {
  light,
  outlet,
  irrigation,
  other,
}
