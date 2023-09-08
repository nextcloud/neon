// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_time.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<$DateTime> _$$dateTimeSerializer = _$$DateTimeSerializer();

class _$$DateTimeSerializer implements StructuredSerializer<$DateTime> {
  @override
  final Iterable<Type> types = const [$DateTime, _$$DateTime];
  @override
  final String wireName = '\$DateTime';

  @override
  Iterable<Object?> serialize(Serializers serializers, $DateTime object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(DateTime)),
      'date-time',
      serializers.serialize(object.dateTime, specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  $DateTime deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = $DateTimeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value, specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'date-time':
          result.dateTime = serializers.deserialize(value, specifiedType: const FullType(DateTime))! as DateTime;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $DateTimeInterfaceBuilder {
  void replace($DateTimeInterface other);
  void update(void Function($DateTimeInterfaceBuilder) updates);
  DateTime? get date;
  set date(DateTime? date);

  DateTime? get dateTime;
  set dateTime(DateTime? dateTime);
}

class _$$DateTime extends $DateTime {
  @override
  final DateTime date;
  @override
  final DateTime dateTime;

  factory _$$DateTime([void Function($DateTimeBuilder)? updates]) => ($DateTimeBuilder()..update(updates))._build();

  _$$DateTime._({required this.date, required this.dateTime}) : super._() {
    BuiltValueNullFieldError.checkNotNull(date, r'$DateTime', 'date');
    BuiltValueNullFieldError.checkNotNull(dateTime, r'$DateTime', 'dateTime');
  }

  @override
  $DateTime rebuild(void Function($DateTimeBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  $DateTimeBuilder toBuilder() => $DateTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $DateTime && date == other.date && dateTime == other.dateTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$DateTime')
          ..add('date', date)
          ..add('dateTime', dateTime))
        .toString();
  }
}

class $DateTimeBuilder implements Builder<$DateTime, $DateTimeBuilder>, $DateTimeInterfaceBuilder {
  _$$DateTime? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(covariant DateTime? date) => _$this._date = date;

  DateTime? _dateTime;
  DateTime? get dateTime => _$this._dateTime;
  set dateTime(covariant DateTime? dateTime) => _$this._dateTime = dateTime;

  $DateTimeBuilder();

  $DateTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _dateTime = $v.dateTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $DateTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$DateTime;
  }

  @override
  void update(void Function($DateTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $DateTime build() => _build();

  _$$DateTime _build() {
    final _$result = _$v ??
        _$$DateTime._(
            date: BuiltValueNullFieldError.checkNotNull(date, r'$DateTime', 'date'),
            dateTime: BuiltValueNullFieldError.checkNotNull(dateTime, r'$DateTime', 'dateTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
