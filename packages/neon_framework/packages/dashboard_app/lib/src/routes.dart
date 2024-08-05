import 'package:dashboard_app/src/pages/main.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;

part 'routes.g.dart';

/// Route for the dashboard app.
@TypedGoRoute<DashboardAppRoute>(
  path: '$appsBaseRoutePrefix${dashboard.appID}',
  name: dashboard.appID,
)
@immutable
class DashboardAppRoute extends NeonBaseAppRoute {
  /// Creates a new dashboard app route.
  const DashboardAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DashboardMainPage();
}
