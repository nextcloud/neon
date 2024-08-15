import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/utils.dart';
import 'package:talk_app/src/pages/main.dart';

part 'routes.g.dart';

/// Route for the talk app.
@TypedGoRoute<TalkAppRoute>(
  path: '${appsBaseRoutePrefix}talk',
  name: 'talk',
)
@immutable
class TalkAppRoute extends NeonBaseAppRoute {
  /// Creates a new talk app route.
  const TalkAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TalkMainPage();
}
