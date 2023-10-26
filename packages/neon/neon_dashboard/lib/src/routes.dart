import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/utils.dart';
import 'package:neon_dashboard/src/pages/main.dart';
import 'package:nextcloud/nextcloud.dart';

part 'routes.g.dart';

/// Route for the dashboard client.
@TypedGoRoute<DashboardClientRoute>(
  path: '$clientsBaseRoutePrefix${AppIDs.dashboard}',
  name: AppIDs.dashboard,
)
@immutable
class DashboardClientRoute extends NeonBaseClientRoute {
  /// Creates a new dashboard client route.
  const DashboardClientRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const DashboardMainPage();
}
