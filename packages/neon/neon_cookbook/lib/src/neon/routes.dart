import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_cookbook/src/neon/neon.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/nextcloud.dart';

part 'routes.g.dart';

/// Route for the cookbook app.
@TypedGoRoute<CookbookAppRoute>(
  path: '$appsBaseRoutePrefix${AppIDs.cookbook}',
  name: AppIDs.cookbook,
)
@immutable
class CookbookAppRoute extends NeonBaseAppRoute {
  /// Creates a new cookbook app route.
  const CookbookAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
