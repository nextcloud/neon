import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_talk/src/widgets/reactions.dart';

void main() {
  testWidgets('Reactions', (tester) async {
    await tester.pumpWidget(
      TestApp(
        child: TalkReactions(
          reactions: BuiltMap(
            {
              '😀': 1,
              '😊': 23,
            },
          ),
        ),
      ),
    );
    await expectLater(
      find.byType(TalkReactions),
      matchesGoldenFile('goldens/reactions.png'),
    );
  });
}
