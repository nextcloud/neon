//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProvisioningApiUserDetailsQuota {
  /// Returns a new [ProvisioningApiUserDetailsQuota] instance.
  ProvisioningApiUserDetailsQuota({
    this.free,
    this.used,
    this.total,
    this.relative,
    this.quota,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? free;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? used;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? relative;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? quota;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvisioningApiUserDetailsQuota &&
          other.free == free &&
          other.used == used &&
          other.total == total &&
          other.relative == relative &&
          other.quota == quota;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (free == null ? 0 : free!.hashCode) +
      (used == null ? 0 : used!.hashCode) +
      (total == null ? 0 : total!.hashCode) +
      (relative == null ? 0 : relative!.hashCode) +
      (quota == null ? 0 : quota!.hashCode);

  @override
  String toString() =>
      'ProvisioningApiUserDetailsQuota[free=$free, used=$used, total=$total, relative=$relative, quota=$quota]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (free != null) {
      _json[r'free'] = free;
    } else {
      _json[r'free'] = null;
    }
    if (used != null) {
      _json[r'used'] = used;
    } else {
      _json[r'used'] = null;
    }
    if (total != null) {
      _json[r'total'] = total;
    } else {
      _json[r'total'] = null;
    }
    if (relative != null) {
      _json[r'relative'] = relative;
    } else {
      _json[r'relative'] = null;
    }
    if (quota != null) {
      _json[r'quota'] = quota;
    } else {
      _json[r'quota'] = null;
    }
    return _json;
  }

  /// Returns a new [ProvisioningApiUserDetailsQuota] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProvisioningApiUserDetailsQuota? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProvisioningApiUserDetailsQuota[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProvisioningApiUserDetailsQuota[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProvisioningApiUserDetailsQuota(
        free: mapValueOfType<int>(json, r'free'),
        used: mapValueOfType<int>(json, r'used'),
        total: mapValueOfType<int>(json, r'total'),
        relative: json[r'relative'] == null ? null : num.parse(json[r'relative'].toString()),
        quota: mapValueOfType<int>(json, r'quota'),
      );
    }
    return null;
  }

  static List<ProvisioningApiUserDetailsQuota>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProvisioningApiUserDetailsQuota>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProvisioningApiUserDetailsQuota.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProvisioningApiUserDetailsQuota> mapFromJson(dynamic json) {
    final map = <String, ProvisioningApiUserDetailsQuota>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProvisioningApiUserDetailsQuota.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProvisioningApiUserDetailsQuota-objects as value to a dart map
  static Map<String, List<ProvisioningApiUserDetailsQuota>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProvisioningApiUserDetailsQuota>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProvisioningApiUserDetailsQuota.listFromJson(
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
