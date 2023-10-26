import 'package:build_verify/build_verify.dart';
import 'package:test/test.dart';

void main() {
  test(
    'ensure_build',
    () async => expectBuildClean(
      packageRelativeDirectory: 'packages/dynamite/dynamite_end_to_end_test',
      customCommand: ['bash', 'generate.sh'],
    ),
    tags: 'source_verification',
  );
}
