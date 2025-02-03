import 'package:app/features/devices/models/device.dart' as model;
import 'package:app/features/devices/models/device_type.dart' as model;
import 'package:app/features/devices/providers/device_provider.dart';
import 'package:app/gen/grpc/devices.pbgrpc.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc_web.dart';

class GrpcDeviceProvider extends DeviceProvider {
  late final GrpcWebClientChannel channel;
  late final DeviceServiceClient client;

  GrpcDeviceProvider({
    String host = "grpc.localhost",
    int port = 80,
  }) {
    print("Device: GRPC host $host, port $port");
    var uri = getUri(host, port);
    print("Device: GRPC base path ${uri.toString()}");
    channel = GrpcWebClientChannel.xhr(uri);
    client = DeviceServiceClient(channel);
  }

  Uri getUri(String host, int port) {
    if (!kIsWeb) {
      return Uri(host: host, port: port);
    }

    var base = Uri.base;
    return Uri(scheme: base.scheme, host: base.host, port: port);
  }

  List<model.Device> _devices = [];
  @override
  List<model.Device> get devices {
    return _devices;
  }

  @override
  Future<void> refresh() async {
    // debugPrint("Refreshing devices");
    var pb_devices = await client.listDevices(ListDevicesRequest());
    _devices.clear();
    debugPrint("Devices length: ${pb_devices.devices.length}");
    for (var pb_d in pb_devices.devices) {
      var type = convertDeviceTypes(pb_d.type);
      print("Device type: ${type}");
      devices.add(model.Device(id: pb_d.id, deviceType: type!));
    }
  }

  @override
  Future<List<model.Device>> getDevices() async {
    await refresh();
    // notifyListeners();
    return _devices;
  }

  Future<void> refreshNotify() async {
    await refresh();
    notifyListeners();
  }

  model.DeviceType? convertDeviceTypes(DeviceType pdt) {
    switch (pdt.whichType()) {
      case DeviceType_Type.actuator:
        return convertActuatorType(pdt.actuator);
      case DeviceType_Type.sensor:
        return convertSensorType(pdt.sensor);
      case DeviceType_Type.notSet:
        return null;
    }
    // if (pdt.sensor == SensorKind.SENSOR_KIND_SOIL_HUMIDITY) {
    //   return model.SensorType(model.SensorKind.soilMoisture);
    // } else if (pdt.sensor == SensorKind.SENSOR_KIND_TEMPERATURE) {
    //   return model.SensorType(model.SensorKind.temperature);
    // } else if (pdt.sensor == SensorKind.SENSOR_KIND_LIGHT) {
    //   return model.SensorType(model.SensorKind.lightIntensity);
    // } else
    //   return null;
  }

  model.ActuatorType? convertActuatorType(ActuatorKind kind) {
    switch (kind) {
      case ActuatorKind.ACTUATOR_KIND_LIGHT:
        return model.ActuatorType(model.ActuatorKind.light);
      case ActuatorKind.ACTUATOR_KIND_OUTLET:
        return model.ActuatorType(model.ActuatorKind.outlet);
      case ActuatorKind.ACTUATOR_KIND_IRRIGATION:
        return model.ActuatorType(model.ActuatorKind.irrigation);
      case ActuatorKind.ACTUATOR_KIND_UNSPECIFIED:
        return null;
    }
  }

  model.SensorType? convertSensorType(SensorKind kind) {
    switch (kind) {
      case SensorKind.SENSOR_KIND_SOIL_HUMIDITY:
        return model.SensorType(model.SensorKind.soilMoisture);
      case SensorKind.SENSOR_KIND_TEMPERATURE:
        return model.SensorType(model.SensorKind.temperature);
      case SensorKind.SENSOR_KIND_LIGHT:
        return model.SensorType(model.SensorKind.lightIntensity);
      case SensorKind.SENSOR_KIND_UNSPECIFIED:
        return null;
    }
  }
}
