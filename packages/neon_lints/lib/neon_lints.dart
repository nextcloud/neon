import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:neon_lints/src/avoid_dart_html.dart';
import 'package:neon_lints/src/avoid_dart_io.dart';
import 'package:neon_lints/src/avoid_debug_print.dart';
import 'package:neon_lints/src/avoid_exports.dart';
import 'package:neon_lints/src/prefer_pump_widget_with_accessibility.dart';

/// Registers the neon lints plugin.
///
/// Do **not** use this directly.
/// This method is used when enabling the `custom_lint` in the
/// `analysis_options.yaml` file.
PluginBase createPlugin() => _NeonLintsPlugin();

class _NeonLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs _) => const [
        AvoidDebugPrint(),
        AvoidDartHTML(),
        AvoidDartIO(),
        AvoidExports(),
        PreferPumpWidgetWithAccessibility(),
      ];
}
