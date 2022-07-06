//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserStatusTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const UserStatusTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const online = UserStatusTypeEnum._(r'online');
  static const offline = UserStatusTypeEnum._(r'offline');
  static const dnd = UserStatusTypeEnum._(r'dnd');
  static const away = UserStatusTypeEnum._(r'away');
  static const invisible = UserStatusTypeEnum._(r'invisible');

  /// List of all possible values in this [enum][UserStatusTypeEnum].
  static const values = <UserStatusTypeEnum>[
    online,
    offline,
    dnd,
    away,
    invisible,
  ];

  static UserStatusTypeEnum? fromJson(dynamic value) => UserStatusTypeEnumTypeTransformer().decode(value);

  static List<UserStatusTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserStatusTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserStatusTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserStatusTypeEnum] to String,
/// and [decode] dynamic data back to [UserStatusTypeEnum].
class UserStatusTypeEnumTypeTransformer {
  factory UserStatusTypeEnumTypeTransformer() => _instance ??= const UserStatusTypeEnumTypeTransformer._();

  const UserStatusTypeEnumTypeTransformer._();

  String encode(UserStatusTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserStatusTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserStatusTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'online':
          return UserStatusTypeEnum.online;
        case r'offline':
          return UserStatusTypeEnum.offline;
        case r'dnd':
          return UserStatusTypeEnum.dnd;
        case r'away':
          return UserStatusTypeEnum.away;
        case r'invisible':
          return UserStatusTypeEnum.invisible;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserStatusTypeEnumTypeTransformer] instance.
  static UserStatusTypeEnumTypeTransformer? _instance;
}
