import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_rich_text/neon_rich_text.dart';
import 'package:nextcloud/core.dart' as core;

class MockOnReferenceClickedCallback extends Mock {
  void call(String reference);
}

void main() {
  group('buildRichTextSpan', () {
    test('Preview without newlines', () {
      var span = buildRichTextSpan(
        text: '123\n456',
        parameters: BuiltMap(),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!.single as TextSpan;
      expect(span.text, '123\n456');

      span = buildRichTextSpan(
        text: '123\n456',
        parameters: BuiltMap(),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
        isPreview: true,
      ).children!.single as TextSpan;
      expect(span.text, '123 456');
    });

    group('Unused parameters', () {
      for (final type in core.RichObjectParameter_Type.values) {
        test(type, () {
          final spans = buildRichTextSpan(
            text: 'test',
            parameters: BuiltMap({
              type.value: BuiltMap<String, JsonObject>({
                'type': JsonObject(type.value),
                'id': JsonObject(1),
                'name': JsonObject(''),
              }),
            }),
            references: BuiltList(),
            style: const TextStyle(),
            onReferenceClicked: (_) {},
          ).children!;
          if (type == core.RichObjectParameter_Type.file) {
            expect(spans, hasLength(3));
            expect((spans[0] as WidgetSpan).child, isA<NeonRichObjectFile>());
            expect((spans[1] as TextSpan).text, '\n');
            expect((spans[2] as TextSpan).text, 'test');
          } else {
            expect((spans.single as TextSpan).text, 'test');
          }
        });
      }
    });

    test('Used parameters', () {
      final spans = buildRichTextSpan(
        text: '123 {actor1} 456 {actor2} 789',
        parameters: BuiltMap({
          'actor1': BuiltMap<String, JsonObject>({
            'type': JsonObject('user'),
            'id': JsonObject(''),
            'name': JsonObject(''),
          }),
          'actor2': BuiltMap<String, JsonObject>({
            'type': JsonObject('user'),
            'id': JsonObject(''),
            'name': JsonObject(''),
          }),
        }),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!;
      expect(spans, hasLength(5));
      expect((spans[0] as TextSpan).text, '123 ');
      expect((spans[1] as WidgetSpan).child, isA<NeonRichObjectMention>());
      expect((spans[2] as TextSpan).text, ' 456 ');
      expect((spans[3] as WidgetSpan).child, isA<NeonRichObjectMention>());
      expect((spans[4] as TextSpan).text, ' 789');
    });

    test('References', () {
      final callback = MockOnReferenceClickedCallback();

      final spans = buildRichTextSpan(
        text: 'a 123 b 456 c',
        parameters: BuiltMap(),
        references: BuiltList(['123', '456']),
        style: const TextStyle(),
        onReferenceClicked: callback.call,
      ).children!;
      expect(spans, hasLength(5));

      expect((spans[0] as TextSpan).text, 'a ');

      final link1 = spans[1] as TextSpan;
      expect(link1.text, '123');
      (link1.recognizer! as TapGestureRecognizer).onTap!();
      verify(() => callback('123')).called(1);

      expect((spans[2] as TextSpan).text, ' b ');

      final link2 = spans[3] as TextSpan;
      expect(link2.text, '456');
      (link2.recognizer! as TapGestureRecognizer).onTap!();
      verify(() => callback('456')).called(1);

      expect((spans[4] as TextSpan).text, ' c');
    });

    test('Skip empty parts', () {
      final spans = buildRichTextSpan(
        text: '{actor}',
        parameters: BuiltMap({
          'actor': BuiltMap<String, JsonObject>({
            'type': JsonObject(core.RichObjectParameter_Type.user.name),
            'id': JsonObject(''),
            'name': JsonObject(''),
          }),
        }),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!;
      expect(spans, hasLength(1));
      expect((spans[0] as WidgetSpan).child, isA<NeonRichObjectMention>());
    });
  });
}
