import 'package:neon_framework/settings.dart';

/// Settings options specific to the talk app.
class TalkOptions extends AppImplementationOptions {
  /// Creates a new talk options instance.
  TalkOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
