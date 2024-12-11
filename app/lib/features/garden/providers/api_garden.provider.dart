import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/garden/models/garden.dart' as model;
import 'package:app/features/garden/providers/garden_provider.dart';
import 'package:app/gen/openapi/lib/api.dart';

class ApiGardenProvider extends GardenProvider {
  final api = DefaultApi();
  List<model.Garden>? _gardens;

  @override
  List<model.Garden> get gardens {
    _fetchGardens();
    return _gardens ?? [];
  }

  Future<void> _fetchGardens() async {
    if (_gardens != null) return;

    final apiGardens = await api.gardensGet();
    _gardens = apiGardens!
        .map((garden) => model.Garden(
              id: garden.id,
              name: garden.name,
              sensors: {},
              actuators: [],
            ))
        .toList();
    notifyListeners();
  }

  @override
  void addDevice(String gardenId, String deviceId, DeviceType deviceType) {
    // TODO: implement addDevice
  }

  @override
  void addGarden(String name) {
    // TODO: implement addGarden
  }

  @override
  model.Garden? getGardenById(String id) {
    // TODO: implement getGardenById
    throw UnimplementedError();
  }
}
