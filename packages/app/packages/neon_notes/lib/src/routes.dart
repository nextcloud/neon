import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_notes/src/pages/main.dart';
import 'package:nextcloud/notes.dart' as notes;

part 'routes.g.dart';

@TypedGoRoute<NotesAppRoute>(
  path: '$appsBaseRoutePrefix${notes.appID}',
  name: notes.appID,
)
@immutable
class NotesAppRoute extends NeonBaseAppRoute {
  const NotesAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NotesMainPage();
}
