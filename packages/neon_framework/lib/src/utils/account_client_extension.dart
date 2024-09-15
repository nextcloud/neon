import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';

/// Extension to complete [Uri]s against the home server.
extension AccountClientExtension on Account {
  /// Completes an incomplete [Uri] using the `serverURL`.
  ///
  /// Some Nextcloud APIs return [Uri]s to resources on the server (e.g. an image) but only give an absolute path.
  /// Those [Uri]s need to be completed using the `serverURL` to have a working [Uri].
  ///
  /// The paths of the `serverURL` and the [uri] need to be join to get the full path, unless the [uri] path is already an absolute path.
  /// In that case an instance hosted at a sub folder will already contain the sub folder part in the [uri].
  @internal
  Uri completeUri(Uri uri) {
    final result = credentials.serverURL.resolveUri(uri);
    if (!uri.hasAbsolutePath) {
      return result.replace(path: '${credentials.serverURL.path}/${uri.path}');
    }
    return result;
  }

  /// Get the necessary `Authorization` headers for a given [uri].
  ///
  /// This method ensures no credentials are sent to the wrong server.
  Map<String, String>? getAuthorizationHeaders(Uri uri) {
    if (uri.toString().startsWith(credentials.serverURL.toString())) {
      return client.authentications?.firstOrNull?.headers;
    }

    return null;
  }
}
