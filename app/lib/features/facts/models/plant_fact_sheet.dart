import 'package:uuid/uuid.dart';

class GrowingConditions {
  final double minTemperature;
  final double maxTemperature;
  final double minSoilHumidity;
  final double maxSoilHumidity;
  final double minLightIntensity;
  final double maxLightIntensity;

  const GrowingConditions({
    required this.minTemperature,
    required this.maxTemperature,
    required this.minSoilHumidity,
    required this.maxSoilHumidity,
    required this.minLightIntensity,
    required this.maxLightIntensity,
  });
}

class PlantFactSheet {
  final String uuid;
  final String scientificName;
  final String commonName;
  final String imageUrl;
  final GrowingConditions idealConditions;

  PlantFactSheet({
    String? uuid,
    required this.scientificName,
    required this.commonName,
    required this.idealConditions,
    required this.imageUrl,
  }) : uuid = uuid ?? const Uuid().v4();
}
