import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
    'ensure_build',
    () async => expectBuildClean(
      packageRelativeDirectory: 'packages/nextcloud',
      customCommand: ['bash', 'generate.sh'],
    ),
    tags: 'source_verification',
  );
}
