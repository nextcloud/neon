import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/models.dart';
import 'package:neon_dashboard/l10n/localizations.dart';
import 'package:neon_dashboard/src/blocs/dashboard.dart';
import 'package:neon_dashboard/src/options.dart';
import 'package:neon_dashboard/src/pages/main.dart';
import 'package:neon_dashboard/src/routes.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';

/// Implementation of the server `dashboard` app.
class DashboardClient extends ClientImplementation<DashboardBloc, DashboardClientSpecificOptions> {
  /// Creates a new Dashboard client implementation instance.
  DashboardClient();

  @override
  final String id = AppIDs.dashboard;

  @override
  final LocalizationsDelegate<DashboardLocalizations> localizationsDelegate = DashboardLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = DashboardLocalizations.supportedLocales;

  @override
  late final DashboardClientSpecificOptions options = DashboardClientSpecificOptions(storage);

  @override
  DashboardBloc buildBloc(final Account account) => DashboardBloc(account);

  @override
  final Widget page = const DashboardMainPage();

  @override
  final RouteBase route = $dashboardClientRoute;

  @override
  (bool?, String?) isSupported(
    final Account account,
    final core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities,
  ) =>
      const (null, null);
}
