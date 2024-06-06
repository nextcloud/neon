import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/l10n/localizations_en.dart';
import 'package:neon_notifications/src/widgets/action.dart';
import 'package:neon_notifications/src/widgets/notification.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;

import 'testing.dart';

void main() {
  late notifications.Notification notification;
  late void Function() callback;
  late Account account;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    FakeNeonStorage.setup();

    final primaryAction = MockAction();
    when(() => primaryAction.label).thenReturn('primary');
    when(() => primaryAction.primary).thenReturn(true);

    final secondaryAction = MockAction();
    when(() => secondaryAction.label).thenReturn('secondary');
    when(() => secondaryAction.primary).thenReturn(false);

    notification = MockNotification();
    when(() => notification.app).thenReturn('app');
    when(() => notification.subject).thenReturn('subject');
    when(() => notification.message).thenReturn('message');
    when(() => notification.datetime).thenReturn(tz.TZDateTime.now(tz.UTC).toIso8601String());
    when(() => notification.actions).thenReturn(BuiltList([primaryAction, secondaryAction]));
    when(() => notification.icon).thenReturn('');

    callback = MockCallbackFunction<void>().call;

    account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));
  });

  testWidgets('Without matching app', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: NotificationsNotification(
          notification: notification,
          onDelete: callback,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsOne);
    expect(find.text('message'), findsOne);
    expect(find.text('subject'), findsOne);
    expect(find.text('now'), findsOne);
    expect(find.byType(NotificationsAction), findsExactly(2));
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/notification_without_matching_app.png'));

    await tester.longPress(find.byType(NotificationsNotification));
    verify(callback.call).called(1);

    await tester.runAsync(() async {
      await tester.tap(find.byType(NotificationsNotification));
      await tester.pumpAndSettle();

      expect(find.byType(NeonDialog), findsOne);
      expect(find.text(NotificationsLocalizationsEn().notificationAppNotImplementedYet), findsOne);
    });
  });

  testWidgets('With matching app', (tester) async {
    final appsBloc = MockAppsBloc();

    final app = MockAppImplementation();
    when(() => app.id).thenReturn('app');
    when(() => app.buildIcon(size: any(named: 'size'))).thenReturn(const SizedBox());

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet({app})),
          Provider<Account>.value(value: account),
          NeonProvider<AppsBloc>.value(value: appsBloc),
        ],
        child: NotificationsNotification(
          notification: notification,
          onDelete: callback,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsNothing);
    expect(find.text('message'), findsOne);
    expect(find.text('subject'), findsOne);
    expect(find.text('now'), findsOne);
    expect(find.byType(NotificationsAction), findsExactly(2));
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/notification_with_matching_app.png'));

    await tester.longPress(find.byType(NotificationsNotification));
    verify(callback.call).called(1);

    await tester.runAsync(() async {
      await tester.tap(find.byType(NotificationsNotification));
      await tester.pumpAndSettle();

      verify(() => appsBloc.setActiveApp('app')).called(1);
    });
  });
}
