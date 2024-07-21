/// Depth used for `propfind` requests.
///
/// See http://www.webdav.org/specs/rfc2518.html#HEADER_Depth for more information.
enum WebDavDepth {
  /// Returns props of the resource.
  zero('0'),

  /// Returns props of the resource and its immediate children.
  ///
  /// Only works on collections and returns the same as [WebDavDepth.zero] for other resources.
  one('1'),

  /// Returns props of the resource and all its progeny.
  ///
  /// Only works on collections and returns the same as [WebDavDepth.zero] for other resources.
  infinity('infinity');

  const WebDavDepth(this.value);

  // ignore: public_member_api_docs
  final String value;
}
