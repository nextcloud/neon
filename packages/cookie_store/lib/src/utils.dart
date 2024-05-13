// ignore_for_file: constant_identifier_names

import 'package:cookie_store/src/storable_cookie.dart';

const int _DOT = 0x2E;
const int _SLASH = 0x2F;

/// Computes the default cookie path for a [requestUri].
///
/// See:
///   * https://httpwg.org/specs/rfc6265.html#cookie-path
String defaultPath(Uri requestUri) {
  // Let uri-path be the path portion of the request-uri if such a portion exists (and empty otherwise).
  final path = requestUri.path;

  // If the uri-path is empty or if the first character of the uri-path is not a %x2F ("/") character, output %x2F ("/") and skip the remaining steps.
  if (path.isEmpty || path.codeUnitAt(0) != _SLASH) {
    return '/';
  }

  // If the uri-path contains no more than one %x2F ("/") character, output %x2F ("/") and skip the remaining step.
  if ('/'.allMatches(path).length <= 1) {
    return '/';
  }

  // Output the characters of the uri-path from the first character up to, but not including, the right-most %x2F ("/").
  if (path.endsWith('/')) {
    return path.substring(0, path.length - 1);
  }

  return path;
}

/// Whether the [requestHost] domain matches the [cookieDomain].
///
/// It assumes that the given hosts are already canonicalized and punycode encoded.
///
/// See:
///   * https://httpwg.org/specs/rfc6265.html#cookie-domain
bool isDomainMatch(String requestHost, String cookieDomain) {
  assert(
    requestHost.toLowerCase() == requestHost && cookieDomain.toLowerCase() == cookieDomain,
    'Both the requestHost and cookieDomain must be canonicalized to lower case.',
  );

  // The domain string and the string are identical.
  if (requestHost == cookieDomain) {
    return true;
  }

  // The domain string is a suffix of the string.
  if (requestHost.endsWith(cookieDomain)) {
    // The last character of the string that is not included in the domain string is a %x2E (".") character.
    final lastChar = requestHost.length - cookieDomain.length;

    if (requestHost.codeUnitAt(lastChar - 1) != _DOT) {
      return false;
    }

    return !_isIPAdress(requestHost);
  }

  return false;
}

/// Whether the given [host] represents a valid IPv4 or IPv6 address.
bool _isIPAdress(String host) {
  try {
    Uri.parseIPv4Address(host);
    return true;

    // ignore: empty_catches
  } on FormatException {}

  try {
    Uri.parseIPv6Address(host);
    return true;

    // ignore: empty_catches
  } on FormatException {}

  return false;
}

/// Whether the [requestPath] path matches the [cookiePath].
///
/// See:
///   * https://httpwg.org/specs/rfc6265.html#cookie-path
bool isPathMatch(String requestPath, String cookiePath) {
  // The cookie-path and the request-path are identical.
  if (requestPath == cookiePath) {
    return true;
  }

  if (requestPath.startsWith(cookiePath)) {
    // The cookie-path is a prefix of the request-path, the last character of the cookie-path is %x2F ("/").
    if (cookiePath.codeUnitAt(cookiePath.length - 1) == _SLASH) {
      return true;
    }

    // The cookie-path is a prefix of the request-path, and the first character of the request-path that is not included in the cookie-path is a %x2F ("/") character.
    return requestPath.codeUnitAt(cookiePath.length) == _SLASH;
  }

  return false;
}

/// Whether the given [uri] is using the `http` protocol.
///
/// Implementations MAY want to define a custom check.
bool isHttpUri(Uri uri) {
  return uri.isScheme('http') || uri.isScheme('https');
}

/// Whether the given [uri] is using a secure protocol.
///
/// Checks whether the request scheme ends with a `s`.
///
/// Implementations MAY want to define a custom check.
bool isSecureUri(Uri uri) {
  return uri.scheme.codeUnits.lastOrNull == 0x73;
}

/// Sorts cookies by path length and creation time.
int sortCookies(StorableCookie a, StorableCookie b) {
  if (a.path.length < b.path.length) {
    return 1;
  } else if (a.path.length > b.path.length) {
    return -1;
  } else {
    return a.creationTime.compareTo(b.creationTime);
  }
}
