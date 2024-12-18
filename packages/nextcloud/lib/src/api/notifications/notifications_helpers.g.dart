// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_helpers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DecryptedSubject> _$decryptedSubjectSerializer = _$DecryptedSubjectSerializer();

class _$DecryptedSubjectSerializer implements StructuredSerializer<DecryptedSubject> {
  @override
  final Iterable<Type> types = const [DecryptedSubject, _$DecryptedSubject];
  @override
  final String wireName = 'DecryptedSubject';

  @override
  Iterable<Object?> serialize(Serializers serializers, DecryptedSubject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nid;
    if (value != null) {
      result
        ..add('nid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nids;
    if (value != null) {
      result
        ..add('nids')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)])));
    }
    value = object.app;
    if (value != null) {
      result
        ..add('app')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('subject')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.delete;
    if (value != null) {
      result
        ..add('delete')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteMultiple;
    if (value != null) {
      result
        ..add('delete-multiple')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteAll;
    if (value != null) {
      result
        ..add('delete-all')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  DecryptedSubject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DecryptedSubjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nid':
          result.nid = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'nids':
          result.nids.replace(serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'delete':
          result.delete = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete-multiple':
          result.deleteMultiple = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete-all':
          result.deleteAll = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$DecryptedSubject extends DecryptedSubject {
  @override
  final int? nid;
  @override
  final BuiltList<int>? nids;
  @override
  final String? app;
  @override
  final String? subject;
  @override
  final String? type;
  @override
  final String? id;
  @override
  final bool? delete;
  @override
  final bool? deleteMultiple;
  @override
  final bool? deleteAll;

  factory _$DecryptedSubject([void Function(DecryptedSubjectBuilder)? updates]) =>
      (DecryptedSubjectBuilder()..update(updates))._build();

  _$DecryptedSubject._(
      {this.nid,
      this.nids,
      this.app,
      this.subject,
      this.type,
      this.id,
      this.delete,
      this.deleteMultiple,
      this.deleteAll})
      : super._();

  @override
  DecryptedSubject rebuild(void Function(DecryptedSubjectBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DecryptedSubjectBuilder toBuilder() => DecryptedSubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DecryptedSubject &&
        nid == other.nid &&
        nids == other.nids &&
        app == other.app &&
        subject == other.subject &&
        type == other.type &&
        id == other.id &&
        delete == other.delete &&
        deleteMultiple == other.deleteMultiple &&
        deleteAll == other.deleteAll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nid.hashCode);
    _$hash = $jc(_$hash, nids.hashCode);
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, delete.hashCode);
    _$hash = $jc(_$hash, deleteMultiple.hashCode);
    _$hash = $jc(_$hash, deleteAll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DecryptedSubject')
          ..add('nid', nid)
          ..add('nids', nids)
          ..add('app', app)
          ..add('subject', subject)
          ..add('type', type)
          ..add('id', id)
          ..add('delete', delete)
          ..add('deleteMultiple', deleteMultiple)
          ..add('deleteAll', deleteAll))
        .toString();
  }
}

class DecryptedSubjectBuilder implements Builder<DecryptedSubject, DecryptedSubjectBuilder> {
  _$DecryptedSubject? _$v;

  int? _nid;
  int? get nid => _$this._nid;
  set nid(int? nid) => _$this._nid = nid;

  ListBuilder<int>? _nids;
  ListBuilder<int> get nids => _$this._nids ??= ListBuilder<int>();
  set nids(ListBuilder<int>? nids) => _$this._nids = nids;

  String? _app;
  String? get app => _$this._app;
  set app(String? app) => _$this._app = app;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _delete;
  bool? get delete => _$this._delete;
  set delete(bool? delete) => _$this._delete = delete;

  bool? _deleteMultiple;
  bool? get deleteMultiple => _$this._deleteMultiple;
  set deleteMultiple(bool? deleteMultiple) => _$this._deleteMultiple = deleteMultiple;

  bool? _deleteAll;
  bool? get deleteAll => _$this._deleteAll;
  set deleteAll(bool? deleteAll) => _$this._deleteAll = deleteAll;

  DecryptedSubjectBuilder();

  DecryptedSubjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nid = $v.nid;
      _nids = $v.nids?.toBuilder();
      _app = $v.app;
      _subject = $v.subject;
      _type = $v.type;
      _id = $v.id;
      _delete = $v.delete;
      _deleteMultiple = $v.deleteMultiple;
      _deleteAll = $v.deleteAll;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DecryptedSubject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DecryptedSubject;
  }

  @override
  void update(void Function(DecryptedSubjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DecryptedSubject build() => _build();

  _$DecryptedSubject _build() {
    _$DecryptedSubject _$result;
    try {
      _$result = _$v ??
          _$DecryptedSubject._(
            nid: nid,
            nids: _nids?.build(),
            app: app,
            subject: subject,
            type: type,
            id: id,
            delete: delete,
            deleteMultiple: deleteMultiple,
            deleteAll: deleteAll,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nids';
        _nids?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DecryptedSubject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
