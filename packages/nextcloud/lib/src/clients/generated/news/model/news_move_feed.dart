//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewsMoveFeed {
  /// Returns a new [NewsMoveFeed] instance.
  NewsMoveFeed({
    this.folderId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? folderId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewsMoveFeed && other.folderId == folderId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (folderId == null ? 0 : folderId!.hashCode);

  @override
  String toString() => 'NewsMoveFeed[folderId=$folderId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (folderId != null) {
      _json[r'folderId'] = folderId;
    } else {
      _json[r'folderId'] = null;
    }
    return _json;
  }

  /// Returns a new [NewsMoveFeed] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewsMoveFeed? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewsMoveFeed[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewsMoveFeed[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewsMoveFeed(
        folderId: mapValueOfType<int>(json, r'folderId'),
      );
    }
    return null;
  }

  static List<NewsMoveFeed>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NewsMoveFeed>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewsMoveFeed.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewsMoveFeed> mapFromJson(dynamic json) {
    final map = <String, NewsMoveFeed>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsMoveFeed.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewsMoveFeed-objects as value to a dart map
  static Map<String, List<NewsMoveFeed>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NewsMoveFeed>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsMoveFeed.listFromJson(
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
