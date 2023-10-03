// coverage:ignore-file
import 'package:nextcloud/src/api/dashboard.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/dashboard.openapi.dart';

// ignore: public_member_api_docs
extension DashboardExtension on NextcloudClient {
  static final _dashboard = Expando<DashboardClient>();

  /// Client for the dashboard APIs
  DashboardClient get dashboard => _dashboard[this] ??= DashboardClient.fromClient(this);
}
