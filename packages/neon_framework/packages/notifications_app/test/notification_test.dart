import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:notifications_app/l10n/localizations.dart';
import 'package:notifications_app/src/widgets/action.dart';
import 'package:notifications_app/src/widgets/notification.dart';
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
    when(() => notification.notificationId).thenReturn(0);
    when(() => notification.app).thenReturn('app');
    when(() => notification.subject).thenReturn('subject');
    when(() => notification.message).thenReturn('message');
    when(() => notification.datetime).thenReturn(tz.TZDateTime.now(tz.UTC).toIso8601String());
    when(() => notification.actions).thenReturn(BuiltList([primaryAction, secondaryAction]));
    when(() => notification.icon).thenReturn('');
    when(() => notification.link).thenReturn('/link');

    callback = MockCallbackFunction<void>().call;

    account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));
  });

  testWidgets('Notification', (tester) async {
    final router = MockGoRouter();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: NotificationsLocalizations.localizationsDelegates,
        supportedLocales: NotificationsLocalizations.supportedLocales,
        providers: [
          Provider<BuiltSet<AppImplementation>>.value(value: BuiltSet()),
          Provider<Account>.value(value: account),
        ],
        router: router,
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
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/notification.png'));

    await tester.tap(find.byType(NotificationsNotification));
    verify(() => router.go('/link')).called(1);

    await tester.drag(find.byType(NotificationsNotification), const Offset(500, 0));
    await tester.pumpAndSettle();
    verify(callback.call).called(1);
  });
}
