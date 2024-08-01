import 'package:nextcloud/src/api/dashboard/dashboard.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/dashboard/dashboard.openapi.dart';

/// ID for the dashboard app.
const String appID = 'dashboard';

/// Client for the dashboard APIs.
extension DashboardExtension on NextcloudClient {
  static final _dashboard = Expando<$Client>();

  /// Client for the dashboard APIs.
  $Client get dashboard => _dashboard[this] ??= $Client.fromClient(this);
}
