import 'package:neon/src/utils/user_agent.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:test/test.dart';

void main() {
  test('UserAgent', () {
    final packageInfo = PackageInfo(
      appName: 'appName',
      packageName: 'packageName',
      version: 'version',
      buildNumber: 'buildNumber',
    );
    buildUserAgent(packageInfo);

    expect(neonUserAgent, 'Neon version+buildNumber');
  });
}
