import 'package:neon/settings.dart';

/// Settings options specific to the dashboard client.
class DashboardClientSpecificOptions extends NextcloudClientOptions {
  /// Creates a new dashboard options instance.
  DashboardClientSpecificOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
