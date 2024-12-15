import 'package:app/features/devices/models/device.dart' as model;
import 'package:app/features/devices/models/device_type.dart' as model;
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/gen/grpc/devices.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

class GrpcDeviceProvider extends DeviceProvider {
  final GrpcOrGrpcWebClientChannel channel;
  late final DeviceServiceClient client;

  GrpcDeviceProvider({
    required String host,
    int port = 50051,
  }) : channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
            host: host, port: port, transportSecure: false) {
    client = DeviceServiceClient(channel);
  }

  List<model.Device> _devices = [];
  @override
  List<model.Device> get devices {
    refresh();
    return _devices;
  }

  Future<void> refresh() async {
    var pb_devices = await client.listDevices(ListDevicesRequest());
    _devices.clear();
    for (var pb_d in pb_devices.devices) {
      var type = convertDeviceTypes(pb_d.type)!;
      devices.add(model.Device(id: pb_d.id, deviceType: type));
    }
  }

  model.DeviceType? convertDeviceTypes(DeviceType pdt) {
    if (pdt.sensor == SensorKind.SENSOR_KIND_SOIL_HUMIDITY) {
      return model.SensorType(model.SensorKind.soilMoisture);
    } else if (pdt.sensor == SensorKind.SENSOR_KIND_TEMPERATURE) {
      return model.SensorType(model.SensorKind.temperature);
    }
    return null;
  }
}
