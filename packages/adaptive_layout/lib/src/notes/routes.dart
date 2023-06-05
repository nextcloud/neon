part of 'notes.dart';

@TypedGoRoute<NotesAppRoute>(
  path: '/apps/notes',
  name: 'notesApp',
)
@immutable
class NotesAppRoute extends NeonAppRoute {
  const NotesAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotesAppView();
  }
}
