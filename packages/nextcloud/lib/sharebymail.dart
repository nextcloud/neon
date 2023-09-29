import 'package:nextcloud/src/api/sharebymail.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/sharebymail.openapi.dart';

// ignore: public_member_api_docs
extension SharebymailExtension on NextcloudClient {
  static final _sharebymail = Expando<SharebymailClient>();

  /// Client for the sharebymail APIs
  SharebymailClient get sharebymail => _sharebymail[this] ??= SharebymailClient.fromClient(this);
}
