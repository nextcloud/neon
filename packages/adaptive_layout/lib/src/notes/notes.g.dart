// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $notesAppRoute,
    ];

RouteBase get $notesAppRoute => GoRouteData.$route(
      path: '/apps/notes',
      name: 'notesApp',
      factory: $NotesAppRouteExtension._fromState,
    );

extension $NotesAppRouteExtension on NotesAppRoute {
  static NotesAppRoute _fromState(GoRouterState state) => const NotesAppRoute();

  String get location => GoRouteData.$location(
        '/apps/notes',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
