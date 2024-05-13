import 'package:meta/meta.dart';
import 'package:timezone/timezone.dart' as tz;

/// A storable cookie.
///
/// See:
///   * https://httpwg.org/specs/rfc6265.html#storage-model
@immutable
final class StorableCookie {
  /// Creates a new cookie in the rfc6265 storage model.
  const StorableCookie({
    required this.name,
    required this.value,
    required this.expiryTime,
    required this.domain,
    required this.path,
    required this.creationTime,
    required this.lastAccessTime,
    required this.persistentFlag,
    required this.hostOnlyFlag,
    required this.secureOnlyFlag,
    required this.httpOnlyFlag,
  });

  /// The name of the cookie.
  ///
  /// Must be a `token` as specified in RFC 6265.
  ///
  /// The allowed characters in a `token` are the visible ASCII characters,
  /// U+0021 (`!`) through U+007E (`~`), except the separator characters:
  /// `(`, `)`, `<`, `>`, `@`, `,`, `;`, `:`, `\`, `"`, `/`, `[`, `]`, `?`, `=`,
  /// `{`, and `}`.
  final String name;

  /// The value of the cookie.
  ///
  /// Must be a `cookie-value` as specified in RFC 6265.
  ///
  /// The allowed characters in a cookie value are the visible ASCII characters,
  /// U+0021 (`!`) through U+007E (`~`) except the characters:
  /// `"`, `,`, `;` and `\`.
  /// Cookie values may be wrapped in a single pair of double quotes
  /// (U+0022, `"`).
  final String value;

  /// The time at which the cookie expires.
  final tz.TZDateTime expiryTime;

  /// The domain that the cookie applies to.
  final String domain;

  /// The path within the [domain] that the cookie applies to.
  final String path;

  /// The time at which the cookie has been created.
  final tz.TZDateTime creationTime;

  /// The time at which the cookie has been last accessed.
  final tz.TZDateTime lastAccessTime;

  /// Whether the cookie is persisted between session.
  ///
  /// Will be `false` for session cookies.
  final bool persistentFlag;

  /// Whether the cookie is only sent when the request `domain` is identical
  /// to [domain].
  final bool hostOnlyFlag;

  /// Whether to only send this cookie on secure connections.
  final bool secureOnlyFlag;

  /// Whether the cookie is only sent in the HTTP request and is not made
  /// available to client side scripts.
  final bool httpOnlyFlag;

  /// Creates a copy of this storable cookie with the given fields
  /// replaced by the non-null parameter values.
  StorableCookie copyWith({
    String? value,
    tz.TZDateTime? expiryTime,
    tz.TZDateTime? creationTime,
    tz.TZDateTime? lastAccessTime,
    bool? persistentFlag,
    bool? hostOnlyFlag,
    bool? secureOnlyFlag,
    bool? httpOnlyFlag,
  }) {
    return StorableCookie(
      name: name,
      value: value ?? this.value,
      expiryTime: expiryTime ?? this.expiryTime,
      domain: domain,
      path: path,
      creationTime: creationTime ?? this.creationTime,
      lastAccessTime: lastAccessTime ?? this.lastAccessTime,
      persistentFlag: persistentFlag ?? this.persistentFlag,
      hostOnlyFlag: hostOnlyFlag ?? this.hostOnlyFlag,
      secureOnlyFlag: secureOnlyFlag ?? this.secureOnlyFlag,
      httpOnlyFlag: httpOnlyFlag ?? this.httpOnlyFlag,
    );
  }

  @override
  int get hashCode {
    return Object.hashAll([name, domain, path]);
  }

  @override
  bool operator ==(Object other) =>
      other is StorableCookie && name == other.name && domain == other.domain && path == other.path;
}
