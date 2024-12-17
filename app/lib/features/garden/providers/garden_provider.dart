import 'package:app/features/devices/models/device_type.dart' as dt;
import 'package:app/features/garden/models/garden.dart';
import 'package:flutter/foundation.dart';

abstract class GardenProvider extends ChangeNotifier {
  List<Garden> get gardens;
  Future<Garden?> getGardenById(String id);
  Future<List<DeviceReference>> getDevicesByGardenId(String gardenId);
  void addGarden(String name);
  void addDevice(String gardenId, String deviceId, dt.DeviceType deviceType);
}
