import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/utils/user_agent.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  test('UserAgent', () {
    final packageInfo = PackageInfo(
      appName: 'appName',
      packageName: 'packageName',
      version: 'version',
      buildNumber: 'buildNumber',
    );

    expect(
      buildUserAgent(packageInfo),
      'Neon version+buildNumber',
    );

    expect(
      buildUserAgent(packageInfo, 'Nextcloud Neon'),
      'Neon version+buildNumber',
    );

    expect(
      buildUserAgent(packageInfo, 'Cookbook'),
      'Neon (Cookbook) version+buildNumber',
    );
  });
}
