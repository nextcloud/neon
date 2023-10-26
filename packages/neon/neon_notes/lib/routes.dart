import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/utils.dart';
import 'package:neon_notes/neon_notes.dart';
import 'package:nextcloud/nextcloud.dart';

part 'routes.g.dart';

@TypedGoRoute<NotesClientRoute>(
  path: '$clientsBaseRoutePrefix${AppIDs.notes}',
  name: AppIDs.notes,
)
@immutable
class NotesClientRoute extends NeonBaseClientRoute {
  const NotesClientRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const NotesMainPage();
}
