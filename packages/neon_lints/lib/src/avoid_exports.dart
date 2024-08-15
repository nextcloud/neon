import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that neon clients do not export any libraries.
///
/// A neon client __SHOULD__ only have the 'AppImplementation' as a public API.
final class AvoidExports extends DartLintRule {
  /// @nodoc
  const AvoidExports() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_exports',
    problemMessage: 'Do not export libraries from this package.',
    correctionMessage: '''
Neon clients should not have any public api other than the 'AppImplementation'.
'@internal' anotations are not needed.
''',
  );

  static const String _internal = 'internal';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addAnnotation((node) {
      if (node.name case Identifier(name: _internal)) {
        // ignore: deprecated_member_use
        reporter.reportErrorForToken(code, node.beginToken);
      }
    });

    context.registry.addExportDirective((node) {
      // ignore: deprecated_member_use
      reporter.reportErrorForToken(code, node.beginToken);
    });
  }
}
