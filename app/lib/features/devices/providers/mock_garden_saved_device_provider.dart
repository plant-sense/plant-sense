// import 'package:app/features/devices/models/device.dart';
// import 'package:app/features/devices/models/device_type.dart';
// import 'package:app/features/devices/providers/device_provider.dart';

// class MockGardenDeviceProvider extends DeviceProvider {
//   final String gardenId;

//   MockGardenDeviceProvider(this.gardenId);

//   final List<Device> _devices = [
//     // Sensors
//     Device(
//       id: 'GARDEN-A1:B2:C3:D4:E5:F6',
//       deviceType: SensorType(SensorKind.temperature),
//     ),
//     Device(
//       id: 'GARDEN-F7:E8:D9:C0:B1:A2',
//       deviceType: SensorType(SensorKind.soilMoisture),
//     ),
//     Device(
//       id: 'GARDEN-12:34:56:78:9A:BC',
//       deviceType: SensorType(SensorKind.lightIntensity),
//     ),
//     // Actuators
//   ];

//   @override
//   List<Device> get devices => List.unmodifiable(_devices);

//   @override
//   Future<void> refresh() async {
//     notifyListeners();
//   }
// }
