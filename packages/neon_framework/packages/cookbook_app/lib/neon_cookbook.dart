/// The Neon client for the Cookbook app.
///
/// Add `CookbookApp()` to your runNeon command to execute this app.
library;

import 'package:cookbook_app/l10n/l10n.dart';
import 'package:cookbook_app/src/neon/neon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/cookbook.dart' as cookbook;

/// Implementation of the server `cookbook` app.
final class CookbookApp extends AppImplementation<CookbookBloc, CookbookOptions> {
  /// Creates a new Cookbook app implementation instance.
  CookbookApp();

  @override
  final String id = cookbook.appID;

  @override
  final LocalizationsDelegate<CookbookLocalizations> localizationsDelegate = CookbookLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = CookbookLocalizations.supportedLocales;

  @override
  late final CookbookOptions options = CookbookOptions(storage);

  @override
  CookbookBloc buildBloc(Account account) => CookbookBloc();

  @override
  final Widget page = const Placeholder();

  @override
  final RouteBase route = $cookbookAppRoute;
}
