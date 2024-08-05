import 'package:example/apps.dart';
import 'package:example/branding.dart';
import 'package:neon_framework/neon.dart';

Future<void> main() async {
  await runNeon(
    appImplementations: appImplementations,
    theme: neonTheme,
  );
}
