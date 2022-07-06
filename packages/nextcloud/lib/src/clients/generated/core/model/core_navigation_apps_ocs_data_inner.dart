//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreNavigationAppsOcsDataInner {
  /// Returns a new [CoreNavigationAppsOcsDataInner] instance.
  CoreNavigationAppsOcsDataInner({
    this.id,
    this.order,
    this.href,
    this.icon,
    this.type,
    this.name,
    this.active,
    this.classes,
    this.unread,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Can either be a string or integer, see bug report https://github.com/nextcloud/server/issues/32828
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? order;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? href;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? icon;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? active;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? classes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? unread;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreNavigationAppsOcsDataInner &&
          other.id == id &&
          other.order == order &&
          other.href == href &&
          other.icon == icon &&
          other.type == type &&
          other.name == name &&
          other.active == active &&
          other.classes == classes &&
          other.unread == unread;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (order == null ? 0 : order!.hashCode) +
      (href == null ? 0 : href!.hashCode) +
      (icon == null ? 0 : icon!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (active == null ? 0 : active!.hashCode) +
      (classes == null ? 0 : classes!.hashCode) +
      (unread == null ? 0 : unread!.hashCode);

  @override
  String toString() =>
      'CoreNavigationAppsOcsDataInner[id=$id, order=$order, href=$href, icon=$icon, type=$type, name=$name, active=$active, classes=$classes, unread=$unread]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (id != null) {
      _json[r'id'] = id;
    }
    if (order != null) {
      _json[r'order'] = order;
    }
    if (href != null) {
      _json[r'href'] = href;
    }
    if (icon != null) {
      _json[r'icon'] = icon;
    }
    if (type != null) {
      _json[r'type'] = type;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    if (active != null) {
      _json[r'active'] = active;
    }
    if (classes != null) {
      _json[r'classes'] = classes;
    }
    if (unread != null) {
      _json[r'unread'] = unread;
    }
    return _json;
  }

  /// Returns a new [CoreNavigationAppsOcsDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreNavigationAppsOcsDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CoreNavigationAppsOcsDataInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CoreNavigationAppsOcsDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreNavigationAppsOcsDataInner(
        id: mapValueOfType<String>(json, r'id'),
        order: mapValueOfType<Object>(json, r'order'),
        href: mapValueOfType<String>(json, r'href'),
        icon: mapValueOfType<String>(json, r'icon'),
        type: mapValueOfType<String>(json, r'type'),
        name: mapValueOfType<String>(json, r'name'),
        active: mapValueOfType<bool>(json, r'active'),
        classes: mapValueOfType<String>(json, r'classes'),
        unread: mapValueOfType<int>(json, r'unread'),
      );
    }
    return null;
  }

  static List<CoreNavigationAppsOcsDataInner>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreNavigationAppsOcsDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreNavigationAppsOcsDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreNavigationAppsOcsDataInner> mapFromJson(dynamic json) {
    final map = <String, CoreNavigationAppsOcsDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreNavigationAppsOcsDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreNavigationAppsOcsDataInner-objects as value to a dart map
  static Map<String, List<CoreNavigationAppsOcsDataInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreNavigationAppsOcsDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreNavigationAppsOcsDataInner.listFromJson(
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
