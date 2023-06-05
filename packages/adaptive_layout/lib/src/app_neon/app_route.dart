import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class NeonAppRoute extends GoRouteData {
  const NeonAppRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      // Todo: cache the build to avoid duplicate animations.
      // might turn out against us having every app cached though :thinking:
      child: build(context, state),
    );
  }
}
