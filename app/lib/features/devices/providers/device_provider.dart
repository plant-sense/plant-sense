import 'package:flutter/foundation.dart';
import 'package:app/features/devices/models/device.dart';

abstract class DeviceProvider extends ChangeNotifier {
  List<Device> get devices;
  Future<void> refresh();
  Device getDeviceById(String id) {
    return devices.firstWhere((element) => element.id == id);
  }

  Future<List<Device>> getDevices();
}
