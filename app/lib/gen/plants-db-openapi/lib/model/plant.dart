//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Plant {
  /// Returns a new [Plant] instance.
  Plant({
    required this.id,
    required this.taxonomy,
  });

  String id;

  Taxonomy taxonomy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Plant && other.id == id && other.taxonomy == taxonomy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (taxonomy.hashCode);

  @override
  String toString() => 'Plant[id=$id, taxonomy=$taxonomy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'taxonomy'] = this.taxonomy;
    return json;
  }

  /// Returns a new [Plant] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Plant? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Plant[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Plant[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Plant(
        id: mapValueOfType<String>(json, r'id')!,
        taxonomy: Taxonomy.fromJson(json[r'taxonomy'])!,
      );
    }
    return null;
  }

  static List<Plant> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Plant>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Plant.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Plant> mapFromJson(dynamic json) {
    final map = <String, Plant>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Plant.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Plant-objects as value to a dart map
  static Map<String, List<Plant>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Plant>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Plant.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'taxonomy',
  };
}
