//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Assets {
  /// Returns a new [Assets] instance.
  Assets({
    this.defaultImageUrl,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultImageUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Assets && other.defaultImageUrl == defaultImageUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (defaultImageUrl == null ? 0 : defaultImageUrl!.hashCode);

  @override
  String toString() => 'Assets[defaultImageUrl=$defaultImageUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultImageUrl != null) {
      json[r'default_image_url'] = this.defaultImageUrl;
    } else {
      json[r'default_image_url'] = null;
    }
    return json;
  }

  /// Returns a new [Assets] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Assets? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Assets[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Assets[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Assets(
        defaultImageUrl: mapValueOfType<String>(json, r'default_image_url'),
      );
    }
    return null;
  }

  static List<Assets> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Assets>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Assets.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Assets> mapFromJson(dynamic json) {
    final map = <String, Assets>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Assets.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Assets-objects as value to a dart map
  static Map<String, List<Assets>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Assets>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Assets.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
