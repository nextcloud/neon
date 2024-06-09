import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/src/blocs/notifications.dart';
import 'package:neon_notifications/src/pages/main.dart';
import 'package:neon_notifications/src/widgets/notification.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

import 'testing.dart';

void main() {
  late NotificationsBloc bloc;
  late Account account;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    FakeNeonStorage.setup();

    bloc = MockNotificationsBloc();
    when(() => bloc.errors).thenAnswer((_) => StreamController<Object>().stream);
    when(() => bloc.unreadCounter).thenAnswer((_) => BehaviorSubject.seeded(0));
    when(() => bloc.notifications).thenAnswer((_) => BehaviorSubject.seeded(Result.success(BuiltList())));

    account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));
  });

  testWidgets('Errors', (tester) async {
    final controller = StreamController<Object>();
    when(() => bloc.errors).thenAnswer((_) => controller.stream);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          NeonProvider<NotificationsBlocInterface>.value(value: bloc),
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: const NotificationsMainPage(),
      ),
    );

    controller.add(Exception());
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOne);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/main_page_error.png'));

    await controller.close();
  });

  testWidgets('Without notifications', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          NeonProvider<NotificationsBlocInterface>.value(value: bloc),
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: const NotificationsMainPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(NotificationsNotification), findsNothing);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/main_page_without_notifications.png'));

    await tester.tap(find.byType(FloatingActionButton));
    verifyNever(() => bloc.deleteAllNotifications());
  });

  testWidgets('With notifications', (tester) async {
    when(() => bloc.unreadCounter).thenAnswer((_) => BehaviorSubject.seeded(3));
    when(() => bloc.notifications).thenAnswer(
      (_) => BehaviorSubject.seeded(
        Result.success(
          BuiltList(
            List.generate(3, (i) {
              final notification = MockNotification();
              when(() => notification.notificationId).thenReturn(i);
              when(() => notification.app).thenReturn('app');
              when(() => notification.subject).thenReturn('subject');
              when(() => notification.message).thenReturn('message');
              when(() => notification.datetime).thenReturn(tz.TZDateTime.now(tz.UTC).toIso8601String());
              when(() => notification.actions).thenReturn(BuiltList());
              when(() => notification.icon).thenReturn('');
              when(() => notification.link).thenReturn('/link');

              return notification;
            }),
          ),
        ),
      ),
    );

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          NeonProvider<NotificationsBlocInterface>.value(value: bloc),
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        child: const NotificationsMainPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(NotificationsNotification), findsExactly(3));
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/main_page_with_notifications.png'));

    await tester.tap(find.byType(FloatingActionButton));
    verify(() => bloc.deleteAllNotifications()).called(1);

    await tester.longPress(find.byType(NotificationsNotification).first);
    verify(() => bloc.deleteNotification(0)).called(1);
  });
}
