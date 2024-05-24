import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that `dart:html` is not imported.
final class AvoidDartHTML extends DartLintRule {
  /// @nodoc
  const AvoidDartHTML() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_dart_html',
    problemMessage: "Do not import 'dart:html'.",
    correctionMessage: "Use 'package:web' instead.",
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addImportDirective((node) {
      if (node.uri.stringValue == 'dart:html') {
        // ignore: deprecated_member_use
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });
  }
}
