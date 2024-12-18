// import 'package:app/features/devices/models/device.dart';
// import 'package:app/features/devices/models/device_type.dart';
// import 'package:app/features/devices/providers/device_provider.dart';

// class MockDeviceProvider extends DeviceProvider {
//   final List<Device> _devices = [
//     // Sensors
//     Device(
//       id: 'A1:B2:C3:D4:E5:F6',
//       deviceType: SensorType(SensorKind.temperature),
//     ),
//     Device(
//       id: 'A2:B3:C3:D4:E5:F6',
//       deviceType: SensorType(SensorKind.temperature),
//     ),
//     Device(
//       id: 'F7:E8:D9:C0:B1:A2',
//       deviceType: SensorType(SensorKind.soilMoisture),
//     ),
//     Device(
//       id: '12:34:56:78:9A:BC',
//       deviceType: SensorType(SensorKind.lightIntensity),
//     ),
//     // Actuators
//     Device(
//       id: 'BC:DE:F0:12:34:56',
//       deviceType: ActuatorType(ActuatorKind.light),
//     ),
//     Device(
//       id: '78:90:AB:CD:EF:01',
//       deviceType: ActuatorType(ActuatorKind.outlet),
//     ),
//     Device(
//       id: '23:45:67:89:AB:CD',
//       deviceType: ActuatorType(ActuatorKind.irrigation),
//     ),
//     Device(
//       id: 'EF:01:23:45:67:89',
//       deviceType: ActuatorType(ActuatorKind.other),
//     ),
//   ];

//   @override
//   List<Device> get devices => List.unmodifiable(_devices);

//   @override
//   Future<void> refresh() async {
//     notifyListeners();
//   }
// }
