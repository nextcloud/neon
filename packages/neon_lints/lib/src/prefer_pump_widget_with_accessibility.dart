import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that `pumpWidgetWithAccessibility` is used instead of `pumpWidget`.
final class PreferPumpWidgetWithAccessibility extends DartLintRule {
  /// @nodoc
  const PreferPumpWidgetWithAccessibility() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_pump_widget_with_accessibility',
    problemMessage: 'Do not use pumpWidget.',
    correctionMessage: '''
Use 'pumpWidgetWithAccessibility' instead to perform automatic accessibility guideline checks.
''',
  );

  static const String _pumpWidget = 'pumpWidget';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInvocationExpression((node) {
      if (node.function.toSource() == _pumpWidget) {
        // ignore: deprecated_member_use
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });
  }
}
