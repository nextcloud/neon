import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_rich_text/neon_rich_text.dart';
import 'package:neon_rich_text/src/rich_objects/rich_objects.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  setUpAll(() {
    FakeNeonStorage.setup();
  });

  group('buildRichObjectParameter', () {
    for (final isPreview in [true, false]) {
      group(isPreview ? 'As preview' : 'Complete', () {
        group('Mention', () {
          for (final type in [
            core.RichObjectParameter_Type.user,
            core.RichObjectParameter_Type.call,
            core.RichObjectParameter_Type.guest,
            core.RichObjectParameter_Type.userGroup,
          ]) {
            testWidgets(type.value, (tester) async {
              final userDetails = MockUserDetails();
              when(() => userDetails.groups).thenReturn(BuiltList());

              final userDetailsBloc = MockUserDetailsBloc();
              when(() => userDetailsBloc.userDetails)
                  .thenAnswer((_) => BehaviorSubject.seeded(Result.success(userDetails)));

              final account = MockAccount();

              await tester.pumpWidgetWithAccessibility(
                TestApp(
                  providers: [
                    Provider<Account>.value(value: account),
                    NeonProvider<UserDetailsBloc>.value(value: userDetailsBloc),
                  ],
                  child: RichText(
                    text: buildRichObjectParameter(
                      parameter: core.RichObjectParameter(
                        (b) => b
                          ..type = type
                          ..id = ''
                          ..name = 'name'
                          ..iconUrl = '',
                      ),
                      textStyle: null,
                      isPreview: isPreview,
                    ),
                  ),
                ),
              );

              expect(find.byType(NeonRichObjectMention), isPreview ? findsNothing : findsOne);
              expect(find.text('name', findRichText: true), findsOne);
            });
          }
        });

        testWidgets('File', (tester) async {
          final account = MockAccount();

          await tester.pumpWidgetWithAccessibility(
            TestApp(
              providers: [
                Provider<Account>.value(value: account),
              ],
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: core.RichObjectParameter(
                    (b) => b
                      ..type = core.RichObjectParameter_Type.file
                      ..id = '0'
                      ..name = 'name',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(NeonRichObjectFile), isPreview ? findsNothing : findsOne);
          expect(find.text('name', findRichText: true), findsOne);
        });

        testWidgets('Deck card', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: core.RichObjectParameter(
                    (b) => b
                      ..type = core.RichObjectParameter_Type.deckCard
                      ..id = ''
                      ..name = 'name'
                      ..boardname = 'boardname'
                      ..stackname = 'stackname',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(NeonRichObjectDeckCard), isPreview ? findsNothing : findsOne);
          expect(find.text('name', findRichText: true), findsOne);
        });

        testWidgets('Fallback', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: core.RichObjectParameter(
                    (b) => b
                      ..type = core.RichObjectParameter_Type.addressbook
                      ..id = ''
                      ..name = 'name',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(NeonRichObjectFallback), isPreview ? findsNothing : findsOne);
          expect(find.text('name', findRichText: true), findsOne);
        });
      });
    }
  });
}
