import 'package:neon_framework/settings.dart';

/// Settings options specific to the dashboard app.
class DashboardAppSpecificOptions extends NextcloudAppOptions {
  /// Creates a new dashboard options instance.
  DashboardAppSpecificOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
