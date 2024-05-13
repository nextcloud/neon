import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that `dart:io` is not imported.
final class AvoidDartIO extends DartLintRule {
  /// @nodoc
  const AvoidDartIO() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_dart_io',
    problemMessage: "Do not import 'dart:io'.",
    correctionMessage: "Use 'package:universal_io' instead.",
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addImportDirective((node) {
      if (node.uri.stringValue == 'dart:io') {
        // ignore: deprecated_member_use
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });
  }
}
