import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/garden/models/garden.dart';
import 'package:flutter/foundation.dart';

abstract class GardenProvider extends ChangeNotifier {
  List<Garden> get gardens;
  Garden? getGardenById(String id);
  void addGarden(String name);
  void addDevice(String gardenId, String deviceId, DeviceType deviceType);
}
