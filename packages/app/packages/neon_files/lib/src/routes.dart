import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_files/src/pages/main.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/files.dart' as files;

part 'routes.g.dart';

@TypedGoRoute<FilesAppRoute>(
  path: '$appsBaseRoutePrefix${files.appID}',
  name: files.appID,
)
@immutable
class FilesAppRoute extends NeonBaseAppRoute {
  const FilesAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FilesMainPage();
}
