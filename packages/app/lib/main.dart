import 'package:app/apps.dart';
import 'package:app/branding.dart';
import 'package:neon/neon.dart';

Future main() async {
  await runNeon(
    getAppImplementations: getAppImplementations,
    branding: getNeonBranding(),
  );
}
