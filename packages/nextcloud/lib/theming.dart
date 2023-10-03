// coverage:ignore-file
import 'package:nextcloud/src/api/theming.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/theming.openapi.dart';

// ignore: public_member_api_docs
extension ThemingExtension on NextcloudClient {
  static final _theming = Expando<ThemingClient>();

  /// Client for the theming APIs
  ThemingClient get theming => _theming[this] ??= ThemingClient.fromClient(this);
}
