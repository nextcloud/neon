// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (Serializers().toBuilder()
      ..add(DecryptedSubject.serializer)
      ..add(PushNotification.serializer))
    .build();
Serializer<PushNotification> _$pushNotificationSerializer = _$PushNotificationSerializer();

class _$PushNotificationSerializer implements StructuredSerializer<PushNotification> {
  @override
  final Iterable<Type> types = const [PushNotification, _$PushNotification];
  @override
  final String wireName = 'PushNotification';

  @override
  Iterable<Object?> serialize(Serializers serializers, PushNotification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'accountID',
      serializers.serialize(object.accountID, specifiedType: const FullType(String)),
      'priority',
      serializers.serialize(object.priority, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'subject',
      serializers.serialize(object.subject, specifiedType: const FullType(DecryptedSubject)),
    ];

    return result;
  }

  @override
  PushNotification deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PushNotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accountID':
          result.accountID = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subject':
          result.subject.replace(
              serializers.deserialize(value, specifiedType: const FullType(DecryptedSubject))! as DecryptedSubject);
          break;
      }
    }

    return result.build();
  }
}

class _$PushNotification extends PushNotification {
  @override
  final String accountID;
  @override
  final String priority;
  @override
  final String type;
  @override
  final DecryptedSubject subject;

  factory _$PushNotification([void Function(PushNotificationBuilder)? updates]) =>
      (PushNotificationBuilder()..update(updates))._build();

  _$PushNotification._({required this.accountID, required this.priority, required this.type, required this.subject})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(accountID, r'PushNotification', 'accountID');
    BuiltValueNullFieldError.checkNotNull(priority, r'PushNotification', 'priority');
    BuiltValueNullFieldError.checkNotNull(type, r'PushNotification', 'type');
    BuiltValueNullFieldError.checkNotNull(subject, r'PushNotification', 'subject');
  }

  @override
  PushNotification rebuild(void Function(PushNotificationBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PushNotificationBuilder toBuilder() => PushNotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PushNotification &&
        accountID == other.accountID &&
        priority == other.priority &&
        type == other.type &&
        subject == other.subject;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountID.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PushNotification')
          ..add('accountID', accountID)
          ..add('priority', priority)
          ..add('type', type)
          ..add('subject', subject))
        .toString();
  }
}

class PushNotificationBuilder implements Builder<PushNotification, PushNotificationBuilder> {
  _$PushNotification? _$v;

  String? _accountID;
  String? get accountID => _$this._accountID;
  set accountID(String? accountID) => _$this._accountID = accountID;

  String? _priority;
  String? get priority => _$this._priority;
  set priority(String? priority) => _$this._priority = priority;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DecryptedSubjectBuilder? _subject;
  DecryptedSubjectBuilder get subject => _$this._subject ??= DecryptedSubjectBuilder();
  set subject(DecryptedSubjectBuilder? subject) => _$this._subject = subject;

  PushNotificationBuilder();

  PushNotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountID = $v.accountID;
      _priority = $v.priority;
      _type = $v.type;
      _subject = $v.subject.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PushNotification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PushNotification;
  }

  @override
  void update(void Function(PushNotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PushNotification build() => _build();

  _$PushNotification _build() {
    _$PushNotification _$result;
    try {
      _$result = _$v ??
          _$PushNotification._(
              accountID: BuiltValueNullFieldError.checkNotNull(accountID, r'PushNotification', 'accountID'),
              priority: BuiltValueNullFieldError.checkNotNull(priority, r'PushNotification', 'priority'),
              type: BuiltValueNullFieldError.checkNotNull(type, r'PushNotification', 'type'),
              subject: subject.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subject';
        subject.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'PushNotification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
