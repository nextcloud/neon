import 'package:nextcloud/src/api/settings/settings.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/settings/settings.openapi.dart';

/// Client for the settings APIs.
extension SettingsExtension on NextcloudClient {
  static final _settings = Expando<$Client>();

  /// Client for the settings APIs.
  $Client get settings => _settings[this] ??= $Client.fromClient(this);
}
