class Species {
  final String id;
  final Taxonomy taxonomy;
  final Assets assets;

  Species({
    required this.id,
    required this.taxonomy,
    required this.assets,
  });
}

class PlantFactSheet {
  final String id;
  final Taxonomy taxonomy;
  final String? imageUrl;
  final Requirements requirements;

  PlantFactSheet({
    required this.id,
    required this.taxonomy,
    required this.requirements,
    required this.imageUrl,
  });
}

class Taxonomy {
  final String scientificName;
  final String commonName;

  Taxonomy({
    required this.scientificName,
    required this.commonName,
  });
}

class Requirements {
  final Requirement temperature;
  final Requirement soilMoisture;
  final Requirement lightIntensity;

  Requirements({
    required this.temperature,
    required this.soilMoisture,
    required this.lightIntensity,
  });

  @override
  String toString() {
    return 'Requirements(temperature: $temperature, soilMoisture: $soilMoisture, lightIntensity: $lightIntensity)';
  }
}

class Requirement {
  final double min;
  final double max;
  final String unit;

  Requirement({
    required this.min,
    required this.max,
    required this.unit,
  });

  @override
  String toString() {
    return '(min: $min, max: $max, unit: $unit)';
  }
}

class Assets {
  final String imageUrl;

  Assets({required this.imageUrl});
}
