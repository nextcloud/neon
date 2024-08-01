import 'package:nextcloud/src/api/user_ldap/user_ldap.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/user_ldap/user_ldap.openapi.dart';

/// ID for the user_ldap app.
const String appID = 'user_ldap';

/// Client for the user_ldap APIs.
extension UserLdapExtension on NextcloudClient {
  static final _userLdap = Expando<$Client>();

  /// Client for the user_ldap APIs.
  $Client get userLdap => _userLdap[this] ??= $Client.fromClient(this);
}
