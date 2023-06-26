import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/utils.dart';
import 'package:neon_files/neon_files.dart';

part 'routes.g.dart';

@TypedGoRoute<FilesAppRoute>(
  path: '$appsRouteSuffix${FilesApp.appId}',
  name: FilesApp.appId,
)
@immutable
class FilesAppRoute extends NeonAppRoute {
  const FilesAppRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const FilesMainPage();
}
