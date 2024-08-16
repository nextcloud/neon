import 'package:neon_framework/models.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

/// Completes the [url] using the [account] if necessary and launches it in an external application.
Future<bool> launchUrl(Account account, String url) async {
  return url_launcher.launchUrl(
    account.completeUri(Uri.parse(url)),
    mode: url_launcher.LaunchMode.externalApplication,
  );
}
