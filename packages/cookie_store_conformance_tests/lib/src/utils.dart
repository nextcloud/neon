import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

/// Converts the given cookies to strings containing only the [Cookie.name] and
/// `Cookie.vale` and sorts the resulting list.
@internal
List<String> toSortedStringList(List<Cookie> cookies) {
  return toStringList(cookies)..sort();
}

/// Converts the given cookies to strings containing only the [Cookie.name] and
/// `Cookie.vale`.
@internal
List<String> toStringList(List<Cookie> cookies) {
  return cookies.map((cookie) => '${cookie.name}=${cookie.value}').toList();
}

/// Cookie that sets the [secure] and [httpOnly] flag to false by default.
@internal
class TestCookie implements Cookie {
  TestCookie(this.name, this.value);

  @override
  String name;

  @override
  String value;

  @override
  String? domain;

  @override
  DateTime? expires;

  @override
  bool httpOnly = false;

  @override
  int? maxAge;

  @override
  String? path;

  @override
  SameSite? sameSite;

  @override
  bool secure = false;
}
