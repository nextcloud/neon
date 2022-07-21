//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreLoginFlowResult {
  /// Returns a new [CoreLoginFlowResult] instance.
  CoreLoginFlowResult({
    this.server,
    this.loginName,
    this.appPassword,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? server;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? loginName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? appPassword;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreLoginFlowResult &&
          other.server == server &&
          other.loginName == loginName &&
          other.appPassword == appPassword;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (server == null ? 0 : server!.hashCode) +
      (loginName == null ? 0 : loginName!.hashCode) +
      (appPassword == null ? 0 : appPassword!.hashCode);

  @override
  String toString() => 'CoreLoginFlowResult[server=$server, loginName=$loginName, appPassword=$appPassword]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (server != null) {
      _json[r'server'] = server;
    } else {
      _json[r'server'] = null;
    }
    if (loginName != null) {
      _json[r'loginName'] = loginName;
    } else {
      _json[r'loginName'] = null;
    }
    if (appPassword != null) {
      _json[r'appPassword'] = appPassword;
    } else {
      _json[r'appPassword'] = null;
    }
    return _json;
  }

  /// Returns a new [CoreLoginFlowResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreLoginFlowResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CoreLoginFlowResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CoreLoginFlowResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreLoginFlowResult(
        server: mapValueOfType<String>(json, r'server'),
        loginName: mapValueOfType<String>(json, r'loginName'),
        appPassword: mapValueOfType<String>(json, r'appPassword'),
      );
    }
    return null;
  }

  static List<CoreLoginFlowResult>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreLoginFlowResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreLoginFlowResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreLoginFlowResult> mapFromJson(dynamic json) {
    final map = <String, CoreLoginFlowResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreLoginFlowResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreLoginFlowResult-objects as value to a dart map
  static Map<String, List<CoreLoginFlowResult>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreLoginFlowResult>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreLoginFlowResult.listFromJson(
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
