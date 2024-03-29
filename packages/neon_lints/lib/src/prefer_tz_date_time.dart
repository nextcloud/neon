import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that no [DateTime] object is instantiated.
final class PreferTZDateTime extends DartLintRule {
  /// @nodoc
  const PreferTZDateTime() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_tz_date_time',
    problemMessage: "Do not use 'DateTime' as the timezone might be ambigous.",
    correctionMessage: '''
Use the 'TZDateTime' from the 'timezone' package https://pub.dev/packages/timezone.
''',
  );

  static const String _dateTime = 'DateTime';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      if (node.constructorName.type.name2.lexeme == _dateTime) {
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });

    context.registry.addConstructorReference((node) {
      if (node.constructorName.type.name2.lexeme == _dateTime) {
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });
  }
}
