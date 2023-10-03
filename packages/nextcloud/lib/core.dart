// coverage:ignore-file
import 'package:nextcloud/src/api/core.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/core.openapi.dart';
export 'src/helpers/core.dart';

// ignore: public_member_api_docs
extension CoreExtension on NextcloudClient {
  static final _core = Expando<CoreClient>();

  /// Client for the core APIs
  CoreClient get core => _core[this] ??= CoreClient.fromClient(this);
}
