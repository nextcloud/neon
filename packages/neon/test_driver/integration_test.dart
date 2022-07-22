import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final screenshotsDir = Directory('screenshots');
  if (screenshotsDir.existsSync()) {
    screenshotsDir.deleteSync(recursive: true);
  }
  screenshotsDir.createSync();

  try {
    await integrationDriver(
      onScreenshot: (final screenshotName, final screenshotBytes) async {
        File('screenshots/$screenshotName.png').writeAsBytesSync(screenshotBytes);
        return true;
      },
    );
  } catch (e) {
    // ignore: avoid_print
    print('Error occurred: $e');
  }
}
