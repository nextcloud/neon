import 'package:neon_framework/settings.dart';

/// Settings options specific to the cookbook app.
class CookbookOptions extends AppImplementationOptions {
  /// Creates a new cookbook options instance.
  CookbookOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
