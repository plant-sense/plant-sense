import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/garden/providers/garden_provider.dart';
import '../models/garden.dart';

class MockGardenProvider extends GardenProvider {
  final List<Garden> _gardens;

  MockGardenProvider() : _gardens = _initializeGardens();

  @override
  List<Garden> get gardens => List.unmodifiable(_gardens);

  static const _staticIds = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  static List<Garden> _initializeGardens() {
    const imageUrl =
        'https://images.unsplash.com/photo-1529313780224-1a12b68bed16?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    return List.generate(
      10,
      (index) => Garden(
        id: _staticIds[index],
        name: 'Garden $index',
        imageUrl: imageUrl,
        sensors: {
          SensorType(SensorKind.temperature): 'A1:B2:C3:D4:E5:F6',
          SensorType(SensorKind.soilMoisture): 'F7:E8:D9:C0:B1:A2',
          SensorType(SensorKind.lightIntensity): '12:34:56:78:9A:BC',
        },
        actuators: ['4', '5', '6'],
      ),
    );
  }

  @override
  Garden? getGardenById(String id) => _gardens.firstWhere(
        (garden) => garden.id == id,
      );

  @override
  void addGarden(String name) {
    const imageUrl =
        'https://images.unsplash.com/photo-1529313780224-1a12b68bed16?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    final newGarden = Garden(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      imageUrl: imageUrl,
      sensors: {
        SensorType(SensorKind.temperature): '1',
        SensorType(SensorKind.soilMoisture): '2',
        SensorType(SensorKind.lightIntensity): '3',
      },
      actuators: ['4', '5', '6'],
    );

    _gardens.add(newGarden);
    notifyListeners();
  }

  @override
  void addDevice(String gardenId, String deviceId, DeviceType deviceType) {
    var garden = _gardens.firstWhere((garden) => garden.id == gardenId);

    if (deviceId is SensorType) {
      garden.sensors[deviceType as SensorType] = deviceId;
    } else {
      garden.actuators.add(deviceId);
    }
  }
}
