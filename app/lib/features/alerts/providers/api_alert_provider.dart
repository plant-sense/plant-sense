import 'package:app/features/alerts/providers/alert_provider.dart';
import 'package:app/features/devices/models/device_type.dart';
import 'package:app/features/facts/providers/api_plant_fact_sheet_provider.dart';
import 'package:app/gen/grpc/sensor_data.pbgrpc.dart';
import 'package:app/services/grpc_channel.dart';

import '../../devices/models/device.dart';
import '../../facts/models/plant_fact_sheet.dart';
import '../../plant/models/plant.dart';
import '../models/alert.dart';

class ApiAlertProvider extends AlertProvider {
  final ApiPlantFactSheetProvider plantFactSheetProvider;
  final SensorServiceClient client;

  ApiAlertProvider(
      {required this.plantFactSheetProvider,
      required String grpc_host,
      required int grpc_port})
      : client = SensorServiceClient(
            GrpcChannelService.createChannel(host: grpc_host, port: grpc_port));

  @override
  Future<List<Alert>> getAlertsForGarden(
      String gardenId, List<Plant> plants, List<Device> sensors) async {
    var alerts = <Alert>[];

    var futures = <Future<PlantFactSheet?>>[];
    for (var plant in plants) {
      futures.add(plantFactSheetProvider.getFactSheetById(plant.factsheetId));
    }
    var factsheets = await Future.wait<PlantFactSheet?>(futures);
    var factsheetsMap = {
      for (var e in factsheets.where((element) => element != null))
        (e as PlantFactSheet).id: e
    };

    var sensorsDataFutures = <Future<SensorReading>>[];
    for (var sensor in sensors) {
      sensorsDataFutures
          .add(client.getReading(GetReadingRequest(deviceId: sensor.id)));
    }
    var sensorsData = await Future.wait<SensorReading>(sensorsDataFutures);
    var sensorsDataMap = {for (var e in sensorsData) e.deviceId: e};

    for (var sensor in sensors) {
      var sensorType = sensor.deviceType as SensorType;
      var sensorData = sensorsDataMap[sensor.id]!;

      for (var plant in plants) {
        var factsheet = factsheetsMap[plant.factsheetId]!;
        var requirement =
            _getRequirementForSensorType(sensorType.kind, factsheet);

        if (sensorData.reading.value < requirement.min) {
          alerts.add(Alert(
            gardenId: gardenId,
            plant: plant,
            sensor: sensor,
            sensorKind: sensorType.kind,
            valueAlertType: ValueAlertType.below,
            plantFactSheet: factsheet,
          ));
        } else if (sensorData.reading.value > requirement.max) {
          alerts.add(Alert(
            gardenId: gardenId,
            plant: plant,
            sensor: sensor,
            sensorKind: sensorType.kind,
            valueAlertType: ValueAlertType.above,
            plantFactSheet: factsheet,
          ));
        }
      }
    }
    return alerts;
  }

  Requirement _getRequirementForSensorType(
      SensorKind sensorKind, PlantFactSheet factsheet) {
    switch (sensorKind) {
      case SensorKind.lightIntensity:
        return factsheet.requirements.lightIntensity;
      case SensorKind.soilMoisture:
        return factsheet.requirements.soilMoisture;
      case SensorKind.temperature:
        return factsheet.requirements.temperature;
    }
  }
}
