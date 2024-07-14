import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/widgets/reference_preview.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';

import 'testing.dart';

void main() {
  setUpAll(() {
    FakeNeonStorage.setup();
  });

  testWidgets('Loading', (tester) async {
    final router = MockGoRouter();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        router: router,
        child: const TalkReferencePreview(
          url: '/link',
          openGraphObject: null,
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOne);
  });

  testWidgets('Default', (tester) async {
    final account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri()));

    final openGraphObject = MockOpenGraphObject();
    when(() => openGraphObject.name).thenReturn('name');
    when(() => openGraphObject.link).thenReturn('/link');

    final router = MockGoRouter();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        router: router,
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: TalkReferencePreview(
          url: '/link',
          openGraphObject: openGraphObject,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsNothing);
    expect(find.text('name'), findsOne);
    expect(find.text('description'), findsNothing);
    expect(find.text('/link'), findsOne);
    await expectLater(find.byType(TalkReferencePreview), matchesGoldenFile('goldens/reference_preview.png'));
  });

  testWidgets('With thumb', (tester) async {
    final account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri()));

    final openGraphObject = MockOpenGraphObject();
    when(() => openGraphObject.thumb).thenReturn('');
    when(() => openGraphObject.name).thenReturn('name');
    when(() => openGraphObject.link).thenReturn('/link');

    final router = MockGoRouter();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        router: router,
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: TalkReferencePreview(
          url: '/link',
          openGraphObject: openGraphObject,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsOne);
    expect(find.text('name'), findsOne);
    expect(find.text('description'), findsNothing);
    expect(find.text('/link'), findsOne);
    await expectLater(find.byType(TalkReferencePreview), matchesGoldenFile('goldens/reference_preview_with_thumb.png'));
  });

  testWidgets('With description', (tester) async {
    final openGraphObject = MockOpenGraphObject();
    when(() => openGraphObject.name).thenReturn('name');
    when(() => openGraphObject.description).thenReturn('description');

    final router = MockGoRouter();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        router: router,
        child: TalkReferencePreview(
          url: '/link',
          openGraphObject: openGraphObject,
        ),
      ),
    );

    expect(find.byType(NeonUriImage), findsNothing);
    expect(find.text('name'), findsOne);
    expect(find.text('description'), findsOne);
    expect(find.text('/link'), findsOne);
    await expectLater(
      find.byType(TalkReferencePreview),
      matchesGoldenFile('goldens/reference_preview_with_description.png'),
    );
  });
}
