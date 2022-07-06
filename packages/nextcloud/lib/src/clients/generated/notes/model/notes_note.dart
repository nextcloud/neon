//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotesNote {
  /// Returns a new [NotesNote] instance.
  NotesNote({
    this.id,
    this.etag,
    this.readonly,
    this.content,
    this.title,
    this.category,
    this.favorite,
    this.modified,
    this.error,
    this.errorType,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? etag;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readonly;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? category;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? favorite;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? modified;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? errorType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesNote &&
          other.id == id &&
          other.etag == etag &&
          other.readonly == readonly &&
          other.content == content &&
          other.title == title &&
          other.category == category &&
          other.favorite == favorite &&
          other.modified == modified &&
          other.error == error &&
          other.errorType == errorType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (etag == null ? 0 : etag!.hashCode) +
      (readonly == null ? 0 : readonly!.hashCode) +
      (content == null ? 0 : content!.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (category == null ? 0 : category!.hashCode) +
      (favorite == null ? 0 : favorite!.hashCode) +
      (modified == null ? 0 : modified!.hashCode) +
      (error == null ? 0 : error!.hashCode) +
      (errorType == null ? 0 : errorType!.hashCode);

  @override
  String toString() =>
      'NotesNote[id=$id, etag=$etag, readonly=$readonly, content=$content, title=$title, category=$category, favorite=$favorite, modified=$modified, error=$error, errorType=$errorType]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (id != null) {
      _json[r'id'] = id;
    }
    if (etag != null) {
      _json[r'etag'] = etag;
    }
    if (readonly != null) {
      _json[r'readonly'] = readonly;
    }
    if (content != null) {
      _json[r'content'] = content;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (category != null) {
      _json[r'category'] = category;
    }
    if (favorite != null) {
      _json[r'favorite'] = favorite;
    }
    if (modified != null) {
      _json[r'modified'] = modified;
    }
    if (error != null) {
      _json[r'error'] = error;
    }
    if (errorType != null) {
      _json[r'errorType'] = errorType;
    }
    return _json;
  }

  /// Returns a new [NotesNote] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotesNote? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotesNote[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotesNote[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotesNote(
        id: mapValueOfType<int>(json, r'id'),
        etag: mapValueOfType<String>(json, r'etag'),
        readonly: mapValueOfType<bool>(json, r'readonly'),
        content: mapValueOfType<String>(json, r'content'),
        title: mapValueOfType<String>(json, r'title'),
        category: mapValueOfType<String>(json, r'category'),
        favorite: mapValueOfType<bool>(json, r'favorite'),
        modified: mapValueOfType<int>(json, r'modified'),
        error: mapValueOfType<bool>(json, r'error'),
        errorType: mapValueOfType<String>(json, r'errorType'),
      );
    }
    return null;
  }

  static List<NotesNote>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotesNote>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotesNote.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotesNote> mapFromJson(dynamic json) {
    final map = <String, NotesNote>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotesNote.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotesNote-objects as value to a dart map
  static Map<String, List<NotesNote>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotesNote>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotesNote.listFromJson(
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
