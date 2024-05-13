import 'package:flutter/material.dart';
import 'package:neon_framework/src/theme/theme.dart';
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
