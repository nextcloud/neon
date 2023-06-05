import 'package:adaptive_layout/src/app_neon/destination.dart';
import 'package:go_router/go_router.dart';

class App {
  App({
    required this.destination,
    required this.route,
    String? routeName,
  })  : assert(
          routeName != null || route is GoRoute && route.name != null,
          'Routename must be specified when the route is not named.',
        ),
        routeName = route is GoRoute ? route.name! : routeName!;

  final RouteBase route;

  final NeonNavigationDestination destination;

  final String routeName;
}
