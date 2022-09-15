//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationsNotification {
  /// Returns a new [NotificationsNotification] instance.
  NotificationsNotification({
    this.notificationId,
    this.app,
    this.user,
    this.datetime,
    this.objectType,
    this.objectId,
    this.subject,
    this.message,
    this.link,
    this.subjectRich,
    this.subjectRichParameters = const [],
    this.messageRich,
    this.messageRichParameters = const [],
    this.icon,
    this.actions = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? notificationId;

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
  String? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? datetime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? objectType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? objectId;

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
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? link;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subjectRich;

  List<String> subjectRichParameters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? messageRich;

  List<String> messageRichParameters;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? icon;

  List<NotificationsNotificationAction> actions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsNotification &&
          other.notificationId == notificationId &&
          other.app == app &&
          other.user == user &&
          other.datetime == datetime &&
          other.objectType == objectType &&
          other.objectId == objectId &&
          other.subject == subject &&
          other.message == message &&
          other.link == link &&
          other.subjectRich == subjectRich &&
          other.subjectRichParameters == subjectRichParameters &&
          other.messageRich == messageRich &&
          other.messageRichParameters == messageRichParameters &&
          other.icon == icon &&
          other.actions == actions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (notificationId == null ? 0 : notificationId!.hashCode) +
      (app == null ? 0 : app!.hashCode) +
      (user == null ? 0 : user!.hashCode) +
      (datetime == null ? 0 : datetime!.hashCode) +
      (objectType == null ? 0 : objectType!.hashCode) +
      (objectId == null ? 0 : objectId!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (link == null ? 0 : link!.hashCode) +
      (subjectRich == null ? 0 : subjectRich!.hashCode) +
      (subjectRichParameters.hashCode) +
      (messageRich == null ? 0 : messageRich!.hashCode) +
      (messageRichParameters.hashCode) +
      (icon == null ? 0 : icon!.hashCode) +
      (actions.hashCode);

  @override
  String toString() =>
      'NotificationsNotification[notificationId=$notificationId, app=$app, user=$user, datetime=$datetime, objectType=$objectType, objectId=$objectId, subject=$subject, message=$message, link=$link, subjectRich=$subjectRich, subjectRichParameters=$subjectRichParameters, messageRich=$messageRich, messageRichParameters=$messageRichParameters, icon=$icon, actions=$actions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.notificationId != null) {
      json[r'notification_id'] = this.notificationId;
    } else {
      json[r'notification_id'] = null;
    }
    if (this.app != null) {
      json[r'app'] = this.app;
    } else {
      json[r'app'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.datetime != null) {
      json[r'datetime'] = this.datetime;
    } else {
      json[r'datetime'] = null;
    }
    if (this.objectType != null) {
      json[r'object_type'] = this.objectType;
    } else {
      json[r'object_type'] = null;
    }
    if (this.objectId != null) {
      json[r'object_id'] = this.objectId;
    } else {
      json[r'object_id'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.link != null) {
      json[r'link'] = this.link;
    } else {
      json[r'link'] = null;
    }
    if (this.subjectRich != null) {
      json[r'subjectRich'] = this.subjectRich;
    } else {
      json[r'subjectRich'] = null;
    }
    json[r'subjectRichParameters'] = this.subjectRichParameters;
    if (this.messageRich != null) {
      json[r'messageRich'] = this.messageRich;
    } else {
      json[r'messageRich'] = null;
    }
    json[r'messageRichParameters'] = this.messageRichParameters;
    if (this.icon != null) {
      json[r'icon'] = this.icon;
    } else {
      json[r'icon'] = null;
    }
    json[r'actions'] = this.actions;
    return json;
  }

  /// Returns a new [NotificationsNotification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationsNotification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotificationsNotification[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotificationsNotification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationsNotification(
        notificationId: mapValueOfType<int>(json, r'notification_id'),
        app: mapValueOfType<String>(json, r'app'),
        user: mapValueOfType<String>(json, r'user'),
        datetime: mapValueOfType<String>(json, r'datetime'),
        objectType: mapValueOfType<String>(json, r'object_type'),
        objectId: mapValueOfType<String>(json, r'object_id'),
        subject: mapValueOfType<String>(json, r'subject'),
        message: mapValueOfType<String>(json, r'message'),
        link: mapValueOfType<String>(json, r'link'),
        subjectRich: mapValueOfType<String>(json, r'subjectRich'),
        subjectRichParameters:
            json[r'subjectRichParameters'] is List ? (json[r'subjectRichParameters'] as List).cast<String>() : const [],
        messageRich: mapValueOfType<String>(json, r'messageRich'),
        messageRichParameters:
            json[r'messageRichParameters'] is List ? (json[r'messageRichParameters'] as List).cast<String>() : const [],
        icon: mapValueOfType<String>(json, r'icon'),
        actions: NotificationsNotificationAction.listFromJson(json[r'actions']) ?? const [],
      );
    }
    return null;
  }

  static List<NotificationsNotification>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationsNotification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationsNotification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationsNotification> mapFromJson(dynamic json) {
    final map = <String, NotificationsNotification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsNotification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationsNotification-objects as value to a dart map
  static Map<String, List<NotificationsNotification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationsNotification>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationsNotification.listFromJson(
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
