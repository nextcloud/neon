import 'package:neon/src/utils/storage.dart';
import 'package:settings/settings.dart';

abstract class NextcloudAppSpecificOptions {
  NextcloudAppSpecificOptions(this.storage);

  final AppStorage storage;
  late final List<OptionsCategory> categories;
  late final List<Option> options;

  Future reset() async {
    for (final option in options) {
      await option.reset();
    }
  }

  void dispose() {
    for (final option in options) {
      option.dispose();
    }
  }
}
