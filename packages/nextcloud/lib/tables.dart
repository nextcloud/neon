import 'package:nextcloud/src/api/tables/tables.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/tables/tables.openapi.dart';
export 'package:nextcloud/src/api/tables/tables_helpers.dart';

/// Client for the tables APIs.
extension TablesExtension on NextcloudClient {
  static final _tables = Expando<$Client>();

  /// Client for the tables APIs.
  $Client get tables => _tables[this] ??= $Client.fromClient(this);
}
