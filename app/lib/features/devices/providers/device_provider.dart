import 'package:flutter/foundation.dart';
import 'package:app/features/devices/models/device.dart';

abstract class DeviceProvider extends ChangeNotifier {
  List<Device> get devices;
  Future<void> refresh();
}
