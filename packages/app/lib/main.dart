import 'package:app/apps.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';

Future main() async {
  await runNeon(
    getAppImplementations: getAppImplementations,
    binding: WidgetsFlutterBinding.ensureInitialized(),
  );
}
