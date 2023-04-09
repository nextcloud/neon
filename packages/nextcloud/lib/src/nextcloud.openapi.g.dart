// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NextcloudNotesSettings_NoteMode _$nextcloudNotesSettingsNoteModeEdit = NextcloudNotesSettings_NoteMode._('edit');
const NextcloudNotesSettings_NoteMode _$nextcloudNotesSettingsNoteModePreview =
    NextcloudNotesSettings_NoteMode._('preview');
const NextcloudNotesSettings_NoteMode _$nextcloudNotesSettingsNoteModeRich = NextcloudNotesSettings_NoteMode._('rich');

NextcloudNotesSettings_NoteMode _$valueOfNextcloudNotesSettings_NoteMode(String name) {
  switch (name) {
    case 'edit':
      return _$nextcloudNotesSettingsNoteModeEdit;
    case 'preview':
      return _$nextcloudNotesSettingsNoteModePreview;
    case 'rich':
      return _$nextcloudNotesSettingsNoteModeRich;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudNotesSettings_NoteMode> _$nextcloudNotesSettingsNoteModeValues =
    BuiltSet<NextcloudNotesSettings_NoteMode>(const <NextcloudNotesSettings_NoteMode>[
  _$nextcloudNotesSettingsNoteModeEdit,
  _$nextcloudNotesSettingsNoteModePreview,
  _$nextcloudNotesSettingsNoteModeRich,
]);

const NextcloudUserStatusClearAt_Type _$nextcloudUserStatusClearAtTypePeriod =
    NextcloudUserStatusClearAt_Type._('period');
const NextcloudUserStatusClearAt_Type _$nextcloudUserStatusClearAtTypeEndOf =
    NextcloudUserStatusClearAt_Type._('endOf');

NextcloudUserStatusClearAt_Type _$valueOfNextcloudUserStatusClearAt_Type(String name) {
  switch (name) {
    case 'period':
      return _$nextcloudUserStatusClearAtTypePeriod;
    case 'endOf':
      return _$nextcloudUserStatusClearAtTypeEndOf;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudUserStatusClearAt_Type> _$nextcloudUserStatusClearAtTypeValues =
    BuiltSet<NextcloudUserStatusClearAt_Type>(const <NextcloudUserStatusClearAt_Type>[
  _$nextcloudUserStatusClearAtTypePeriod,
  _$nextcloudUserStatusClearAtTypeEndOf,
]);

const NextcloudUserStatusClearAt_Time0 _$nextcloudUserStatusClearAtTime0Day = NextcloudUserStatusClearAt_Time0._('day');
const NextcloudUserStatusClearAt_Time0 _$nextcloudUserStatusClearAtTime0Week =
    NextcloudUserStatusClearAt_Time0._('week');

NextcloudUserStatusClearAt_Time0 _$valueOfNextcloudUserStatusClearAt_Time0(String name) {
  switch (name) {
    case 'day':
      return _$nextcloudUserStatusClearAtTime0Day;
    case 'week':
      return _$nextcloudUserStatusClearAtTime0Week;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudUserStatusClearAt_Time0> _$nextcloudUserStatusClearAtTime0Values =
    BuiltSet<NextcloudUserStatusClearAt_Time0>(const <NextcloudUserStatusClearAt_Time0>[
  _$nextcloudUserStatusClearAtTime0Day,
  _$nextcloudUserStatusClearAtTime0Week,
]);

const NextcloudUserStatusType _$nextcloudUserStatusTypeOnline = NextcloudUserStatusType._('online');
const NextcloudUserStatusType _$nextcloudUserStatusTypeOffline = NextcloudUserStatusType._('offline');
const NextcloudUserStatusType _$nextcloudUserStatusTypeDnd = NextcloudUserStatusType._('dnd');
const NextcloudUserStatusType _$nextcloudUserStatusTypeAway = NextcloudUserStatusType._('away');
const NextcloudUserStatusType _$nextcloudUserStatusTypeInvisible = NextcloudUserStatusType._('invisible');

NextcloudUserStatusType _$valueOfNextcloudUserStatusType(String name) {
  switch (name) {
    case 'online':
      return _$nextcloudUserStatusTypeOnline;
    case 'offline':
      return _$nextcloudUserStatusTypeOffline;
    case 'dnd':
      return _$nextcloudUserStatusTypeDnd;
    case 'away':
      return _$nextcloudUserStatusTypeAway;
    case 'invisible':
      return _$nextcloudUserStatusTypeInvisible;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudUserStatusType> _$nextcloudUserStatusTypeValues =
    BuiltSet<NextcloudUserStatusType>(const <NextcloudUserStatusType>[
  _$nextcloudUserStatusTypeOnline,
  _$nextcloudUserStatusTypeOffline,
  _$nextcloudUserStatusTypeDnd,
  _$nextcloudUserStatusTypeAway,
  _$nextcloudUserStatusTypeInvisible,
]);

Serializers _$serializers = (Serializers().toBuilder()).build();
Serializer<NextcloudNotesSettings_NoteMode> _$nextcloudNotesSettingsNoteModeSerializer =
    _$NextcloudNotesSettings_NoteModeSerializer();
Serializer<NextcloudUserStatusClearAt_Type> _$nextcloudUserStatusClearAtTypeSerializer =
    _$NextcloudUserStatusClearAt_TypeSerializer();
Serializer<NextcloudUserStatusClearAt_Time0> _$nextcloudUserStatusClearAtTime0Serializer =
    _$NextcloudUserStatusClearAt_Time0Serializer();
Serializer<NextcloudUserStatusType> _$nextcloudUserStatusTypeSerializer = _$NextcloudUserStatusTypeSerializer();

class _$NextcloudNotesSettings_NoteModeSerializer implements PrimitiveSerializer<NextcloudNotesSettings_NoteMode> {
  @override
  final Iterable<Type> types = const <Type>[NextcloudNotesSettings_NoteMode];
  @override
  final String wireName = 'NextcloudNotesSettings_NoteMode';

  @override
  Object serialize(Serializers serializers, NextcloudNotesSettings_NoteMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NextcloudNotesSettings_NoteMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudNotesSettings_NoteMode.valueOf(serialized as String);
}

class _$NextcloudUserStatusClearAt_TypeSerializer implements PrimitiveSerializer<NextcloudUserStatusClearAt_Type> {
  static const Map<String, Object> _toWire = <String, Object>{
    'endOf': 'end-of',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    'end-of': 'endOf',
  };

  @override
  final Iterable<Type> types = const <Type>[NextcloudUserStatusClearAt_Type];
  @override
  final String wireName = 'NextcloudUserStatusClearAt_Type';

  @override
  Object serialize(Serializers serializers, NextcloudUserStatusClearAt_Type object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  NextcloudUserStatusClearAt_Type deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudUserStatusClearAt_Type.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$NextcloudUserStatusClearAt_Time0Serializer implements PrimitiveSerializer<NextcloudUserStatusClearAt_Time0> {
  @override
  final Iterable<Type> types = const <Type>[NextcloudUserStatusClearAt_Time0];
  @override
  final String wireName = 'NextcloudUserStatusClearAt_Time0';

  @override
  Object serialize(Serializers serializers, NextcloudUserStatusClearAt_Time0 object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NextcloudUserStatusClearAt_Time0 deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudUserStatusClearAt_Time0.valueOf(serialized as String);
}

class _$NextcloudUserStatusTypeSerializer implements PrimitiveSerializer<NextcloudUserStatusType> {
  @override
  final Iterable<Type> types = const <Type>[NextcloudUserStatusType];
  @override
  final String wireName = 'NextcloudUserStatusType';

  @override
  Object serialize(Serializers serializers, NextcloudUserStatusType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NextcloudUserStatusType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudUserStatusType.valueOf(serialized as String);
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
