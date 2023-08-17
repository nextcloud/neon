// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_reminders.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilesRemindersOCSMeta> _$filesRemindersOCSMetaSerializer = _$FilesRemindersOCSMetaSerializer();
Serializer<FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data>
    _$filesRemindersApiGetResponse200ApplicationJsonOcsDataSerializer =
    _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataSerializer();
Serializer<FilesRemindersApiGetResponse200ApplicationJson_Ocs>
    _$filesRemindersApiGetResponse200ApplicationJsonOcsSerializer =
    _$FilesRemindersApiGetResponse200ApplicationJson_OcsSerializer();
Serializer<FilesRemindersApiGetResponse200ApplicationJson> _$filesRemindersApiGetResponse200ApplicationJsonSerializer =
    _$FilesRemindersApiGetResponse200ApplicationJsonSerializer();
Serializer<FilesRemindersApiSetResponse200ApplicationJson_Ocs>
    _$filesRemindersApiSetResponse200ApplicationJsonOcsSerializer =
    _$FilesRemindersApiSetResponse200ApplicationJson_OcsSerializer();
Serializer<FilesRemindersApiSetResponse200ApplicationJson> _$filesRemindersApiSetResponse200ApplicationJsonSerializer =
    _$FilesRemindersApiSetResponse200ApplicationJsonSerializer();
Serializer<FilesRemindersApiRemoveResponse200ApplicationJson_Ocs>
    _$filesRemindersApiRemoveResponse200ApplicationJsonOcsSerializer =
    _$FilesRemindersApiRemoveResponse200ApplicationJson_OcsSerializer();
Serializer<FilesRemindersApiRemoveResponse200ApplicationJson>
    _$filesRemindersApiRemoveResponse200ApplicationJsonSerializer =
    _$FilesRemindersApiRemoveResponse200ApplicationJsonSerializer();

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

class _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data,
    _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data object,
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
  FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder();

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

class _$FilesRemindersApiGetResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesRemindersApiGetResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiGetResponse200ApplicationJson_Ocs,
    _$FilesRemindersApiGetResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesRemindersApiGetResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiGetResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(FilesRemindersOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder();

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
                  specifiedType: const FullType(FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data))!
              as FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiGetResponse200ApplicationJsonSerializer
    implements StructuredSerializer<FilesRemindersApiGetResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiGetResponse200ApplicationJson,
    _$FilesRemindersApiGetResponse200ApplicationJson
  ];
  @override
  final String wireName = 'FilesRemindersApiGetResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiGetResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(FilesRemindersApiGetResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiGetResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiGetResponse200ApplicationJson_Ocs))!
              as FilesRemindersApiGetResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiSetResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesRemindersApiSetResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiSetResponse200ApplicationJson_Ocs,
    _$FilesRemindersApiSetResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesRemindersApiSetResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiSetResponse200ApplicationJson_Ocs object,
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
  FilesRemindersApiSetResponse200ApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder();

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

class _$FilesRemindersApiSetResponse200ApplicationJsonSerializer
    implements StructuredSerializer<FilesRemindersApiSetResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiSetResponse200ApplicationJson,
    _$FilesRemindersApiSetResponse200ApplicationJson
  ];
  @override
  final String wireName = 'FilesRemindersApiSetResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiSetResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(FilesRemindersApiSetResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesRemindersApiSetResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiSetResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiSetResponse200ApplicationJson_Ocs))!
              as FilesRemindersApiSetResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRemindersApiRemoveResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesRemindersApiRemoveResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiRemoveResponse200ApplicationJson_Ocs,
    _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesRemindersApiRemoveResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiRemoveResponse200ApplicationJson_Ocs object,
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
  FilesRemindersApiRemoveResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder();

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

class _$FilesRemindersApiRemoveResponse200ApplicationJsonSerializer
    implements StructuredSerializer<FilesRemindersApiRemoveResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesRemindersApiRemoveResponse200ApplicationJson,
    _$FilesRemindersApiRemoveResponse200ApplicationJson
  ];
  @override
  final String wireName = 'FilesRemindersApiRemoveResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRemindersApiRemoveResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(FilesRemindersApiRemoveResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesRemindersApiRemoveResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesRemindersApiRemoveResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesRemindersApiRemoveResponse200ApplicationJson_Ocs))!
              as FilesRemindersApiRemoveResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
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

class FilesRemindersOCSMetaBuilder implements Builder<FilesRemindersOCSMeta, FilesRemindersOCSMetaBuilder> {
  _$FilesRemindersOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(String? itemsperpage) => _$this._itemsperpage = itemsperpage;

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
  void replace(FilesRemindersOCSMeta other) {
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

class _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data
    extends FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data {
  @override
  final String? dueDate;

  factory _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data(
          [void Function(FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder)? updates]) =>
      (FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data._({this.dueDate}) : super._();

  @override
  FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data rebuild(
          void Function(FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder toBuilder() =>
      FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data && dueDate == other.dueDate;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data')
          ..add('dueDate', dueDate))
        .toString();
  }
}

class FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder
    implements
        Builder<FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data,
            FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder> {
  _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data? _$v;

  String? _dueDate;
  String? get dueDate => _$this._dueDate;
  set dueDate(String? dueDate) => _$this._dueDate = dueDate;

  FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder();

  FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dueDate = $v.dueDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data build() => _build();

  _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data _build() {
    final _$result = _$v ?? _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data._(dueDate: dueDate);
    replace(_$result);
    return _$result;
  }
}

class _$FilesRemindersApiGetResponse200ApplicationJson_Ocs extends FilesRemindersApiGetResponse200ApplicationJson_Ocs {
  @override
  final FilesRemindersOCSMeta meta;
  @override
  final FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data data;

  factory _$FilesRemindersApiGetResponse200ApplicationJson_Ocs(
          [void Function(FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesRemindersApiGetResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesRemindersApiGetResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesRemindersApiGetResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson_Ocs rebuild(
          void Function(FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder toBuilder() =>
      FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiGetResponse200ApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiGetResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder
    implements
        Builder<FilesRemindersApiGetResponse200ApplicationJson_Ocs,
            FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder> {
  _$FilesRemindersApiGetResponse200ApplicationJson_Ocs? _$v;

  FilesRemindersOCSMetaBuilder? _meta;
  FilesRemindersOCSMetaBuilder get meta => _$this._meta ??= FilesRemindersOCSMetaBuilder();
  set meta(FilesRemindersOCSMetaBuilder? meta) => _$this._meta = meta;

  FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder? _data;
  FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder();
  set data(FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder();

  FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiGetResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiGetResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson_Ocs build() => _build();

  _$FilesRemindersApiGetResponse200ApplicationJson_Ocs _build() {
    _$FilesRemindersApiGetResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiGetResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiGetResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FilesRemindersApiGetResponse200ApplicationJson extends FilesRemindersApiGetResponse200ApplicationJson {
  @override
  final FilesRemindersApiGetResponse200ApplicationJson_Ocs ocs;

  factory _$FilesRemindersApiGetResponse200ApplicationJson(
          [void Function(FilesRemindersApiGetResponse200ApplicationJsonBuilder)? updates]) =>
      (FilesRemindersApiGetResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$FilesRemindersApiGetResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesRemindersApiGetResponse200ApplicationJson', 'ocs');
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson rebuild(
          void Function(FilesRemindersApiGetResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiGetResponse200ApplicationJsonBuilder toBuilder() =>
      FilesRemindersApiGetResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiGetResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiGetResponse200ApplicationJson')..add('ocs', ocs)).toString();
  }
}

class FilesRemindersApiGetResponse200ApplicationJsonBuilder
    implements
        Builder<FilesRemindersApiGetResponse200ApplicationJson, FilesRemindersApiGetResponse200ApplicationJsonBuilder> {
  _$FilesRemindersApiGetResponse200ApplicationJson? _$v;

  FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder? _ocs;
  FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder();
  set ocs(FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesRemindersApiGetResponse200ApplicationJsonBuilder();

  FilesRemindersApiGetResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiGetResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiGetResponse200ApplicationJson;
  }

  @override
  void update(void Function(FilesRemindersApiGetResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiGetResponse200ApplicationJson build() => _build();

  _$FilesRemindersApiGetResponse200ApplicationJson _build() {
    _$FilesRemindersApiGetResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiGetResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiGetResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FilesRemindersApiSetResponse200ApplicationJson_Ocs extends FilesRemindersApiSetResponse200ApplicationJson_Ocs {
  @override
  final FilesRemindersOCSMeta meta;
  @override
  final JsonObject data;

  factory _$FilesRemindersApiSetResponse200ApplicationJson_Ocs(
          [void Function(FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesRemindersApiSetResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesRemindersApiSetResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesRemindersApiSetResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  FilesRemindersApiSetResponse200ApplicationJson_Ocs rebuild(
          void Function(FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder toBuilder() =>
      FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiSetResponse200ApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiSetResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder
    implements
        Builder<FilesRemindersApiSetResponse200ApplicationJson_Ocs,
            FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder> {
  _$FilesRemindersApiSetResponse200ApplicationJson_Ocs? _$v;

  FilesRemindersOCSMetaBuilder? _meta;
  FilesRemindersOCSMetaBuilder get meta => _$this._meta ??= FilesRemindersOCSMetaBuilder();
  set meta(FilesRemindersOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder();

  FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiSetResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiSetResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiSetResponse200ApplicationJson_Ocs build() => _build();

  _$FilesRemindersApiSetResponse200ApplicationJson_Ocs _build() {
    _$FilesRemindersApiSetResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$FilesRemindersApiSetResponse200ApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'FilesRemindersApiSetResponse200ApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiSetResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FilesRemindersApiSetResponse200ApplicationJson extends FilesRemindersApiSetResponse200ApplicationJson {
  @override
  final FilesRemindersApiSetResponse200ApplicationJson_Ocs ocs;

  factory _$FilesRemindersApiSetResponse200ApplicationJson(
          [void Function(FilesRemindersApiSetResponse200ApplicationJsonBuilder)? updates]) =>
      (FilesRemindersApiSetResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$FilesRemindersApiSetResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesRemindersApiSetResponse200ApplicationJson', 'ocs');
  }

  @override
  FilesRemindersApiSetResponse200ApplicationJson rebuild(
          void Function(FilesRemindersApiSetResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiSetResponse200ApplicationJsonBuilder toBuilder() =>
      FilesRemindersApiSetResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiSetResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiSetResponse200ApplicationJson')..add('ocs', ocs)).toString();
  }
}

class FilesRemindersApiSetResponse200ApplicationJsonBuilder
    implements
        Builder<FilesRemindersApiSetResponse200ApplicationJson, FilesRemindersApiSetResponse200ApplicationJsonBuilder> {
  _$FilesRemindersApiSetResponse200ApplicationJson? _$v;

  FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder? _ocs;
  FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder();
  set ocs(FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesRemindersApiSetResponse200ApplicationJsonBuilder();

  FilesRemindersApiSetResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiSetResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiSetResponse200ApplicationJson;
  }

  @override
  void update(void Function(FilesRemindersApiSetResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiSetResponse200ApplicationJson build() => _build();

  _$FilesRemindersApiSetResponse200ApplicationJson _build() {
    _$FilesRemindersApiSetResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiSetResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiSetResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs
    extends FilesRemindersApiRemoveResponse200ApplicationJson_Ocs {
  @override
  final FilesRemindersOCSMeta meta;
  @override
  final JsonObject data;

  factory _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs(
          [void Function(FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesRemindersApiRemoveResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesRemindersApiRemoveResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  FilesRemindersApiRemoveResponse200ApplicationJson_Ocs rebuild(
          void Function(FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder toBuilder() =>
      FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiRemoveResponse200ApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiRemoveResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder
    implements
        Builder<FilesRemindersApiRemoveResponse200ApplicationJson_Ocs,
            FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder> {
  _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs? _$v;

  FilesRemindersOCSMetaBuilder? _meta;
  FilesRemindersOCSMetaBuilder get meta => _$this._meta ??= FilesRemindersOCSMetaBuilder();
  set meta(FilesRemindersOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder();

  FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiRemoveResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiRemoveResponse200ApplicationJson_Ocs build() => _build();

  _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs _build() {
    _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'FilesRemindersApiRemoveResponse200ApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiRemoveResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FilesRemindersApiRemoveResponse200ApplicationJson extends FilesRemindersApiRemoveResponse200ApplicationJson {
  @override
  final FilesRemindersApiRemoveResponse200ApplicationJson_Ocs ocs;

  factory _$FilesRemindersApiRemoveResponse200ApplicationJson(
          [void Function(FilesRemindersApiRemoveResponse200ApplicationJsonBuilder)? updates]) =>
      (FilesRemindersApiRemoveResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$FilesRemindersApiRemoveResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesRemindersApiRemoveResponse200ApplicationJson', 'ocs');
  }

  @override
  FilesRemindersApiRemoveResponse200ApplicationJson rebuild(
          void Function(FilesRemindersApiRemoveResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRemindersApiRemoveResponse200ApplicationJsonBuilder toBuilder() =>
      FilesRemindersApiRemoveResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRemindersApiRemoveResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'FilesRemindersApiRemoveResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class FilesRemindersApiRemoveResponse200ApplicationJsonBuilder
    implements
        Builder<FilesRemindersApiRemoveResponse200ApplicationJson,
            FilesRemindersApiRemoveResponse200ApplicationJsonBuilder> {
  _$FilesRemindersApiRemoveResponse200ApplicationJson? _$v;

  FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder? _ocs;
  FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder();
  set ocs(FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesRemindersApiRemoveResponse200ApplicationJsonBuilder();

  FilesRemindersApiRemoveResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRemindersApiRemoveResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRemindersApiRemoveResponse200ApplicationJson;
  }

  @override
  void update(void Function(FilesRemindersApiRemoveResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRemindersApiRemoveResponse200ApplicationJson build() => _build();

  _$FilesRemindersApiRemoveResponse200ApplicationJson _build() {
    _$FilesRemindersApiRemoveResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesRemindersApiRemoveResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesRemindersApiRemoveResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
