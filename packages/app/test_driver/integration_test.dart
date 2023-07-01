import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  Directory('screenshots').createSync();
  try {
    await integrationDriver(
      onScreenshot: (final screenshotName, final screenshotBytes, [final args]) async {
        final file = File('screenshots/$screenshotName.png');
        if (!file.existsSync()) {
          file.writeAsBytesSync(screenshotBytes);
        }
        return true;
      },
    );
  } catch (e) {
    debugPrint('Error occurred: $e');
  }
}
