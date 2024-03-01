import 'package:flutter/widgets.dart';

// Apparently custom_lint can not be run in the defining package. So lint tests
// must be added here. Adding the `expect_lint: lint_name` comment suppresses
// the lint but fires an __Error__ if the commented expression does not trigger
// the referenced lint.

void main() {
  // expect_lint: avoid_debug_print
  debugPrint('');

  // expect_lint: avoid_debug_print
  debugPrintStack();
}
