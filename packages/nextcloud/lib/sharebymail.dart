// coverage:ignore-file
import 'package:nextcloud/src/api/sharebymail.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/sharebymail.openapi.dart';

// ignore: public_member_api_docs
extension SharebymailExtension on NextcloudClient {
  static final _sharebymail = Expando<Client>();

  /// Client for the sharebymail APIs
  Client get sharebymail => _sharebymail[this] ??= Client.fromClient(this);
}
