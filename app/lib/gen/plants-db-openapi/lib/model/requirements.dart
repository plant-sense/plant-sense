//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Requirements {
  /// Returns a new [Requirements] instance.
  Requirements({
    required this.temperature,
    required this.soilMoisture,
    required this.lightIntensity,
  });

  Requirement temperature;

  Requirement soilMoisture;

  Requirement lightIntensity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Requirements &&
          other.temperature == temperature &&
          other.soilMoisture == soilMoisture &&
          other.lightIntensity == lightIntensity;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (temperature.hashCode) +
      (soilMoisture.hashCode) +
      (lightIntensity.hashCode);

  @override
  String toString() =>
      'Requirements[temperature=$temperature, soilMoisture=$soilMoisture, lightIntensity=$lightIntensity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'temperature'] = this.temperature;
    json[r'soil_moisture'] = this.soilMoisture;
    json[r'light_intensity'] = this.lightIntensity;
    return json;
  }

  /// Returns a new [Requirements] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Requirements? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Requirements[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Requirements[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Requirements(
        temperature: Requirement.fromJson(json[r'temperature'])!,
        soilMoisture: Requirement.fromJson(json[r'soil_moisture'])!,
        lightIntensity: Requirement.fromJson(json[r'light_intensity'])!,
      );
    }
    return null;
  }

  static List<Requirements> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Requirements>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Requirements.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Requirements> mapFromJson(dynamic json) {
    final map = <String, Requirements>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Requirements.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Requirements-objects as value to a dart map
  static Map<String, List<Requirements>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Requirements>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Requirements.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'temperature',
    'soil_moisture',
    'light_intensity',
  };
}
