class ActuatorState {
  final String deviceId;
  final bool state;
  final double? intensity;

  const ActuatorState({
    required this.deviceId,
    required this.state,
    this.intensity,
  });
}
