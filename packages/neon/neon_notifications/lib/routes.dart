import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/utils.dart';
import 'package:neon_notifications/neon_notifications.dart';
import 'package:nextcloud/nextcloud.dart';

part 'routes.g.dart';

@TypedGoRoute<NotificationsAppRoute>(
  path: '$appsBaseRoutePrefix${AppIDs.notifications}',
  name: AppIDs.notifications,
)
@immutable
class NotificationsAppRoute extends NeonBaseAppRoute {
  const NotificationsAppRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const NotificationsMainPage();
}
