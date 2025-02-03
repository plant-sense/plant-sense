import 'package:app/features/actuators/models/state.dart';
import 'package:flutter/material.dart';

abstract class ActuatorProvider extends ChangeNotifier {
  setState(String deviceId, ActuatorState state);
  Future<ActuatorState> getState(String deviceId);
}
