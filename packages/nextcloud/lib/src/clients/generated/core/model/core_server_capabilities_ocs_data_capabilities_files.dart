//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CoreServerCapabilitiesOcsDataCapabilitiesFiles {
  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFiles] instance.
  CoreServerCapabilitiesOcsDataCapabilitiesFiles({
    this.bigfilechunking,
    this.blacklistedFiles = const [],
    this.directEditing,
    this.comments,
    this.undelete,
    this.versioning,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? bigfilechunking;

  List<String> blacklistedFiles;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing? directEditing;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? comments;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? undelete;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? versioning;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreServerCapabilitiesOcsDataCapabilitiesFiles &&
          other.bigfilechunking == bigfilechunking &&
          other.blacklistedFiles == blacklistedFiles &&
          other.directEditing == directEditing &&
          other.comments == comments &&
          other.undelete == undelete &&
          other.versioning == versioning;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (bigfilechunking == null ? 0 : bigfilechunking!.hashCode) +
      (blacklistedFiles.hashCode) +
      (directEditing == null ? 0 : directEditing!.hashCode) +
      (comments == null ? 0 : comments!.hashCode) +
      (undelete == null ? 0 : undelete!.hashCode) +
      (versioning == null ? 0 : versioning!.hashCode);

  @override
  String toString() =>
      'CoreServerCapabilitiesOcsDataCapabilitiesFiles[bigfilechunking=$bigfilechunking, blacklistedFiles=$blacklistedFiles, directEditing=$directEditing, comments=$comments, undelete=$undelete, versioning=$versioning]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (bigfilechunking != null) {
      _json[r'bigfilechunking'] = bigfilechunking;
    } else {
      _json[r'bigfilechunking'] = null;
    }
    _json[r'blacklisted_files'] = blacklistedFiles;
    if (directEditing != null) {
      _json[r'directEditing'] = directEditing;
    } else {
      _json[r'directEditing'] = null;
    }
    if (comments != null) {
      _json[r'comments'] = comments;
    } else {
      _json[r'comments'] = null;
    }
    if (undelete != null) {
      _json[r'undelete'] = undelete;
    } else {
      _json[r'undelete'] = null;
    }
    if (versioning != null) {
      _json[r'versioning'] = versioning;
    } else {
      _json[r'versioning'] = null;
    }
    return _json;
  }

  /// Returns a new [CoreServerCapabilitiesOcsDataCapabilitiesFiles] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CoreServerCapabilitiesOcsDataCapabilitiesFiles? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFiles[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CoreServerCapabilitiesOcsDataCapabilitiesFiles[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CoreServerCapabilitiesOcsDataCapabilitiesFiles(
        bigfilechunking: mapValueOfType<bool>(json, r'bigfilechunking'),
        blacklistedFiles:
            json[r'blacklisted_files'] is List ? (json[r'blacklisted_files'] as List).cast<String>() : const [],
        directEditing: CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing.fromJson(json[r'directEditing']),
        comments: mapValueOfType<bool>(json, r'comments'),
        undelete: mapValueOfType<bool>(json, r'undelete'),
        versioning: mapValueOfType<bool>(json, r'versioning'),
      );
    }
    return null;
  }

  static List<CoreServerCapabilitiesOcsDataCapabilitiesFiles>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CoreServerCapabilitiesOcsDataCapabilitiesFiles>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFiles.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CoreServerCapabilitiesOcsDataCapabilitiesFiles> mapFromJson(dynamic json) {
    final map = <String, CoreServerCapabilitiesOcsDataCapabilitiesFiles>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFiles.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CoreServerCapabilitiesOcsDataCapabilitiesFiles-objects as value to a dart map
  static Map<String, List<CoreServerCapabilitiesOcsDataCapabilitiesFiles>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CoreServerCapabilitiesOcsDataCapabilitiesFiles>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CoreServerCapabilitiesOcsDataCapabilitiesFiles.listFromJson(
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
