import 'dart:convert';

import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:string_normalizer/string_normalizer.dart';
import 'package:universal_io/io.dart';

/// Android 14 only supports Unicode 15.0, so we use that for now, even though newer versions are available:
/// https://developer.android.com/guide/topics/resources/internationalization#versioning-nougat
const unicodeVersion = '15_0';

void main() {
  final formatter = DartFormatter(pageWidth: 120);
  final emitter = DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  final inputFile = File('../../external/emoji-metadata/emoji_${unicodeVersion}_ordering.json');
  final input = json.decode(inputFile.readAsStringSync());

  final library = Library((b) {
    b.docs.add('// GENERATED CODE - DO NOT MODIFY BY HAND');

    b.body.add(
      Class(
        (b) => b
          ..name = 'Emoji'
          ..docs.add('/// Holds the metadata of a Unicode emoji.')
          ..constructors.add(
            Constructor(
              (b) => b
                ..constant = true
                ..docs.add('/// Creates a new [Emoji].')
                ..optionalParameters.addAll([
                  Parameter(
                    (b) => b
                      ..name = 'base'
                      ..named = true
                      ..toThis = true
                      ..required = true,
                  ),
                  Parameter(
                    (b) => b
                      ..name = 'alternates'
                      ..named = true
                      ..toThis = true
                      ..required = true,
                  ),
                  Parameter(
                    (b) => b
                      ..name = 'emoticons'
                      ..named = true
                      ..toThis = true
                      ..required = true,
                  ),
                  Parameter(
                    (b) => b
                      ..name = 'shortcodes'
                      ..named = true
                      ..toThis = true
                      ..required = true,
                  ),
                  Parameter(
                    (b) => b
                      ..name = 'animated'
                      ..named = true
                      ..toThis = true
                      ..required = true,
                  ),
                ]),
            ),
          )
          ..fields.addAll([
            Field(
              (b) => b
                ..name = 'base'
                ..type = refer('String')
                ..modifier = FieldModifier.final$
                ..docs.add('/// The base emoji symbol.'),
            ),
            Field(
              (b) => b
                ..name = 'alternates'
                ..type = refer('List<String>')
                ..modifier = FieldModifier.final$
                ..docs.add('/// The associated alternate emoji symbols.'),
            ),
            Field(
              (b) => b
                ..name = 'emoticons'
                ..type = refer('List<String>')
                ..modifier = FieldModifier.final$
                ..docs.add('/// The associated emoticons.'),
            ),
            Field(
              (b) => b
                ..name = 'shortcodes'
                ..type = refer('List<String>')
                ..modifier = FieldModifier.final$
                ..docs.add('/// The associated short codes.'),
            ),
            Field(
              (b) => b
                ..name = 'animated'
                ..type = refer('bool')
                ..modifier = FieldModifier.final$
                ..docs.add('/// Whether the emoji can be animated.'),
            ),
          ]),
      ),
    );

    final names = <String, String>{};
    const groupIds = <String, String>{
      'Smileys and emotions': 'smileysAndEmotions',
      'People': 'people',
      'Animals and nature': 'animalsAndNature',
      'Food and drink': 'foodAndDrink',
      'Travel and places': 'travelAndPlaces',
      'Activities and events': 'activitiesAndEvents',
      'Objects': 'objects',
      'Symbols': 'symbols',
      'Flags': 'flags',
    };
    final emojiGroups = <String, List<String>>{};

    for (final group in (input as List).map((t) => t as Map<String, dynamic>)) {
      final groupName = group['group'] as String;
      final groupId = groupIds[groupName]!;

      for (final emoji in (group['emoji'] as List).map((t) => t as Map<String, dynamic>)) {
        final base = String.fromCharCodes((emoji['base'] as List).cast<int>());
        final alternates = (emoji['alternates'] as List)
            .map((alternate) => String.fromCharCodes((alternate as List).cast<int>()))
            .toList();
        final emoticons = (emoji['emoticons'] as List).cast<String>();
        final shortcodes = (emoji['shortcodes'] as List).cast<String>();
        final animated = emoji['animated'] as bool;

        var name = '';
        for (final shortcode in shortcodes) {
          name = shortcode.substring(1, shortcode.length - 1).toLowerCase();
          name = name
              .split('-')
              .map(
                (t) => switch (t) {
                  '1' => 'one',
                  '2' => 'two',
                  '3' => 'three',
                  '4' => 'four',
                  '5' => 'five',
                  '6' => 'six',
                  '7' => 'seven',
                  '8' => 'eight',
                  '9' => 'nine',
                  _ => t,
                },
              )
              .mapIndexed((i, t) => i == 0 ? t : '${t.substring(0, 1).toUpperCase()}${t.substring(1)}')
              .join();
          name = StringNormalizer.normalize(name);
          name = name.replaceAll(RegExp('[^a-z]', caseSensitive: false), '');
          if (name.isNotEmpty) {
            break;
          }
        }

        if (name == 'new') {
          name = r'$new';
        }

        emojiGroups[groupId] ??= [];
        emojiGroups[groupId]!.add(name);

        // Some emojis are in multiple groups
        if (names.containsKey(name)) {
          if (names[name] != base) {
            throw Exception('Conflicting name $name for different emojis: $base ${names[name]}');
          }
          continue;
        }
        names[name] = base;

        b.body.add(
          Code('''
/// The $base emoji.
const $name = Emoji(
  base: '$base',
  alternates: [${alternates.isNotEmpty ? "'${alternates.join("', '")}'," : ''}],
  emoticons: [${emoticons.isNotEmpty ? "'${emoticons.join("', '").replaceAll("'", r"\'").replaceAll(r'$', r'\$')}'," : ''}],
  shortcodes: ['${shortcodes.join("', '")}',],
  animated: $animated,
);

'''),
        );
      }
    }

    for (final groupId in emojiGroups.keys) {
      final emojis = emojiGroups[groupId]!;

      b.body.add(
        Code('''
/// The "${groupIds.entries.firstWhere((e) => e.value == groupId).key}" emojis.
const ${groupId}Group = [${emojis.join(', ')},];

'''),
      );
    }

    b.body.add(
      Code('''
/// All emojis.
const all = [${emojiGroups.values.expand((t) => [...t]).join(', ')},];

'''),
    );
  });

  final output = library.accept(emitter).toString();
  File('lib/src/utils/emojis.dart').writeAsStringSync(formatter.format(output));
}
