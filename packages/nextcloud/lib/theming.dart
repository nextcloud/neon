import 'package:nextcloud/src/api/theming/theming.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/theming/theming.openapi.dart';

/// Client for the theming APIs.
extension ThemingExtension on NextcloudClient {
  static final _theming = Expando<$Client>();

  /// Client for the theming APIs.
  $Client get theming => _theming[this] ??= $Client.fromClient(this);
}
