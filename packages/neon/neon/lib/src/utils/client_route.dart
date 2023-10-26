import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// [RouteData] for the initial page of a client.
///
/// Subclasses must override one of [build] or [redirect].
/// Routes should be prefixed with [clientsBaseRoutePrefix].
@immutable
abstract class NeonBaseClientRoute extends GoRouteData {
  /// Creates a new client base route.
  const NeonBaseClientRoute();

  @override
  Page<void> buildPage(final BuildContext context, final GoRouterState state) => NoTransitionPage(
        child: build(context, state),
      );
}

/// Prefix for [NeonBaseClientRoute]s.
const clientsBaseRoutePrefix = '/apps/';
