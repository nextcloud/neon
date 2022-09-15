//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationsPushNotificationDecryptedSubject {
  /// Returns a new [NotificationsPushNotificationDecryptedSubject] instance.
  NotificationsPushNotificationDecryptedSubject({
    this.nid,
    this.app,
    this.subject,
    this.type,
    this.id,
    this.delete,
    this.deleteAll,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? nid;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? app;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subject;

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
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? delete;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deleteAll;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsPushNotificationDecryptedSubject &&
          other.nid == nid &&
          other.app == app &&
          other.subject == subject &&
          other.type == type &&
          other.id == id &&
          other.delete == delete &&
          other.deleteAll == deleteAll;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nid == null ? 0 : nid!.hashCode) +
      (app == null ? 0 : app!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (id == null ? 0 : id!.hashCode) +
      (delete == null ? 0 : delete!.hashCode) +
      (deleteAll == null ? 0 : deleteAll!.hashCode);

  @override
  String toString() =>
      'NotificationsPushNotificationDecryptedSubject[nid=$nid, app=$app, subject=$subject, type=$type, id=$id, delete=$delete, deleteAll=$deleteAll]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nid != null) {
      json[r'nid'] = this.nid;
    } else {
      json[r'nid'] = null;
    }
    if (this.app != null) {
      json[r'app'] = this.app;
    } else {
      json[r'app'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.delete != null) {
      json[r'delete'] = this.delete;
    } else {
      json[r'delete'] = null;
    }
    if (this.deleteAll != null) {
      json[r'delete-all'] = this.deleteAll;
    } else {
      json[r'delete-all'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationsPushNotificationDecryptedSubject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationsPushNotificationDecryptedSubject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "NotificationsPushNotificationDecryptedSubject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "NotificationsPushNotificationDecryptedSubject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationsPushNotificationDecryptedSubject(
        nid: mapValueOfType<int>(json, r'nid'),
        app: mapValueOfType<String>(json, r'app'),
        subject: mapValueOfType<String>(json, r'subject'),
        type: mapValueOfType<String>(json, r'type'),
        id: mapValueOfType<String>(json, r'id'),
        delete: mapValueOfType<bool>(json, r'delete'),
        deleteAll: mapValueOfType<bool>(json, r'delete-all'),
      );
    }
    return null;
  }

  static List<NotificationsPushNotificationDecryptedSubject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationsPushNotificationDecryptedSubject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationsPushNotificationDecryptedSubject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationsPushNotificationDecryptedSubject> mapFromJson(dynamic json) {
    final map = <String, NotificationsPushNotificationDecryptedSubject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsPushNotificationDecryptedSubject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationsPushNotificationDecryptedSubject-objects as value to a dart map
  static Map<String, List<NotificationsPushNotificationDecryptedSubject>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationsPushNotificationDecryptedSubject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsPushNotificationDecryptedSubject.listFromJson(
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
