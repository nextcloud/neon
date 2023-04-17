import 'package:app/apps.dart';
import 'package:app/branding.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';

Future main() async {
  await runNeon(
    binding: WidgetsFlutterBinding.ensureInitialized(),
    getAppImplementations: getAppImplementations,
    branding: getNeonBranding(),
  );
}
