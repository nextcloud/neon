//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewsMarkAsRead {
  /// Returns a new [NewsMarkAsRead] instance.
  NewsMarkAsRead({
    this.newestItemId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? newestItemId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NewsMarkAsRead && other.newestItemId == newestItemId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (newestItemId == null ? 0 : newestItemId!.hashCode);

  @override
  String toString() => 'NewsMarkAsRead[newestItemId=$newestItemId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (newestItemId != null) {
      _json[r'newestItemId'] = newestItemId;
    } else {
      _json[r'newestItemId'] = null;
    }
    return _json;
  }

  /// Returns a new [NewsMarkAsRead] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewsMarkAsRead? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewsMarkAsRead[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewsMarkAsRead[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewsMarkAsRead(
        newestItemId: mapValueOfType<int>(json, r'newestItemId'),
      );
    }
    return null;
  }

  static List<NewsMarkAsRead>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NewsMarkAsRead>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewsMarkAsRead.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewsMarkAsRead> mapFromJson(dynamic json) {
    final map = <String, NewsMarkAsRead>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsMarkAsRead.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewsMarkAsRead-objects as value to a dart map
  static Map<String, List<NewsMarkAsRead>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NewsMarkAsRead>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsMarkAsRead.listFromJson(
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
