import 'package:app/apps.dart';
import 'package:app/branding.dart';
import 'package:neon/neon.dart';

Future<void> main() async {
  await runNeon(
    appImplementations: appImplementations,
    theme: neonTheme,
  );
}
