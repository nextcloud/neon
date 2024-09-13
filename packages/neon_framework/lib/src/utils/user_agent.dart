import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Builds the user agent for this neon application.
///
/// If the [appName] is `'Nextcloud Neon'` it will be omitted.
@internal
String buildUserAgent(PackageInfo packageInfo, [String? appName]) {
  final buffer = StringBuffer('Neon ');
  if (appName != null && appName != 'Nextcloud Neon') {
    buffer.write('($appName) ');
  }

  var buildNumber = packageInfo.buildNumber;
  if (buildNumber.isEmpty) {
    buildNumber = '1';
  }
  buffer.write('${packageInfo.version}+$buildNumber');
  return buffer.toString();
}
