// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_reminders.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilesRemindersOCSMeta> _$filesRemindersOCSMetaSerializer = _$FilesRemindersOCSMetaSerializer();
Serializer<FilesRemindersApiGetResponseApplicationJson_Ocs_Data>
    _$filesRemindersApiGetResponseApplicationJsonOcsDataSerializer =
    _$FilesRemindersApiGetResponseApplicationJson_Ocs_DataSerializer();
Serializer<FilesRemindersApiGetResponseApplicationJson_Ocs> _$filesRemindersApiGetResponseApplicationJsonOcsSerializer =
    _$FilesRemindersApiGetResponseApplicationJson_OcsSerializer();
Serializer<FilesRemindersApiGetResponseApplicationJson> _$filesRemindersApiGetResponseApplicationJsonSerializer =
    _$FilesRemindersApiGetResponseApplicationJsonSerializer();
Serializer<FilesRemindersApiSetResponseApplicationJson_Ocs> _$filesRemindersApiSetResponseApplicationJsonOcsSerializer =
    _$FilesRemindersApiSetResponseApplicationJson_OcsSerializer();
Serializer<FilesRemindersApiSetResponseApplicationJson> _$filesRemindersApiSetResponseApplicationJsonSerializer =
    _$FilesRemindersApiSetResponseApplicationJsonSerializer();
Serializer<FilesRemindersApiRemoveResponseApplicationJson_Ocs>
    _$filesRemindersApiRemoveResponseApplicationJsonOcsSerializer =
    _$FilesRemindersApiRemoveResponseApplicationJson_OcsSerializer();
Serializer<FilesRemindersApiRemoveResponseApplicationJson> _$filesRemindersApiRemoveResponseApplicationJsonSerializer =
    _$FilesRemindersApiRemoveResponseApplicationJsonSerializer();

class _$FilesRemindersOCSMetaSerializer implements StructuredSerializer<FilesRemindersOCSMeta> {
  @override
  final Iterable<Type> types = const [FilesRemindersOCSMeta, _$FilesRemindersOCSMeta];
  @override
  final String wireName = 'FilesRemindersOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersOCSMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FilesRemindersOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersOCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiGetResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<FilesRemindersApiGetResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiGetResponseApplicationJson_Ocs_Data,
    _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'FilesRemindersApiGetResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiGetResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dueDate;
    if (value != null) {
      result
        ..add('dueDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs_Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dueDate':
          result.dueDate = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiGetResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesRemindersApiGetResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiGetResponseApplicationJson_Ocs,
    _$FilesRemindersApiGetResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesRemindersApiGetResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiGetResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(FilesRemindersOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(FilesRemindersApiGetResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiGetResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(FilesRemindersOCSMeta))!
              as FilesRemindersOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiGetResponseApplicationJson_Ocs_Data))!
              as FilesRemindersApiGetResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiGetResponseApplicationJsonSerializer
    implements StructuredSerializer<FilesRemindersApiGetResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiGetResponseApplicationJson,
    _$FilesRemindersApiGetResponseApplicationJson
  ];
  @override
  final String wireName = 'FilesRemindersApiGetResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiGetResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(FilesRemindersApiGetResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesRemindersApiGetResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiGetResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiGetResponseApplicationJson_Ocs))!
              as FilesRemindersApiGetResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiSetResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesRemindersApiSetResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiSetResponseApplicationJson_Ocs,
    _$FilesRemindersApiSetResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesRemindersApiSetResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiSetResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(FilesRemindersOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  FilesRemindersApiSetResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiSetResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(FilesRemindersOCSMeta))!
              as FilesRemindersOCSMeta);
          break;
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiSetResponseApplicationJsonSerializer
    implements StructuredSerializer<FilesRemindersApiSetResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiSetResponseApplicationJson,
    _$FilesRemindersApiSetResponseApplicationJson
  ];
  @override
  final String wireName = 'FilesRemindersApiSetResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiSetResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(FilesRemindersApiSetResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesRemindersApiSetResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiSetResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiSetResponseApplicationJson_Ocs))!
              as FilesRemindersApiSetResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiRemoveResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesRemindersApiRemoveResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiRemoveResponseApplicationJson_Ocs,
    _$FilesRemindersApiRemoveResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesRemindersApiRemoveResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiRemoveResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(FilesRemindersOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  FilesRemindersApiRemoveResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(FilesRemindersOCSMeta))!
              as FilesRemindersOCSMeta);
          break;
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiRemoveResponseApplicationJsonSerializer
    implements StructuredSerializer<FilesRemindersApiRemoveResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiRemoveResponseApplicationJson,
    _$FilesRemindersApiRemoveResponseApplicationJson
  ];
  @override
  final String wireName = 'FilesRemindersApiRemoveResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiRemoveResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(FilesRemindersApiRemoveResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesRemindersApiRemoveResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiRemoveResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiRemoveResponseApplicationJson_Ocs))!
              as FilesRemindersApiRemoveResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class FilesRemindersOCSMetaInterfaceBuilder {
  void replace(FilesRemindersOCSMetaInterface other);
  void update(void Function(FilesRemindersOCSMetaInterfaceBuilder) updates);
  String? get status;
  set status(String? status);

  int? get statuscode;
  set statuscode(int? statuscode);

  String? get message;
  set message(String? message);

  String? get totalitems;
  set totalitems(String? totalitems);

  String? get itemsperpage;
  set itemsperpage(String? itemsperpage);
}

class _$FilesRemindersOCSMeta extends FilesRemindersOCSMeta {
  @override
  final String status;
  @override
  final int statuscode;
  @override
  final String? message;
  @override
  final String? totalitems;
  @override
  final String? itemsperpage;

  factory _$FilesRemindersOCSMeta([void Function(FilesRemindersOCSMetaBuilder)? updates]) =>
      (FilesRemindersOCSMetaBuilder()..update(updates))._build();

  _$FilesRemindersOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'FilesRemindersOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'FilesRemindersOCSMeta', 'statuscode');
  }

  @override
  FilesRemindersOCSMeta rebuild(void Function(FilesRemindersOCSMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersOCSMetaBuilder toBuilder() => FilesRemindersOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersOCSMeta &&
        status == other.status &&
        statuscode == other.statuscode &&
        message == other.message &&
        totalitems == other.totalitems &&
        itemsperpage == other.itemsperpage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statuscode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, totalitems.hashCode);
    _$hash = $jc(_$hash, itemsperpage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class FilesRemindersOCSMetaBuilder
    implements Builder<FilesRemindersOCSMeta, FilesRemindersOCSMetaBuilder>, FilesRemindersOCSMetaInterfaceBuilder {
  _$FilesRemindersOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(covariant String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(covariant int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(covariant String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(covariant String? itemsperpage) => _$this._itemsperpage = itemsperpage;

  FilesRemindersOCSMetaBuilder();

  FilesRemindersOCSMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _statuscode = $v.statuscode;
      _message = $v.message;
      _totalitems = $v.totalitems;
      _itemsperpage = $v.itemsperpage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersOCSMeta;
  }

  @override
  void update(void Function(FilesRemindersOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersOCSMeta build() => _build();

  _$FilesRemindersOCSMeta _build() {
    final _$result = _$v ??
        _$FilesRemindersOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'FilesRemindersOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'FilesRemindersOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get dueDate;
  set dueDate(String? dueDate);
}

class _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data
    extends FilesRemindersApiGetResponseApplicationJson_Ocs_Data {
  @override
  final String? dueDate;

  factory _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data(
          [void Function(FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data._({this.dueDate}) : super._();

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs_Data rebuild(
          void Function(FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiGetResponseApplicationJson_Ocs_Data && dueDate == other.dueDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dueDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiGetResponseApplicationJson_Ocs_Data')
          ..add('dueDate', dueDate))
        .toString();
  }
}

class FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<FilesRemindersApiGetResponseApplicationJson_Ocs_Data,
            FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder>,
        FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data? _$v;

  String? _dueDate;
  String? get dueDate => _$this._dueDate;
  set dueDate(covariant String? dueDate) => _$this._dueDate = dueDate;

  FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder();

  FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dueDate = $v.dueDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiGetResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs_Data build() => _build();

  _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ?? _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data._(dueDate: dueDate);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiGetResponseApplicationJson_OcsInterfaceBuilder {
  void replace(FilesRemindersApiGetResponseApplicationJson_OcsInterface other);
  void update(void Function(FilesRemindersApiGetResponseApplicationJson_OcsInterfaceBuilder) updates);
  FilesRemindersOCSMetaBuilder get meta;
  set meta(FilesRemindersOCSMetaBuilder? meta);

  FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder get data;
  set data(FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$FilesRemindersApiGetResponseApplicationJson_Ocs extends FilesRemindersApiGetResponseApplicationJson_Ocs {
  @override
  final FilesRemindersOCSMeta meta;
  @override
  final FilesRemindersApiGetResponseApplicationJson_Ocs_Data data;

  factory _$FilesRemindersApiGetResponseApplicationJson_Ocs(
          [void Function(FilesRemindersApiGetResponseApplicationJson_OcsBuilder)? updates]) =>
      (FilesRemindersApiGetResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesRemindersApiGetResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesRemindersApiGetResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesRemindersApiGetResponseApplicationJson_Ocs', 'data');
  }

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs rebuild(
          void Function(FilesRemindersApiGetResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiGetResponseApplicationJson_OcsBuilder toBuilder() =>
      FilesRemindersApiGetResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiGetResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiGetResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesRemindersApiGetResponseApplicationJson_OcsBuilder
    implements
        Builder<FilesRemindersApiGetResponseApplicationJson_Ocs,
            FilesRemindersApiGetResponseApplicationJson_OcsBuilder>,
        FilesRemindersApiGetResponseApplicationJson_OcsInterfaceBuilder {
  _$FilesRemindersApiGetResponseApplicationJson_Ocs? _$v;

  FilesRemindersOCSMetaBuilder? _meta;
  FilesRemindersOCSMetaBuilder get meta => _$this._meta ??= FilesRemindersOCSMetaBuilder();
  set meta(covariant FilesRemindersOCSMetaBuilder? meta) => _$this._meta = meta;

  FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder? _data;
  FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  FilesRemindersApiGetResponseApplicationJson_OcsBuilder();

  FilesRemindersApiGetResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiGetResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiGetResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesRemindersApiGetResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiGetResponseApplicationJson_Ocs build() => _build();

  _$FilesRemindersApiGetResponseApplicationJson_Ocs _build() {
    _$FilesRemindersApiGetResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiGetResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiGetResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiGetResponseApplicationJsonInterfaceBuilder {
  void replace(FilesRemindersApiGetResponseApplicationJsonInterface other);
  void update(void Function(FilesRemindersApiGetResponseApplicationJsonInterfaceBuilder) updates);
  FilesRemindersApiGetResponseApplicationJson_OcsBuilder get ocs;
  set ocs(FilesRemindersApiGetResponseApplicationJson_OcsBuilder? ocs);
}

class _$FilesRemindersApiGetResponseApplicationJson extends FilesRemindersApiGetResponseApplicationJson {
  @override
  final FilesRemindersApiGetResponseApplicationJson_Ocs ocs;

  factory _$FilesRemindersApiGetResponseApplicationJson(
          [void Function(FilesRemindersApiGetResponseApplicationJsonBuilder)? updates]) =>
      (FilesRemindersApiGetResponseApplicationJsonBuilder()..update(updates))._build();

  _$FilesRemindersApiGetResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesRemindersApiGetResponseApplicationJson', 'ocs');
  }

  @override
  FilesRemindersApiGetResponseApplicationJson rebuild(
          void Function(FilesRemindersApiGetResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiGetResponseApplicationJsonBuilder toBuilder() =>
      FilesRemindersApiGetResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiGetResponseApplicationJson && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiGetResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class FilesRemindersApiGetResponseApplicationJsonBuilder
    implements
        Builder<FilesRemindersApiGetResponseApplicationJson, FilesRemindersApiGetResponseApplicationJsonBuilder>,
        FilesRemindersApiGetResponseApplicationJsonInterfaceBuilder {
  _$FilesRemindersApiGetResponseApplicationJson? _$v;

  FilesRemindersApiGetResponseApplicationJson_OcsBuilder? _ocs;
  FilesRemindersApiGetResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesRemindersApiGetResponseApplicationJson_OcsBuilder();
  set ocs(covariant FilesRemindersApiGetResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesRemindersApiGetResponseApplicationJsonBuilder();

  FilesRemindersApiGetResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiGetResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiGetResponseApplicationJson;
  }

  @override
  void update(void Function(FilesRemindersApiGetResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiGetResponseApplicationJson build() => _build();

  _$FilesRemindersApiGetResponseApplicationJson _build() {
    _$FilesRemindersApiGetResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiGetResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesRemindersApiGetResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiSetResponseApplicationJson_OcsInterfaceBuilder {
  void replace(FilesRemindersApiSetResponseApplicationJson_OcsInterface other);
  void update(void Function(FilesRemindersApiSetResponseApplicationJson_OcsInterfaceBuilder) updates);
  FilesRemindersOCSMetaBuilder get meta;
  set meta(FilesRemindersOCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$FilesRemindersApiSetResponseApplicationJson_Ocs extends FilesRemindersApiSetResponseApplicationJson_Ocs {
  @override
  final FilesRemindersOCSMeta meta;
  @override
  final JsonObject data;

  factory _$FilesRemindersApiSetResponseApplicationJson_Ocs(
          [void Function(FilesRemindersApiSetResponseApplicationJson_OcsBuilder)? updates]) =>
      (FilesRemindersApiSetResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesRemindersApiSetResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesRemindersApiSetResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesRemindersApiSetResponseApplicationJson_Ocs', 'data');
  }

  @override
  FilesRemindersApiSetResponseApplicationJson_Ocs rebuild(
          void Function(FilesRemindersApiSetResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiSetResponseApplicationJson_OcsBuilder toBuilder() =>
      FilesRemindersApiSetResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiSetResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiSetResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesRemindersApiSetResponseApplicationJson_OcsBuilder
    implements
        Builder<FilesRemindersApiSetResponseApplicationJson_Ocs,
            FilesRemindersApiSetResponseApplicationJson_OcsBuilder>,
        FilesRemindersApiSetResponseApplicationJson_OcsInterfaceBuilder {
  _$FilesRemindersApiSetResponseApplicationJson_Ocs? _$v;

  FilesRemindersOCSMetaBuilder? _meta;
  FilesRemindersOCSMetaBuilder get meta => _$this._meta ??= FilesRemindersOCSMetaBuilder();
  set meta(covariant FilesRemindersOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  FilesRemindersApiSetResponseApplicationJson_OcsBuilder();

  FilesRemindersApiSetResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiSetResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiSetResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesRemindersApiSetResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiSetResponseApplicationJson_Ocs build() => _build();

  _$FilesRemindersApiSetResponseApplicationJson_Ocs _build() {
    _$FilesRemindersApiSetResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$FilesRemindersApiSetResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'FilesRemindersApiSetResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiSetResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiSetResponseApplicationJsonInterfaceBuilder {
  void replace(FilesRemindersApiSetResponseApplicationJsonInterface other);
  void update(void Function(FilesRemindersApiSetResponseApplicationJsonInterfaceBuilder) updates);
  FilesRemindersApiSetResponseApplicationJson_OcsBuilder get ocs;
  set ocs(FilesRemindersApiSetResponseApplicationJson_OcsBuilder? ocs);
}

class _$FilesRemindersApiSetResponseApplicationJson extends FilesRemindersApiSetResponseApplicationJson {
  @override
  final FilesRemindersApiSetResponseApplicationJson_Ocs ocs;

  factory _$FilesRemindersApiSetResponseApplicationJson(
          [void Function(FilesRemindersApiSetResponseApplicationJsonBuilder)? updates]) =>
      (FilesRemindersApiSetResponseApplicationJsonBuilder()..update(updates))._build();

  _$FilesRemindersApiSetResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesRemindersApiSetResponseApplicationJson', 'ocs');
  }

  @override
  FilesRemindersApiSetResponseApplicationJson rebuild(
          void Function(FilesRemindersApiSetResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiSetResponseApplicationJsonBuilder toBuilder() =>
      FilesRemindersApiSetResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiSetResponseApplicationJson && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiSetResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class FilesRemindersApiSetResponseApplicationJsonBuilder
    implements
        Builder<FilesRemindersApiSetResponseApplicationJson, FilesRemindersApiSetResponseApplicationJsonBuilder>,
        FilesRemindersApiSetResponseApplicationJsonInterfaceBuilder {
  _$FilesRemindersApiSetResponseApplicationJson? _$v;

  FilesRemindersApiSetResponseApplicationJson_OcsBuilder? _ocs;
  FilesRemindersApiSetResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesRemindersApiSetResponseApplicationJson_OcsBuilder();
  set ocs(covariant FilesRemindersApiSetResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesRemindersApiSetResponseApplicationJsonBuilder();

  FilesRemindersApiSetResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiSetResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiSetResponseApplicationJson;
  }

  @override
  void update(void Function(FilesRemindersApiSetResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiSetResponseApplicationJson build() => _build();

  _$FilesRemindersApiSetResponseApplicationJson _build() {
    _$FilesRemindersApiSetResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiSetResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesRemindersApiSetResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiRemoveResponseApplicationJson_OcsInterfaceBuilder {
  void replace(FilesRemindersApiRemoveResponseApplicationJson_OcsInterface other);
  void update(void Function(FilesRemindersApiRemoveResponseApplicationJson_OcsInterfaceBuilder) updates);
  FilesRemindersOCSMetaBuilder get meta;
  set meta(FilesRemindersOCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$FilesRemindersApiRemoveResponseApplicationJson_Ocs extends FilesRemindersApiRemoveResponseApplicationJson_Ocs {
  @override
  final FilesRemindersOCSMeta meta;
  @override
  final JsonObject data;

  factory _$FilesRemindersApiRemoveResponseApplicationJson_Ocs(
          [void Function(FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder)? updates]) =>
      (FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesRemindersApiRemoveResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesRemindersApiRemoveResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesRemindersApiRemoveResponseApplicationJson_Ocs', 'data');
  }

  @override
  FilesRemindersApiRemoveResponseApplicationJson_Ocs rebuild(
          void Function(FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder toBuilder() =>
      FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiRemoveResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiRemoveResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder
    implements
        Builder<FilesRemindersApiRemoveResponseApplicationJson_Ocs,
            FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder>,
        FilesRemindersApiRemoveResponseApplicationJson_OcsInterfaceBuilder {
  _$FilesRemindersApiRemoveResponseApplicationJson_Ocs? _$v;

  FilesRemindersOCSMetaBuilder? _meta;
  FilesRemindersOCSMetaBuilder get meta => _$this._meta ??= FilesRemindersOCSMetaBuilder();
  set meta(covariant FilesRemindersOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder();

  FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiRemoveResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiRemoveResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiRemoveResponseApplicationJson_Ocs build() => _build();

  _$FilesRemindersApiRemoveResponseApplicationJson_Ocs _build() {
    _$FilesRemindersApiRemoveResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$FilesRemindersApiRemoveResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'FilesRemindersApiRemoveResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiRemoveResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesRemindersApiRemoveResponseApplicationJsonInterfaceBuilder {
  void replace(FilesRemindersApiRemoveResponseApplicationJsonInterface other);
  void update(void Function(FilesRemindersApiRemoveResponseApplicationJsonInterfaceBuilder) updates);
  FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder get ocs;
  set ocs(FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder? ocs);
}

class _$FilesRemindersApiRemoveResponseApplicationJson extends FilesRemindersApiRemoveResponseApplicationJson {
  @override
  final FilesRemindersApiRemoveResponseApplicationJson_Ocs ocs;

  factory _$FilesRemindersApiRemoveResponseApplicationJson(
          [void Function(FilesRemindersApiRemoveResponseApplicationJsonBuilder)? updates]) =>
      (FilesRemindersApiRemoveResponseApplicationJsonBuilder()..update(updates))._build();

  _$FilesRemindersApiRemoveResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesRemindersApiRemoveResponseApplicationJson', 'ocs');
  }

  @override
  FilesRemindersApiRemoveResponseApplicationJson rebuild(
          void Function(FilesRemindersApiRemoveResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiRemoveResponseApplicationJsonBuilder toBuilder() =>
      FilesRemindersApiRemoveResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiRemoveResponseApplicationJson && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRemindersApiRemoveResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class FilesRemindersApiRemoveResponseApplicationJsonBuilder
    implements
        Builder<FilesRemindersApiRemoveResponseApplicationJson, FilesRemindersApiRemoveResponseApplicationJsonBuilder>,
        FilesRemindersApiRemoveResponseApplicationJsonInterfaceBuilder {
  _$FilesRemindersApiRemoveResponseApplicationJson? _$v;

  FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder? _ocs;
  FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder();
  set ocs(covariant FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesRemindersApiRemoveResponseApplicationJsonBuilder();

  FilesRemindersApiRemoveResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesRemindersApiRemoveResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiRemoveResponseApplicationJson;
  }

  @override
  void update(void Function(FilesRemindersApiRemoveResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiRemoveResponseApplicationJson build() => _build();

  _$FilesRemindersApiRemoveResponseApplicationJson _build() {
    _$FilesRemindersApiRemoveResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiRemoveResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiRemoveResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
