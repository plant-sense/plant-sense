//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Factsheet {
  /// Returns a new [Factsheet] instance.
  Factsheet({
    required this.id,
    required this.taxonomy,
    required this.requirements,
  });

  String id;

  Taxonomy taxonomy;

  Requirements requirements;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Factsheet &&
          other.id == id &&
          other.taxonomy == taxonomy &&
          other.requirements == requirements;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) + (taxonomy.hashCode) + (requirements.hashCode);

  @override
  String toString() =>
      'Factsheet[id=$id, taxonomy=$taxonomy, requirements=$requirements]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'taxonomy'] = this.taxonomy;
    json[r'requirements'] = this.requirements;
    return json;
  }

  /// Returns a new [Factsheet] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Factsheet? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Factsheet[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Factsheet[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Factsheet(
        id: mapValueOfType<String>(json, r'id')!,
        taxonomy: Taxonomy.fromJson(json[r'taxonomy'])!,
        requirements: Requirements.fromJson(json[r'requirements'])!,
      );
    }
    return null;
  }

  static List<Factsheet> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Factsheet>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Factsheet.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Factsheet> mapFromJson(dynamic json) {
    final map = <String, Factsheet>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Factsheet.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Factsheet-objects as value to a dart map
  static Map<String, List<Factsheet>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Factsheet>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Factsheet.listFromJson(
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
    'requirements',
  };
}
