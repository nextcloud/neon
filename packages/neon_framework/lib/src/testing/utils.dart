import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/src/theme/theme.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// An application used in testing that wraps it's children in a configured
/// `MaterialApp`.
class TestApp extends StatelessWidget {
  /// Creates a new TestApp to wrap a child in a `MaterialApp`.
  const TestApp({
    this.child,
    this.platform = TargetPlatform.android,
    this.localizationsDelegates,
    this.supportedLocales,
    this.appThemes,
    this.locale = const Locale('en'),
    this.wrapMaterial = true,
    this.providers = const [],
    this.router,
    super.key,
  });

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The platform to use for the apps theme.
  final TargetPlatform platform;

  /// Whether to wrap the child in a `Material` widget.
  ///
  /// Most widgets require a `Material` ancestor so the child will be wrapped
  /// in one if the [platform] is not a cupertino one.
  /// In golden tests it is encouraged to be disabled when possible to avoid
  /// changes and background colors.
  ///
  /// Defaults to `true`.
  final bool wrapMaterial;

  /// Additional [LocalizationsDelegate]s.
  ///
  /// [NeonLocalizations.localizationsDelegates] are always added.
  final List<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Additional supported [Locale]s.
  ///
  /// [NeonLocalizations.supportedLocales] are always added.
  final List<Locale>? supportedLocales;

  /// Additional [ThemeExtension]s.
  final List<ThemeExtension>? appThemes;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale locale;

  /// Additional [Provider]s.
  final List<SingleChildWidget> providers;

  /// Wraps the [child] using a GoRouter for mocking.
  final MockGoRouter? router;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.test(
      platform: platform,
      appThemes: appThemes,
    );

    var child = this.child;
    if (wrapMaterial && platform != TargetPlatform.iOS && platform != TargetPlatform.macOS) {
      child = Material(child: child);
    }

    if (router != null && child != null) {
      child = InheritedGoRouter(
        goRouter: router!,
        child: child,
      );
    }

    final app = MaterialApp(
      theme: theme.lightTheme,
      localizationsDelegates: [
        ...NeonLocalizations.localizationsDelegates,
        ...?localizationsDelegates,
      ],
      supportedLocales: [
        ...NeonLocalizations.supportedLocales,
        ...?supportedLocales,
      ],
      locale: locale,
      home: child,
    );

    if (providers.isNotEmpty) {
      return MultiProvider(
        providers: providers,
        child: app,
      );
    }

    return app;
  }
}

/// Extension for pumping widgets with automatic accessibility guideline checks.
extension TesterPumpWidgetWithAccessibility on WidgetTester {
  /// Pumps the [widget] like [pumpWidget], but performs automatic accessibility guideline checks.
  Future<void> pumpWidgetWithAccessibility(Widget widget) async {
    final handle = ensureSemantics();

    // ignore: prefer_pump_widget_with_accessibility
    await pumpWidget(widget);

    await expectLater(this, meetsGuideline(androidTapTargetGuideline));
    await expectLater(this, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(this, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(this, meetsGuideline(textContrastGuideline));

    handle.dispose();
  }
}
