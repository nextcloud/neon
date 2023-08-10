import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';

late String? _userAgent;

void buildUserAgent(final PackageInfo packageInfo) {
  var buildNumber = packageInfo.buildNumber;
  if (buildNumber.isEmpty) {
    buildNumber = '1';
  }
  _userAgent = 'Neon ${packageInfo.version}+$buildNumber';
}

@internal
String get neonUserAgent => _userAgent!;
