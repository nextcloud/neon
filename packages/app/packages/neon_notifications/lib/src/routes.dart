import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_notifications/src/pages/main.dart';
import 'package:nextcloud/notifications.dart' as notifications;

part 'routes.g.dart';

@TypedGoRoute<NotificationsAppRoute>(
  path: '$appsBaseRoutePrefix${notifications.appID}',
  name: notifications.appID,
)
@immutable
class NotificationsAppRoute extends NeonBaseAppRoute {
  const NotificationsAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NotificationsMainPage();
}
