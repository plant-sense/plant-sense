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
    required this.factsheetId,
    required this.name,
    this.imageUrl,
  });

  String id;

  String factsheetId;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imageUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Plant &&
          other.id == id &&
          other.factsheetId == factsheetId &&
          other.name == name &&
          other.imageUrl == imageUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (factsheetId.hashCode) +
      (name.hashCode) +
      (imageUrl == null ? 0 : imageUrl!.hashCode);

  @override
  String toString() =>
      'Plant[id=$id, factsheetId=$factsheetId, name=$name, imageUrl=$imageUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'factsheet_id'] = this.factsheetId;
    json[r'name'] = this.name;
    if (this.imageUrl != null) {
      json[r'image_url'] = this.imageUrl;
    } else {
      json[r'image_url'] = null;
    }
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
        factsheetId: mapValueOfType<String>(json, r'factsheet_id')!,
        name: mapValueOfType<String>(json, r'name')!,
        imageUrl: mapValueOfType<String>(json, r'image_url'),
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
    'factsheet_id',
    'name',
  };
}
