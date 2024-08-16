import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule checking that package:nextcloud imports are prefixed.
final class PreferPrefixedNextcloudImport extends DartLintRule {
  /// @nodoc
  const PreferPrefixedNextcloudImport() : super(code: _code);

  static const _code = LintCode(
    name: 'prefer_prefixed_nextcloud_import',
    problemMessage: 'Do not import from package:nextcloud without a prefix.',
    correctionMessage: '''
Use `import 'package:nextcloud/<id>.dart' as <id>;` instead.
''',
  );

  static final _regex = RegExp(r'^package:nextcloud/(.*)\.dart$');

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addImportDirective((node) {
      final match = _regex.firstMatch(node.uri.stringValue ?? '');
      if (match == null) {
        return;
      }

      final id = match.group(1)!;
      if (id == 'nextcloud' || id == 'utils') {
        return;
      }

      if (node.prefix != null && (node.prefix!.name == id || node.prefix!.name == '\$$id')) {
        return;
      }

      // ignore: deprecated_member_use
      reporter.reportErrorForToken(code, node.beginToken);
    });
  }
}
