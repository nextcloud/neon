// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $notesClientRoute,
    ];

RouteBase get $notesClientRoute => GoRouteData.$route(
      path: '/apps/notes',
      name: 'notes',
      factory: $NotesClientRouteExtension._fromState,
    );

extension $NotesClientRouteExtension on NotesClientRoute {
  static NotesClientRoute _fromState(GoRouterState state) => const NotesClientRoute();

  String get location => GoRouteData.$location(
        '/apps/notes',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
