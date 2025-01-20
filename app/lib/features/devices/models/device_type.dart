sealed class DeviceType {
  const DeviceType();

  bool get isSensor => this is SensorType;
  bool get isActuator => this is ActuatorType;
}

final class SensorType extends DeviceType {
  final SensorKind kind;

  const SensorType(this.kind);

  @override
  String toString() => kind.displayName;

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
  String toString() => kind.displayName;

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
  temperature('Temperature'),
  soilMoisture('Soil moisture'),
  lightIntensity('Light intensity');

  final String displayName;
  const SensorKind(this.displayName);

  @override
  String toString() => displayName;
}

enum ActuatorKind {
  light('Light'),
  outlet('Outlet'),
  irrigation('Irrigation'),
  other('Other');

  final String displayName;
  const ActuatorKind(this.displayName);

  @override
  String toString() => displayName;
}
