//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Notification {
  /// Returns a new [Notification] instance.
  Notification({
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

  List<String> actions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notification &&
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
      'Notification[notificationId=$notificationId, app=$app, user=$user, datetime=$datetime, objectType=$objectType, objectId=$objectId, subject=$subject, message=$message, link=$link, subjectRich=$subjectRich, subjectRichParameters=$subjectRichParameters, messageRich=$messageRich, messageRichParameters=$messageRichParameters, icon=$icon, actions=$actions]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (notificationId != null) {
      _json[r'notification_id'] = notificationId;
    }
    if (app != null) {
      _json[r'app'] = app;
    }
    if (user != null) {
      _json[r'user'] = user;
    }
    if (datetime != null) {
      _json[r'datetime'] = datetime;
    }
    if (objectType != null) {
      _json[r'object_type'] = objectType;
    }
    if (objectId != null) {
      _json[r'object_id'] = objectId;
    }
    if (subject != null) {
      _json[r'subject'] = subject;
    }
    if (message != null) {
      _json[r'message'] = message;
    }
    if (link != null) {
      _json[r'link'] = link;
    }
    if (subjectRich != null) {
      _json[r'subjectRich'] = subjectRich;
    }
    _json[r'subjectRichParameters'] = subjectRichParameters;
    if (messageRich != null) {
      _json[r'messageRich'] = messageRich;
    }
    _json[r'messageRichParameters'] = messageRichParameters;
    if (icon != null) {
      _json[r'icon'] = icon;
    }
    _json[r'actions'] = actions;
    return _json;
  }

  /// Returns a new [Notification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Notification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Notification[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Notification[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Notification(
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
        actions: json[r'actions'] is List ? (json[r'actions'] as List).cast<String>() : const [],
      );
    }
    return null;
  }

  static List<Notification>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Notification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Notification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Notification> mapFromJson(dynamic json) {
    final map = <String, Notification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Notification-objects as value to a dart map
  static Map<String, List<Notification>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Notification>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notification.listFromJson(
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
