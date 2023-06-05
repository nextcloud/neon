part of 'files.dart';

@TypedGoRoute<FilesAppRoute>(
  path: '/apps/files',
  name: 'filesApp',
)
@immutable
class FilesAppRoute extends NeonAppRoute {
  const FilesAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FilesAppView();
  }
}
