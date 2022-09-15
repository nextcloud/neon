//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotesSettings {
  /// Returns a new [NotesSettings] instance.
  NotesSettings({
    this.notesPath,
    this.fileSuffix,
    this.noteMode,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notesPath;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fileSuffix;

  NotesSettingsNoteModeEnum? noteMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesSettings &&
          other.notesPath == notesPath &&
          other.fileSuffix == fileSuffix &&
          other.noteMode == noteMode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (notesPath == null ? 0 : notesPath!.hashCode) +
      (fileSuffix == null ? 0 : fileSuffix!.hashCode) +
      (noteMode == null ? 0 : noteMode!.hashCode);

  @override
  String toString() => 'NotesSettings[notesPath=$notesPath, fileSuffix=$fileSuffix, noteMode=$noteMode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.notesPath != null) {
      json[r'notesPath'] = this.notesPath;
    } else {
      json[r'notesPath'] = null;
    }
    if (this.fileSuffix != null) {
      json[r'fileSuffix'] = this.fileSuffix;
    } else {
      json[r'fileSuffix'] = null;
    }
    if (this.noteMode != null) {
      json[r'noteMode'] = this.noteMode;
    } else {
      json[r'noteMode'] = null;
    }
    return json;
  }

  /// Returns a new [NotesSettings] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotesSettings? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotesSettings[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotesSettings[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotesSettings(
        notesPath: mapValueOfType<String>(json, r'notesPath'),
        fileSuffix: mapValueOfType<String>(json, r'fileSuffix'),
        noteMode: NotesSettingsNoteModeEnum.fromJson(json[r'noteMode']),
      );
    }
    return null;
  }

  static List<NotesSettings>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotesSettings>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotesSettings.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotesSettings> mapFromJson(dynamic json) {
    final map = <String, NotesSettings>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotesSettings.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotesSettings-objects as value to a dart map
  static Map<String, List<NotesSettings>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotesSettings>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotesSettings.listFromJson(
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

class NotesSettingsNoteModeEnum {
  /// Instantiate a new enum with the provided [value].
  const NotesSettingsNoteModeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const edit = NotesSettingsNoteModeEnum._(r'edit');
  static const preview = NotesSettingsNoteModeEnum._(r'preview');

  /// List of all possible values in this [enum][NotesSettingsNoteModeEnum].
  static const values = <NotesSettingsNoteModeEnum>[
    edit,
    preview,
  ];

  static NotesSettingsNoteModeEnum? fromJson(dynamic value) => NotesSettingsNoteModeEnumTypeTransformer().decode(value);

  static List<NotesSettingsNoteModeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotesSettingsNoteModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotesSettingsNoteModeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [NotesSettingsNoteModeEnum] to String,
/// and [decode] dynamic data back to [NotesSettingsNoteModeEnum].
class NotesSettingsNoteModeEnumTypeTransformer {
  factory NotesSettingsNoteModeEnumTypeTransformer() =>
      _instance ??= const NotesSettingsNoteModeEnumTypeTransformer._();

  const NotesSettingsNoteModeEnumTypeTransformer._();

  String encode(NotesSettingsNoteModeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a NotesSettingsNoteModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  NotesSettingsNoteModeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'edit':
          return NotesSettingsNoteModeEnum.edit;
        case r'preview':
          return NotesSettingsNoteModeEnum.preview;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [NotesSettingsNoteModeEnumTypeTransformer] instance.
  static NotesSettingsNoteModeEnumTypeTransformer? _instance;
}
