import 'package:nextcloud/spreed.dart';
import 'package:test/test.dart';

enum _TestEnum {
  one,
  two,
  three;
}

void main() {
  test('EnumBinary', () {
    expect(
      _TestEnum.one.binary,
      equals(int.parse('000', radix: 2)),
    );

    expect(
      _TestEnum.two.binary,
      equals(int.parse('001', radix: 2)),
    );

    expect(
      _TestEnum.three.binary,
      equals(int.parse('010', radix: 2)),
    );
  });

  test('EnumCollectionBinary', () {
    expect(
      <Enum>{}.binary,
      equals(int.parse('000', radix: 2)),
    );

    expect(
      {_TestEnum.one}.binary,
      equals(int.parse('000', radix: 2)),
    );

    expect(
      {_TestEnum.two, _TestEnum.three}.binary,
      equals(int.parse('011', radix: 2)),
    );
  });

  test('EnumByBinary', () {
    expect(
      _TestEnum.values.byBinary(int.parse('000', radix: 2)),
      equals({_TestEnum.one}),
    );

    expect(
      _TestEnum.values.byBinary(int.parse('011', radix: 2)),
      equals({_TestEnum.two, _TestEnum.three}),
    );

    expect(
      _TestEnum.values.byBinary(int.parse('100', radix: 2)),
      equals({_TestEnum.one}),
      reason: 'When the server adds another entry but the client does not support it yet it is quietly ignored',
    );

    expect(
      () => _TestEnum.values.byBinary(-1),
      throwsRangeError,
    );
  });

  group('RoomType', () {
    group('value -> fromValue roundtrip', () {
      for (final type in RoomType.values) {
        test(type.name, () {
          expect(
            RoomType.fromValue(type.value),
            equals(type),
          );
        });
      }
    });
    group('isSingleUser', () {
      for (final type in RoomType.values) {
        test(type.name, () {
          expect(
            type.isSingleUser,
            type == RoomType.group || type == RoomType.public ? isFalse : isTrue,
          );
        });
      }
    });
  });

  group('ParticipantType value -> fromValue roundtrip', () {
    for (final type in ParticipantType.values) {
      test(type.name, () {
        expect(
          ParticipantType.fromValue(type.value),
          equals(type),
        );
      });
    }
  });
}
