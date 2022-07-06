//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewsListFolders {
  /// Returns a new [NewsListFolders] instance.
  NewsListFolders({
    this.folders = const [],
  });

  List<NewsFolder> folders;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewsListFolders && other.folders == folders;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (folders.hashCode);

  @override
  String toString() => 'NewsListFolders[folders=$folders]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'folders'] = folders;
    return _json;
  }

  /// Returns a new [NewsListFolders] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewsListFolders? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewsListFolders[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewsListFolders[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewsListFolders(
        folders: NewsFolder.listFromJson(json[r'folders']) ?? const [],
      );
    }
    return null;
  }

  static List<NewsListFolders>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NewsListFolders>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewsListFolders.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewsListFolders> mapFromJson(dynamic json) {
    final map = <String, NewsListFolders>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsListFolders.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewsListFolders-objects as value to a dart map
  static Map<String, List<NewsListFolders>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NewsListFolders>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewsListFolders.listFromJson(
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
