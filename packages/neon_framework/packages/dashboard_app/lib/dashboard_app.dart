/// The Neon client for the Dashboard app.
///
/// Add `DashboardApp()` to your runNeon command to execute this app.
library;

import 'package:dashboard_app/l10n/localizations.dart';
import 'package:dashboard_app/src/blocs/dashboard.dart';
import 'package:dashboard_app/src/options.dart';
import 'package:dashboard_app/src/pages/main.dart';
import 'package:dashboard_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;

/// Implementation of the server `dashboard` app.
class DashboardApp extends AppImplementation<DashboardBloc, DashboardOptions> {
  /// Creates a new Dashboard app implementation instance.
  DashboardApp();

  @override
  final String id = dashboard.appID;

  @override
  final LocalizationsDelegate<DashboardLocalizations> localizationsDelegate = DashboardLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = DashboardLocalizations.supportedLocales;

  @override
  late final DashboardOptions options = DashboardOptions(storage);

  @override
  DashboardBloc buildBloc(Account account) => DashboardBloc(
        account: account,
      );

  @override
  final Widget page = const DashboardMainPage();

  @override
  final RouteBase route = $dashboardAppRoute;
}
