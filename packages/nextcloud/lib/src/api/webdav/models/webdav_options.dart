/// WebDAV capabilities.
class WebDavOptions {
  /// Creates a new WebDavStatus.
  WebDavOptions(
    Set<String>? capabilities,
    Set<String>? searchCapabilities,
  )   : capabilities = capabilities ?? {},
        searchCapabilities = searchCapabilities ?? {};

  /// DAV capabilities as advertised by the server in the 'dav' header.
  Set<String> capabilities;

  /// DAV search and locating capabilities as advertised by the server in the 'dasl' header.
  Set<String> searchCapabilities;
}
