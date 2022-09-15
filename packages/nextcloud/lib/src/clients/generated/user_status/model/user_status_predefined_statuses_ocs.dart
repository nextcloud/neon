//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusPredefinedStatusesOcs {
  /// Returns a new [UserStatusPredefinedStatusesOcs] instance.
  UserStatusPredefinedStatusesOcs({
    this.meta,
    this.data = const [],
  });

  /// Stub
  Object? meta;

  List<UserStatusPredefinedStatus> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UserStatusPredefinedStatusesOcs && other.meta == meta && other.data == data;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (meta == null ? 0 : meta!.hashCode) + (data.hashCode);

  @override
  String toString() => 'UserStatusPredefinedStatusesOcs[meta=$meta, data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.meta != null) {
      json[r'meta'] = this.meta;
    } else {
      json[r'meta'] = null;
    }
    json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [UserStatusPredefinedStatusesOcs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserStatusPredefinedStatusesOcs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserStatusPredefinedStatusesOcs[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserStatusPredefinedStatusesOcs[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserStatusPredefinedStatusesOcs(
        meta: mapValueOfType<Object>(json, r'meta'),
        data: UserStatusPredefinedStatus.listFromJson(json[r'data']) ?? const [],
      );
    }
    return null;
  }

  static List<UserStatusPredefinedStatusesOcs>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusPredefinedStatusesOcs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusPredefinedStatusesOcs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserStatusPredefinedStatusesOcs> mapFromJson(dynamic json) {
    final map = <String, UserStatusPredefinedStatusesOcs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusPredefinedStatusesOcs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserStatusPredefinedStatusesOcs-objects as value to a dart map
  static Map<String, List<UserStatusPredefinedStatusesOcs>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserStatusPredefinedStatusesOcs>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserStatusPredefinedStatusesOcs.listFromJson(
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
