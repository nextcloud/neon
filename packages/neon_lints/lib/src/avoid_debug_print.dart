import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that no print methods from `flutter:framework` are used.
///
/// Similar to the analyzer rule `avoid_print`.
/// Use `https://pub.dev/packages/logging` instead.
///
/// ```dart
///   debugPrint('message'); // lint
///   debugPrintStack(stackTrace: stackTrace); // lint
///   debugPrintSynchronously('message'); // lint
///   debugPrintThrottled('message'); // lint
/// ```
///
/// Refer to `https://stackoverflow.com/questions/2031163/when-to-use-the-different-log-levels/64806781#64806781`
/// if unsure about the logging level to use.
final class AvoidDebugPrint extends DartLintRule {
  /// @nodoc
  const AvoidDebugPrint() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_debug_print',
    problemMessage: "Do not invoke 'debugPrint' and 'debugPrintStack' in production code.",
    correctionMessage: '''
Use 'package:logging' instead.
Refer to https://stackoverflow.com/questions/2031163/when-to-use-the-different-log-levels/64806781#64806781
if unsure about the logging level to use.
''',
  );

  static const String _debugPrint = 'debugPrint';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInvocationExpression((node) {
      final element = node.function;
      if (element case Identifier(:final name) when name.startsWith(_debugPrint)) {
        // ignore: deprecated_member_use
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });
  }
}
