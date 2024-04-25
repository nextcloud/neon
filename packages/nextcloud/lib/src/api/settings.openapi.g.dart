// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DeclarativeForm_SectionType _$declarativeFormSectionTypeAdmin = DeclarativeForm_SectionType._('admin');
const DeclarativeForm_SectionType _$declarativeFormSectionTypePersonal = DeclarativeForm_SectionType._('personal');

DeclarativeForm_SectionType _$valueOfDeclarativeForm_SectionType(String name) {
  switch (name) {
    case 'admin':
      return _$declarativeFormSectionTypeAdmin;
    case 'personal':
      return _$declarativeFormSectionTypePersonal;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DeclarativeForm_SectionType> _$declarativeFormSectionTypeValues =
    BuiltSet<DeclarativeForm_SectionType>(const <DeclarativeForm_SectionType>[
  _$declarativeFormSectionTypeAdmin,
  _$declarativeFormSectionTypePersonal,
]);

const DeclarativeForm_StorageType _$declarativeFormStorageTypeInternal = DeclarativeForm_StorageType._('internal');
const DeclarativeForm_StorageType _$declarativeFormStorageType$external = DeclarativeForm_StorageType._('\$external');

DeclarativeForm_StorageType _$valueOfDeclarativeForm_StorageType(String name) {
  switch (name) {
    case 'internal':
      return _$declarativeFormStorageTypeInternal;
    case '\$external':
      return _$declarativeFormStorageType$external;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DeclarativeForm_StorageType> _$declarativeFormStorageTypeValues =
    BuiltSet<DeclarativeForm_StorageType>(const <DeclarativeForm_StorageType>[
  _$declarativeFormStorageTypeInternal,
  _$declarativeFormStorageType$external,
]);

const DeclarativeFormField_Type _$declarativeFormFieldTypeText = DeclarativeFormField_Type._('text');
const DeclarativeFormField_Type _$declarativeFormFieldTypePassword = DeclarativeFormField_Type._('password');
const DeclarativeFormField_Type _$declarativeFormFieldTypeEmail = DeclarativeFormField_Type._('email');
const DeclarativeFormField_Type _$declarativeFormFieldTypeTel = DeclarativeFormField_Type._('tel');
const DeclarativeFormField_Type _$declarativeFormFieldTypeUrl = DeclarativeFormField_Type._('url');
const DeclarativeFormField_Type _$declarativeFormFieldTypeNumber = DeclarativeFormField_Type._('number');
const DeclarativeFormField_Type _$declarativeFormFieldTypeCheckbox = DeclarativeFormField_Type._('checkbox');
const DeclarativeFormField_Type _$declarativeFormFieldTypeMultiCheckbox = DeclarativeFormField_Type._('multiCheckbox');
const DeclarativeFormField_Type _$declarativeFormFieldTypeRadio = DeclarativeFormField_Type._('radio');
const DeclarativeFormField_Type _$declarativeFormFieldTypeSelect = DeclarativeFormField_Type._('select');
const DeclarativeFormField_Type _$declarativeFormFieldTypeMultiSelect = DeclarativeFormField_Type._('multiSelect');

DeclarativeFormField_Type _$valueOfDeclarativeFormField_Type(String name) {
  switch (name) {
    case 'text':
      return _$declarativeFormFieldTypeText;
    case 'password':
      return _$declarativeFormFieldTypePassword;
    case 'email':
      return _$declarativeFormFieldTypeEmail;
    case 'tel':
      return _$declarativeFormFieldTypeTel;
    case 'url':
      return _$declarativeFormFieldTypeUrl;
    case 'number':
      return _$declarativeFormFieldTypeNumber;
    case 'checkbox':
      return _$declarativeFormFieldTypeCheckbox;
    case 'multiCheckbox':
      return _$declarativeFormFieldTypeMultiCheckbox;
    case 'radio':
      return _$declarativeFormFieldTypeRadio;
    case 'select':
      return _$declarativeFormFieldTypeSelect;
    case 'multiSelect':
      return _$declarativeFormFieldTypeMultiSelect;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DeclarativeFormField_Type> _$declarativeFormFieldTypeValues =
    BuiltSet<DeclarativeFormField_Type>(const <DeclarativeFormField_Type>[
  _$declarativeFormFieldTypeText,
  _$declarativeFormFieldTypePassword,
  _$declarativeFormFieldTypeEmail,
  _$declarativeFormFieldTypeTel,
  _$declarativeFormFieldTypeUrl,
  _$declarativeFormFieldTypeNumber,
  _$declarativeFormFieldTypeCheckbox,
  _$declarativeFormFieldTypeMultiCheckbox,
  _$declarativeFormFieldTypeRadio,
  _$declarativeFormFieldTypeSelect,
  _$declarativeFormFieldTypeMultiSelect,
]);

Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<DeclarativeSettingsSetValueResponseApplicationJson_Ocs>
    _$declarativeSettingsSetValueResponseApplicationJsonOcsSerializer =
    _$DeclarativeSettingsSetValueResponseApplicationJson_OcsSerializer();
Serializer<DeclarativeSettingsSetValueResponseApplicationJson>
    _$declarativeSettingsSetValueResponseApplicationJsonSerializer =
    _$DeclarativeSettingsSetValueResponseApplicationJsonSerializer();
Serializer<DeclarativeFormField_Options1> _$declarativeFormFieldOptions1Serializer =
    _$DeclarativeFormField_Options1Serializer();
Serializer<DeclarativeFormField> _$declarativeFormFieldSerializer = _$DeclarativeFormFieldSerializer();
Serializer<DeclarativeForm> _$declarativeFormSerializer = _$DeclarativeFormSerializer();
Serializer<DeclarativeSettingsGetFormsResponseApplicationJson_Ocs>
    _$declarativeSettingsGetFormsResponseApplicationJsonOcsSerializer =
    _$DeclarativeSettingsGetFormsResponseApplicationJson_OcsSerializer();
Serializer<DeclarativeSettingsGetFormsResponseApplicationJson>
    _$declarativeSettingsGetFormsResponseApplicationJsonSerializer =
    _$DeclarativeSettingsGetFormsResponseApplicationJsonSerializer();
Serializer<LogSettingsLogSettingsDownloadHeaders> _$logSettingsLogSettingsDownloadHeadersSerializer =
    _$LogSettingsLogSettingsDownloadHeadersSerializer();

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  @override
  final Iterable<Type> types = const [OCSMeta, _$OCSMeta];
  @override
  final String wireName = 'OCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, OCSMeta object,
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
  OCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OCSMetaBuilder();

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

class _$DeclarativeSettingsSetValueResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DeclarativeSettingsSetValueResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DeclarativeSettingsSetValueResponseApplicationJson_Ocs,
    _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DeclarativeSettingsSetValueResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeSettingsSetValueResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  DeclarativeSettingsSetValueResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta);
          break;
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$DeclarativeSettingsSetValueResponseApplicationJsonSerializer
    implements StructuredSerializer<DeclarativeSettingsSetValueResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    DeclarativeSettingsSetValueResponseApplicationJson,
    _$DeclarativeSettingsSetValueResponseApplicationJson
  ];
  @override
  final String wireName = 'DeclarativeSettingsSetValueResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeSettingsSetValueResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(DeclarativeSettingsSetValueResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DeclarativeSettingsSetValueResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeSettingsSetValueResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DeclarativeSettingsSetValueResponseApplicationJson_Ocs))!
              as DeclarativeSettingsSetValueResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$DeclarativeFormField_Options1Serializer implements StructuredSerializer<DeclarativeFormField_Options1> {
  @override
  final Iterable<Type> types = const [DeclarativeFormField_Options1, _$DeclarativeFormField_Options1];
  @override
  final String wireName = 'DeclarativeFormField_Options1';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeFormField_Options1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  DeclarativeFormField_Options1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeFormField_Options1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$DeclarativeFormFieldSerializer implements StructuredSerializer<DeclarativeFormField> {
  @override
  final Iterable<Type> types = const [DeclarativeFormField, _$DeclarativeFormField];
  @override
  final String wireName = 'DeclarativeFormField';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeFormField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(DeclarativeFormField_Type)),
      'default',
      serializers.serialize(object.$default, specifiedType: const FullType(JsonObject)),
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(DeclarativeFormField_Value)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.placeholder;
    if (value != null) {
      result
        ..add('placeholder')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.label;
    if (value != null) {
      result
        ..add('label')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.options;
    if (value != null) {
      result
        ..add('options')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(DeclarativeFormField_Options)])));
    }
    return result;
  }

  @override
  DeclarativeFormField deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeFormFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(DeclarativeFormField_Type))!
              as DeclarativeFormField_Type;
          break;
        case 'placeholder':
          result.placeholder = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.$default = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'options':
          result.options.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(DeclarativeFormField_Options)]))!
              as BuiltList<Object?>);
          break;
        case 'value':
          result.value = serializers.deserialize(value, specifiedType: const FullType(DeclarativeFormField_Value))!
              as DeclarativeFormField_Value;
          break;
      }
    }

    return result.build();
  }
}

class _$DeclarativeFormSerializer implements StructuredSerializer<DeclarativeForm> {
  @override
  final Iterable<Type> types = const [DeclarativeForm, _$DeclarativeForm];
  @override
  final String wireName = 'DeclarativeForm';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'priority',
      serializers.serialize(object.priority, specifiedType: const FullType(int)),
      'section_type',
      serializers.serialize(object.sectionType, specifiedType: const FullType(DeclarativeForm_SectionType)),
      'section_id',
      serializers.serialize(object.sectionId, specifiedType: const FullType(String)),
      'storage_type',
      serializers.serialize(object.storageType, specifiedType: const FullType(DeclarativeForm_StorageType)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'app',
      serializers.serialize(object.app, specifiedType: const FullType(String)),
      'fields',
      serializers.serialize(object.fields, specifiedType: const FullType(BuiltList, [FullType(DeclarativeFormField)])),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.docUrl;
    if (value != null) {
      result
        ..add('doc_url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DeclarativeForm deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'section_type':
          result.sectionType = serializers.deserialize(value,
              specifiedType: const FullType(DeclarativeForm_SectionType))! as DeclarativeForm_SectionType;
          break;
        case 'section_id':
          result.sectionId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'storage_type':
          result.storageType = serializers.deserialize(value,
              specifiedType: const FullType(DeclarativeForm_StorageType))! as DeclarativeForm_StorageType;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_url':
          result.docUrl = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(DeclarativeFormField)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DeclarativeSettingsGetFormsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DeclarativeSettingsGetFormsResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DeclarativeSettingsGetFormsResponseApplicationJson_Ocs,
    _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DeclarativeSettingsGetFormsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeSettingsGetFormsResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(DeclarativeForm)])),
    ];

    return result;
  }

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(DeclarativeForm)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DeclarativeSettingsGetFormsResponseApplicationJsonSerializer
    implements StructuredSerializer<DeclarativeSettingsGetFormsResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    DeclarativeSettingsGetFormsResponseApplicationJson,
    _$DeclarativeSettingsGetFormsResponseApplicationJson
  ];
  @override
  final String wireName = 'DeclarativeSettingsGetFormsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeclarativeSettingsGetFormsResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(DeclarativeSettingsGetFormsResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeclarativeSettingsGetFormsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DeclarativeSettingsGetFormsResponseApplicationJson_Ocs))!
              as DeclarativeSettingsGetFormsResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$LogSettingsLogSettingsDownloadHeadersSerializer
    implements StructuredSerializer<LogSettingsLogSettingsDownloadHeaders> {
  @override
  final Iterable<Type> types = const [LogSettingsLogSettingsDownloadHeaders, _$LogSettingsLogSettingsDownloadHeaders];
  @override
  final String wireName = 'LogSettingsLogSettingsDownloadHeaders';

  @override
  Iterable<Object?> serialize(Serializers serializers, LogSettingsLogSettingsDownloadHeaders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.contentDisposition;
    if (value != null) {
      result
        ..add('content-disposition')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LogSettingsLogSettingsDownloadHeaders deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = LogSettingsLogSettingsDownloadHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content-disposition':
          result.contentDisposition = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $OCSMetaInterfaceBuilder {
  void replace($OCSMetaInterface other);
  void update(void Function($OCSMetaInterfaceBuilder) updates);
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

class _$OCSMeta extends OCSMeta {
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

  factory _$OCSMeta([void Function(OCSMetaBuilder)? updates]) => (OCSMetaBuilder()..update(updates))._build();

  _$OCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode');
  }

  @override
  OCSMeta rebuild(void Function(OCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OCSMetaBuilder toBuilder() => OCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OCSMeta &&
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
    return (newBuiltValueToStringHelper(r'OCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class OCSMetaBuilder implements Builder<OCSMeta, OCSMetaBuilder>, $OCSMetaInterfaceBuilder {
  _$OCSMeta? _$v;

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

  OCSMetaBuilder() {
    OCSMeta._defaults(this);
  }

  OCSMetaBuilder get _$this {
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
  void replace(covariant OCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OCSMeta;
  }

  @override
  void update(void Function(OCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OCSMeta build() => _build();

  _$OCSMeta _build() {
    OCSMeta._validate(this);
    final _$result = _$v ??
        _$OCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeSettingsSetValueResponseApplicationJson_OcsInterfaceBuilder {
  void replace($DeclarativeSettingsSetValueResponseApplicationJson_OcsInterface other);
  void update(void Function($DeclarativeSettingsSetValueResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs
    extends DeclarativeSettingsSetValueResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject? data;

  factory _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs(
          [void Function(DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder)? updates]) =>
      (DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs._({required this.meta, this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DeclarativeSettingsSetValueResponseApplicationJson_Ocs', 'meta');
  }

  @override
  DeclarativeSettingsSetValueResponseApplicationJson_Ocs rebuild(
          void Function(DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder toBuilder() =>
      DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeclarativeSettingsSetValueResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DeclarativeSettingsSetValueResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder
    implements
        Builder<DeclarativeSettingsSetValueResponseApplicationJson_Ocs,
            DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder>,
        $DeclarativeSettingsSetValueResponseApplicationJson_OcsInterfaceBuilder {
  _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder() {
    DeclarativeSettingsSetValueResponseApplicationJson_Ocs._defaults(this);
  }

  DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeSettingsSetValueResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeSettingsSetValueResponseApplicationJson_Ocs build() => _build();

  _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs _build() {
    DeclarativeSettingsSetValueResponseApplicationJson_Ocs._validate(this);
    _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DeclarativeSettingsSetValueResponseApplicationJson_Ocs._(meta: meta.build(), data: data);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DeclarativeSettingsSetValueResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeSettingsSetValueResponseApplicationJsonInterfaceBuilder {
  void replace($DeclarativeSettingsSetValueResponseApplicationJsonInterface other);
  void update(void Function($DeclarativeSettingsSetValueResponseApplicationJsonInterfaceBuilder) updates);
  DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder? ocs);
}

class _$DeclarativeSettingsSetValueResponseApplicationJson extends DeclarativeSettingsSetValueResponseApplicationJson {
  @override
  final DeclarativeSettingsSetValueResponseApplicationJson_Ocs ocs;

  factory _$DeclarativeSettingsSetValueResponseApplicationJson(
          [void Function(DeclarativeSettingsSetValueResponseApplicationJsonBuilder)? updates]) =>
      (DeclarativeSettingsSetValueResponseApplicationJsonBuilder()..update(updates))._build();

  _$DeclarativeSettingsSetValueResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DeclarativeSettingsSetValueResponseApplicationJson', 'ocs');
  }

  @override
  DeclarativeSettingsSetValueResponseApplicationJson rebuild(
          void Function(DeclarativeSettingsSetValueResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeclarativeSettingsSetValueResponseApplicationJsonBuilder toBuilder() =>
      DeclarativeSettingsSetValueResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeclarativeSettingsSetValueResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DeclarativeSettingsSetValueResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class DeclarativeSettingsSetValueResponseApplicationJsonBuilder
    implements
        Builder<DeclarativeSettingsSetValueResponseApplicationJson,
            DeclarativeSettingsSetValueResponseApplicationJsonBuilder>,
        $DeclarativeSettingsSetValueResponseApplicationJsonInterfaceBuilder {
  _$DeclarativeSettingsSetValueResponseApplicationJson? _$v;

  DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder? _ocs;
  DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder();
  set ocs(covariant DeclarativeSettingsSetValueResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DeclarativeSettingsSetValueResponseApplicationJsonBuilder() {
    DeclarativeSettingsSetValueResponseApplicationJson._defaults(this);
  }

  DeclarativeSettingsSetValueResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeSettingsSetValueResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeSettingsSetValueResponseApplicationJson;
  }

  @override
  void update(void Function(DeclarativeSettingsSetValueResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeSettingsSetValueResponseApplicationJson build() => _build();

  _$DeclarativeSettingsSetValueResponseApplicationJson _build() {
    DeclarativeSettingsSetValueResponseApplicationJson._validate(this);
    _$DeclarativeSettingsSetValueResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DeclarativeSettingsSetValueResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DeclarativeSettingsSetValueResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeFormField_Options1InterfaceBuilder {
  void replace($DeclarativeFormField_Options1Interface other);
  void update(void Function($DeclarativeFormField_Options1InterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  JsonObject? get value;
  set value(JsonObject? value);
}

class _$DeclarativeFormField_Options1 extends DeclarativeFormField_Options1 {
  @override
  final String name;
  @override
  final JsonObject value;

  factory _$DeclarativeFormField_Options1([void Function(DeclarativeFormField_Options1Builder)? updates]) =>
      (DeclarativeFormField_Options1Builder()..update(updates))._build();

  _$DeclarativeFormField_Options1._({required this.name, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'DeclarativeFormField_Options1', 'name');
    BuiltValueNullFieldError.checkNotNull(value, r'DeclarativeFormField_Options1', 'value');
  }

  @override
  DeclarativeFormField_Options1 rebuild(void Function(DeclarativeFormField_Options1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeclarativeFormField_Options1Builder toBuilder() => DeclarativeFormField_Options1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeclarativeFormField_Options1 && name == other.name && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeclarativeFormField_Options1')
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class DeclarativeFormField_Options1Builder
    implements
        Builder<DeclarativeFormField_Options1, DeclarativeFormField_Options1Builder>,
        $DeclarativeFormField_Options1InterfaceBuilder {
  _$DeclarativeFormField_Options1? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  JsonObject? _value;
  JsonObject? get value => _$this._value;
  set value(covariant JsonObject? value) => _$this._value = value;

  DeclarativeFormField_Options1Builder() {
    DeclarativeFormField_Options1._defaults(this);
  }

  DeclarativeFormField_Options1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeFormField_Options1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeFormField_Options1;
  }

  @override
  void update(void Function(DeclarativeFormField_Options1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeFormField_Options1 build() => _build();

  _$DeclarativeFormField_Options1 _build() {
    DeclarativeFormField_Options1._validate(this);
    final _$result = _$v ??
        _$DeclarativeFormField_Options1._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'DeclarativeFormField_Options1', 'name'),
            value: BuiltValueNullFieldError.checkNotNull(value, r'DeclarativeFormField_Options1', 'value'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeFormFieldInterfaceBuilder {
  void replace($DeclarativeFormFieldInterface other);
  void update(void Function($DeclarativeFormFieldInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get title;
  set title(String? title);

  String? get description;
  set description(String? description);

  DeclarativeFormField_Type? get type;
  set type(DeclarativeFormField_Type? type);

  String? get placeholder;
  set placeholder(String? placeholder);

  String? get label;
  set label(String? label);

  JsonObject? get $default;
  set $default(JsonObject? $default);

  ListBuilder<DeclarativeFormField_Options> get options;
  set options(ListBuilder<DeclarativeFormField_Options>? options);

  DeclarativeFormField_Value? get value;
  set value(DeclarativeFormField_Value? value);
}

class _$DeclarativeFormField extends DeclarativeFormField {
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DeclarativeFormField_Type type;
  @override
  final String? placeholder;
  @override
  final String? label;
  @override
  final JsonObject $default;
  @override
  final BuiltList<DeclarativeFormField_Options>? options;
  @override
  final DeclarativeFormField_Value value;

  factory _$DeclarativeFormField([void Function(DeclarativeFormFieldBuilder)? updates]) =>
      (DeclarativeFormFieldBuilder()..update(updates))._build();

  _$DeclarativeFormField._(
      {required this.id,
      required this.title,
      this.description,
      required this.type,
      this.placeholder,
      this.label,
      required this.$default,
      this.options,
      required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeclarativeFormField', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'DeclarativeFormField', 'title');
    BuiltValueNullFieldError.checkNotNull(type, r'DeclarativeFormField', 'type');
    BuiltValueNullFieldError.checkNotNull($default, r'DeclarativeFormField', '\$default');
    BuiltValueNullFieldError.checkNotNull(value, r'DeclarativeFormField', 'value');
  }

  @override
  DeclarativeFormField rebuild(void Function(DeclarativeFormFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeclarativeFormFieldBuilder toBuilder() => DeclarativeFormFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is DeclarativeFormField &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        type == other.type &&
        placeholder == other.placeholder &&
        label == other.label &&
        $default == other.$default &&
        options == _$dynamicOther.options &&
        value == _$dynamicOther.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, placeholder.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, $default.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeclarativeFormField')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('type', type)
          ..add('placeholder', placeholder)
          ..add('label', label)
          ..add('\$default', $default)
          ..add('options', options)
          ..add('value', value))
        .toString();
  }
}

class DeclarativeFormFieldBuilder
    implements Builder<DeclarativeFormField, DeclarativeFormFieldBuilder>, $DeclarativeFormFieldInterfaceBuilder {
  _$DeclarativeFormField? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  DeclarativeFormField_Type? _type;
  DeclarativeFormField_Type? get type => _$this._type;
  set type(covariant DeclarativeFormField_Type? type) => _$this._type = type;

  String? _placeholder;
  String? get placeholder => _$this._placeholder;
  set placeholder(covariant String? placeholder) => _$this._placeholder = placeholder;

  String? _label;
  String? get label => _$this._label;
  set label(covariant String? label) => _$this._label = label;

  JsonObject? _$default;
  JsonObject? get $default => _$this._$default;
  set $default(covariant JsonObject? $default) => _$this._$default = $default;

  ListBuilder<DeclarativeFormField_Options>? _options;
  ListBuilder<DeclarativeFormField_Options> get options =>
      _$this._options ??= ListBuilder<DeclarativeFormField_Options>();
  set options(covariant ListBuilder<DeclarativeFormField_Options>? options) => _$this._options = options;

  DeclarativeFormField_Value? _value;
  DeclarativeFormField_Value? get value => _$this._value;
  set value(covariant DeclarativeFormField_Value? value) => _$this._value = value;

  DeclarativeFormFieldBuilder() {
    DeclarativeFormField._defaults(this);
  }

  DeclarativeFormFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _type = $v.type;
      _placeholder = $v.placeholder;
      _label = $v.label;
      _$default = $v.$default;
      _options = $v.options?.toBuilder();
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeFormField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeFormField;
  }

  @override
  void update(void Function(DeclarativeFormFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeFormField build() => _build();

  _$DeclarativeFormField _build() {
    DeclarativeFormField._validate(this);
    _$DeclarativeFormField _$result;
    try {
      _$result = _$v ??
          _$DeclarativeFormField._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'DeclarativeFormField', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'DeclarativeFormField', 'title'),
              description: description,
              type: BuiltValueNullFieldError.checkNotNull(type, r'DeclarativeFormField', 'type'),
              placeholder: placeholder,
              label: label,
              $default: BuiltValueNullFieldError.checkNotNull($default, r'DeclarativeFormField', '\$default'),
              options: _options?.build(),
              value: BuiltValueNullFieldError.checkNotNull(value, r'DeclarativeFormField', 'value'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DeclarativeFormField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeFormInterfaceBuilder {
  void replace($DeclarativeFormInterface other);
  void update(void Function($DeclarativeFormInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  int? get priority;
  set priority(int? priority);

  DeclarativeForm_SectionType? get sectionType;
  set sectionType(DeclarativeForm_SectionType? sectionType);

  String? get sectionId;
  set sectionId(String? sectionId);

  DeclarativeForm_StorageType? get storageType;
  set storageType(DeclarativeForm_StorageType? storageType);

  String? get title;
  set title(String? title);

  String? get description;
  set description(String? description);

  String? get docUrl;
  set docUrl(String? docUrl);

  String? get app;
  set app(String? app);

  ListBuilder<DeclarativeFormField> get fields;
  set fields(ListBuilder<DeclarativeFormField>? fields);
}

class _$DeclarativeForm extends DeclarativeForm {
  @override
  final String id;
  @override
  final int priority;
  @override
  final DeclarativeForm_SectionType sectionType;
  @override
  final String sectionId;
  @override
  final DeclarativeForm_StorageType storageType;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? docUrl;
  @override
  final String app;
  @override
  final BuiltList<DeclarativeFormField> fields;

  factory _$DeclarativeForm([void Function(DeclarativeFormBuilder)? updates]) =>
      (DeclarativeFormBuilder()..update(updates))._build();

  _$DeclarativeForm._(
      {required this.id,
      required this.priority,
      required this.sectionType,
      required this.sectionId,
      required this.storageType,
      required this.title,
      this.description,
      this.docUrl,
      required this.app,
      required this.fields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DeclarativeForm', 'id');
    BuiltValueNullFieldError.checkNotNull(priority, r'DeclarativeForm', 'priority');
    BuiltValueNullFieldError.checkNotNull(sectionType, r'DeclarativeForm', 'sectionType');
    BuiltValueNullFieldError.checkNotNull(sectionId, r'DeclarativeForm', 'sectionId');
    BuiltValueNullFieldError.checkNotNull(storageType, r'DeclarativeForm', 'storageType');
    BuiltValueNullFieldError.checkNotNull(title, r'DeclarativeForm', 'title');
    BuiltValueNullFieldError.checkNotNull(app, r'DeclarativeForm', 'app');
    BuiltValueNullFieldError.checkNotNull(fields, r'DeclarativeForm', 'fields');
  }

  @override
  DeclarativeForm rebuild(void Function(DeclarativeFormBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DeclarativeFormBuilder toBuilder() => DeclarativeFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeclarativeForm &&
        id == other.id &&
        priority == other.priority &&
        sectionType == other.sectionType &&
        sectionId == other.sectionId &&
        storageType == other.storageType &&
        title == other.title &&
        description == other.description &&
        docUrl == other.docUrl &&
        app == other.app &&
        fields == other.fields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, sectionType.hashCode);
    _$hash = $jc(_$hash, sectionId.hashCode);
    _$hash = $jc(_$hash, storageType.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, docUrl.hashCode);
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeclarativeForm')
          ..add('id', id)
          ..add('priority', priority)
          ..add('sectionType', sectionType)
          ..add('sectionId', sectionId)
          ..add('storageType', storageType)
          ..add('title', title)
          ..add('description', description)
          ..add('docUrl', docUrl)
          ..add('app', app)
          ..add('fields', fields))
        .toString();
  }
}

class DeclarativeFormBuilder
    implements Builder<DeclarativeForm, DeclarativeFormBuilder>, $DeclarativeFormInterfaceBuilder {
  _$DeclarativeForm? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  int? _priority;
  int? get priority => _$this._priority;
  set priority(covariant int? priority) => _$this._priority = priority;

  DeclarativeForm_SectionType? _sectionType;
  DeclarativeForm_SectionType? get sectionType => _$this._sectionType;
  set sectionType(covariant DeclarativeForm_SectionType? sectionType) => _$this._sectionType = sectionType;

  String? _sectionId;
  String? get sectionId => _$this._sectionId;
  set sectionId(covariant String? sectionId) => _$this._sectionId = sectionId;

  DeclarativeForm_StorageType? _storageType;
  DeclarativeForm_StorageType? get storageType => _$this._storageType;
  set storageType(covariant DeclarativeForm_StorageType? storageType) => _$this._storageType = storageType;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  String? _docUrl;
  String? get docUrl => _$this._docUrl;
  set docUrl(covariant String? docUrl) => _$this._docUrl = docUrl;

  String? _app;
  String? get app => _$this._app;
  set app(covariant String? app) => _$this._app = app;

  ListBuilder<DeclarativeFormField>? _fields;
  ListBuilder<DeclarativeFormField> get fields => _$this._fields ??= ListBuilder<DeclarativeFormField>();
  set fields(covariant ListBuilder<DeclarativeFormField>? fields) => _$this._fields = fields;

  DeclarativeFormBuilder() {
    DeclarativeForm._defaults(this);
  }

  DeclarativeFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _priority = $v.priority;
      _sectionType = $v.sectionType;
      _sectionId = $v.sectionId;
      _storageType = $v.storageType;
      _title = $v.title;
      _description = $v.description;
      _docUrl = $v.docUrl;
      _app = $v.app;
      _fields = $v.fields.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeForm;
  }

  @override
  void update(void Function(DeclarativeFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeForm build() => _build();

  _$DeclarativeForm _build() {
    DeclarativeForm._validate(this);
    _$DeclarativeForm _$result;
    try {
      _$result = _$v ??
          _$DeclarativeForm._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'DeclarativeForm', 'id'),
              priority: BuiltValueNullFieldError.checkNotNull(priority, r'DeclarativeForm', 'priority'),
              sectionType: BuiltValueNullFieldError.checkNotNull(sectionType, r'DeclarativeForm', 'sectionType'),
              sectionId: BuiltValueNullFieldError.checkNotNull(sectionId, r'DeclarativeForm', 'sectionId'),
              storageType: BuiltValueNullFieldError.checkNotNull(storageType, r'DeclarativeForm', 'storageType'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'DeclarativeForm', 'title'),
              description: description,
              docUrl: docUrl,
              app: BuiltValueNullFieldError.checkNotNull(app, r'DeclarativeForm', 'app'),
              fields: fields.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DeclarativeForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeSettingsGetFormsResponseApplicationJson_OcsInterfaceBuilder {
  void replace($DeclarativeSettingsGetFormsResponseApplicationJson_OcsInterface other);
  void update(void Function($DeclarativeSettingsGetFormsResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<DeclarativeForm> get data;
  set data(ListBuilder<DeclarativeForm>? data);
}

class _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs
    extends DeclarativeSettingsGetFormsResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<DeclarativeForm> data;

  factory _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs(
          [void Function(DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder)? updates]) =>
      (DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DeclarativeSettingsGetFormsResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DeclarativeSettingsGetFormsResponseApplicationJson_Ocs', 'data');
  }

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson_Ocs rebuild(
          void Function(DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder toBuilder() =>
      DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeclarativeSettingsGetFormsResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DeclarativeSettingsGetFormsResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder
    implements
        Builder<DeclarativeSettingsGetFormsResponseApplicationJson_Ocs,
            DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder>,
        $DeclarativeSettingsGetFormsResponseApplicationJson_OcsInterfaceBuilder {
  _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<DeclarativeForm>? _data;
  ListBuilder<DeclarativeForm> get data => _$this._data ??= ListBuilder<DeclarativeForm>();
  set data(covariant ListBuilder<DeclarativeForm>? data) => _$this._data = data;

  DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder() {
    DeclarativeSettingsGetFormsResponseApplicationJson_Ocs._defaults(this);
  }

  DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeSettingsGetFormsResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson_Ocs build() => _build();

  _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs _build() {
    DeclarativeSettingsGetFormsResponseApplicationJson_Ocs._validate(this);
    _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$DeclarativeSettingsGetFormsResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DeclarativeSettingsGetFormsResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeclarativeSettingsGetFormsResponseApplicationJsonInterfaceBuilder {
  void replace($DeclarativeSettingsGetFormsResponseApplicationJsonInterface other);
  void update(void Function($DeclarativeSettingsGetFormsResponseApplicationJsonInterfaceBuilder) updates);
  DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder? ocs);
}

class _$DeclarativeSettingsGetFormsResponseApplicationJson extends DeclarativeSettingsGetFormsResponseApplicationJson {
  @override
  final DeclarativeSettingsGetFormsResponseApplicationJson_Ocs ocs;

  factory _$DeclarativeSettingsGetFormsResponseApplicationJson(
          [void Function(DeclarativeSettingsGetFormsResponseApplicationJsonBuilder)? updates]) =>
      (DeclarativeSettingsGetFormsResponseApplicationJsonBuilder()..update(updates))._build();

  _$DeclarativeSettingsGetFormsResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DeclarativeSettingsGetFormsResponseApplicationJson', 'ocs');
  }

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson rebuild(
          void Function(DeclarativeSettingsGetFormsResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeclarativeSettingsGetFormsResponseApplicationJsonBuilder toBuilder() =>
      DeclarativeSettingsGetFormsResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeclarativeSettingsGetFormsResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DeclarativeSettingsGetFormsResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class DeclarativeSettingsGetFormsResponseApplicationJsonBuilder
    implements
        Builder<DeclarativeSettingsGetFormsResponseApplicationJson,
            DeclarativeSettingsGetFormsResponseApplicationJsonBuilder>,
        $DeclarativeSettingsGetFormsResponseApplicationJsonInterfaceBuilder {
  _$DeclarativeSettingsGetFormsResponseApplicationJson? _$v;

  DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder? _ocs;
  DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder();
  set ocs(covariant DeclarativeSettingsGetFormsResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DeclarativeSettingsGetFormsResponseApplicationJsonBuilder() {
    DeclarativeSettingsGetFormsResponseApplicationJson._defaults(this);
  }

  DeclarativeSettingsGetFormsResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeclarativeSettingsGetFormsResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeclarativeSettingsGetFormsResponseApplicationJson;
  }

  @override
  void update(void Function(DeclarativeSettingsGetFormsResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeclarativeSettingsGetFormsResponseApplicationJson build() => _build();

  _$DeclarativeSettingsGetFormsResponseApplicationJson _build() {
    DeclarativeSettingsGetFormsResponseApplicationJson._validate(this);
    _$DeclarativeSettingsGetFormsResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DeclarativeSettingsGetFormsResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DeclarativeSettingsGetFormsResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $LogSettingsLogSettingsDownloadHeadersInterfaceBuilder {
  void replace($LogSettingsLogSettingsDownloadHeadersInterface other);
  void update(void Function($LogSettingsLogSettingsDownloadHeadersInterfaceBuilder) updates);
  String? get contentDisposition;
  set contentDisposition(String? contentDisposition);
}

class _$LogSettingsLogSettingsDownloadHeaders extends LogSettingsLogSettingsDownloadHeaders {
  @override
  final String? contentDisposition;

  factory _$LogSettingsLogSettingsDownloadHeaders(
          [void Function(LogSettingsLogSettingsDownloadHeadersBuilder)? updates]) =>
      (LogSettingsLogSettingsDownloadHeadersBuilder()..update(updates))._build();

  _$LogSettingsLogSettingsDownloadHeaders._({this.contentDisposition}) : super._();

  @override
  LogSettingsLogSettingsDownloadHeaders rebuild(void Function(LogSettingsLogSettingsDownloadHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogSettingsLogSettingsDownloadHeadersBuilder toBuilder() =>
      LogSettingsLogSettingsDownloadHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogSettingsLogSettingsDownloadHeaders && contentDisposition == other.contentDisposition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentDisposition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogSettingsLogSettingsDownloadHeaders')
          ..add('contentDisposition', contentDisposition))
        .toString();
  }
}

class LogSettingsLogSettingsDownloadHeadersBuilder
    implements
        Builder<LogSettingsLogSettingsDownloadHeaders, LogSettingsLogSettingsDownloadHeadersBuilder>,
        $LogSettingsLogSettingsDownloadHeadersInterfaceBuilder {
  _$LogSettingsLogSettingsDownloadHeaders? _$v;

  String? _contentDisposition;
  String? get contentDisposition => _$this._contentDisposition;
  set contentDisposition(covariant String? contentDisposition) => _$this._contentDisposition = contentDisposition;

  LogSettingsLogSettingsDownloadHeadersBuilder() {
    LogSettingsLogSettingsDownloadHeaders._defaults(this);
  }

  LogSettingsLogSettingsDownloadHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentDisposition = $v.contentDisposition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LogSettingsLogSettingsDownloadHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogSettingsLogSettingsDownloadHeaders;
  }

  @override
  void update(void Function(LogSettingsLogSettingsDownloadHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogSettingsLogSettingsDownloadHeaders build() => _build();

  _$LogSettingsLogSettingsDownloadHeaders _build() {
    LogSettingsLogSettingsDownloadHeaders._validate(this);
    final _$result = _$v ?? _$LogSettingsLogSettingsDownloadHeaders._(contentDisposition: contentDisposition);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
