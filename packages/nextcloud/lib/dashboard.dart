// coverage:ignore-file
import 'package:nextcloud/src/api/dashboard/dashboard.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/dashboard/dashboard.openapi.dart';

// ignore: public_member_api_docs
extension DashboardExtension on NextcloudClient {
  static final _dashboard = Expando<$Client>();

  /// Client for the dashboard APIs
  $Client get dashboard => _dashboard[this] ??= $Client.fromClient(this);
}
