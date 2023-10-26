import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/utils.dart';
import 'package:neon_files/neon_files.dart';
import 'package:nextcloud/nextcloud.dart';

part 'routes.g.dart';

@TypedGoRoute<FilesClientRoute>(
  path: '$clientsBaseRoutePrefix${AppIDs.files}',
  name: AppIDs.files,
)
@immutable
class FilesClientRoute extends NeonBaseClientRoute {
  const FilesClientRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const FilesMainPage();
}
