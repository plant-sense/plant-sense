//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GardenCreate {
  /// Returns a new [GardenCreate] instance.
  GardenCreate({
    required this.name,
  });

  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GardenCreate && other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode);

  @override
  String toString() => 'GardenCreate[name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [GardenCreate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GardenCreate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "GardenCreate[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "GardenCreate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GardenCreate(
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<GardenCreate> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <GardenCreate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GardenCreate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GardenCreate> mapFromJson(dynamic json) {
    final map = <String, GardenCreate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GardenCreate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GardenCreate-objects as value to a dart map
  static Map<String, List<GardenCreate>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<GardenCreate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GardenCreate.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}
