// coverage:ignore-file
import 'package:nextcloud/src/api/settings/settings.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/settings/settings.openapi.dart';

// ignore: public_member_api_docs
extension SettingsExtension on NextcloudClient {
  static final _settings = Expando<$Client>();

  /// Client for the settings APIs
  $Client get settings => _settings[this] ??= $Client.fromClient(this);
}
