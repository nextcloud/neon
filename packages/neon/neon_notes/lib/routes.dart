import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/nextcloud.dart';
import 'package:neon/utils.dart';
import 'package:neon_notes/neon_notes.dart';

part 'routes.g.dart';

@TypedGoRoute<NotesAppRoute>(
  path: '$appsBaseRoutePrefix${AppIDs.notes}',
  name: AppIDs.notes,
)
@immutable
class NotesAppRoute extends NeonBaseAppRoute {
  const NotesAppRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const NotesMainPage();
}
