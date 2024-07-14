/// The Neon client for the Cookbook app.
///
/// Add `CookbookApp()` to your runNeon command to execute this app.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_cookbook/l10n/l10n.dart';
import 'package:neon_cookbook/src/neon/neon.dart';
import 'package:neon_framework/models.dart';

import 'package:nextcloud/nextcloud.dart';

/// Implementation of the server `cookbook` app.
final class CookbookApp extends AppImplementation<CookbookBloc, CookbookOptions> {
  /// Creates a new Cookbook app implementation instance.
  CookbookApp();

  @override
  final String id = AppIDs.cookbook;

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
