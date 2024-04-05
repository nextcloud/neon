// coverage:ignore-file
import 'package:nextcloud/src/api/user_ldap.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/user_ldap.openapi.dart';

// ignore: public_member_api_docs
extension UserLdapExtension on NextcloudClient {
  static final _userLdap = Expando<$Client>();

  /// Client for the user_ldap APIs
  $Client get userLdap => _userLdap[this] ??= $Client.fromClient(this);
}
