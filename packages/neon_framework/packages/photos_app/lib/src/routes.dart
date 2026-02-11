import 'package:files_app/src/pages/main.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/photos.dart' as photos;

part 'routes.g.dart';

@TypedGoRoute<PhotosAppRoute>(
  path: '$appsBaseRoutePrefix${photos.appID}',
  name: photos.appID,
)
@immutable
class PhotosAppRoute extends NeonBaseAppRoute with _$PhotosAppRoute {
  const PhotosAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const FilesMainPage();
}
