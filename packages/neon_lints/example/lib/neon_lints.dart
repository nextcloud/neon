// ignore_for_file: unused_import, unused_local_variable

// expect_lint: avoid_dart_html
import 'dart:html';
// expect_lint: avoid_dart_io
import 'dart:io';

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

  // expect_lint: prefer_tz_date_time
  var date = DateTime(0);

  // expect_lint: prefer_tz_date_time
  date = DateTime.now();

  // expect_lint: prefer_tz_date_time
  var dates = List.generate(5, DateTime.utc);
}
