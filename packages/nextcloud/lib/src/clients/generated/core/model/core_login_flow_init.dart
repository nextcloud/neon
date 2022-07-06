//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreLoginFlowInit {
  /// Returns a new [CoreLoginFlowInit] instance.
  CoreLoginFlowInit({
    this.poll,
    this.login,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreLoginFlowInitPoll? poll;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? login;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CoreLoginFlowInit && other.poll == poll && other.login == login;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (poll == null ? 0 : poll!.hashCode) + (login == null ? 0 : login!.hashCode);

  @override
  String toString() => 'CoreLoginFlowInit[poll=$poll, login=$login]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (poll != null) {
      _json[r'poll'] = poll;
    }
    if (login != null) {
      _json[r'login'] = login;
    }
    return _json;
  }

  /// Returns a new [CoreLoginFlowInit] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreLoginFlowInit? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CoreLoginFlowInit[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CoreLoginFlowInit[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreLoginFlowInit(
        poll: CoreLoginFlowInitPoll.fromJson(json[r'poll']),
        login: mapValueOfType<String>(json, r'login'),
      );
    }
    return null;
  }

  static List<CoreLoginFlowInit>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreLoginFlowInit>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreLoginFlowInit.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreLoginFlowInit> mapFromJson(dynamic json) {
    final map = <String, CoreLoginFlowInit>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreLoginFlowInit.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreLoginFlowInit-objects as value to a dart map
  static Map<String, List<CoreLoginFlowInit>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreLoginFlowInit>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreLoginFlowInit.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
