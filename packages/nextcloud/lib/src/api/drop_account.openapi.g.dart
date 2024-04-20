// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_account.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Capabilities_DropAccount_Delay> _$capabilitiesDropAccountDelaySerializer =
    _$Capabilities_DropAccount_DelaySerializer();
Serializer<Capabilities_DropAccount> _$capabilitiesDropAccountSerializer = _$Capabilities_DropAccountSerializer();
Serializer<Capabilities> _$capabilitiesSerializer = _$CapabilitiesSerializer();

class _$Capabilities_DropAccount_DelaySerializer implements StructuredSerializer<Capabilities_DropAccount_Delay> {
  @override
  final Iterable<Type> types = const [Capabilities_DropAccount_Delay, _$Capabilities_DropAccount_Delay];
  @override
  final String wireName = 'Capabilities_DropAccount_Delay';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_DropAccount_Delay object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'hours',
      serializers.serialize(object.hours, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Capabilities_DropAccount_Delay deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_DropAccount_DelayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'hours':
          result.hours = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Capabilities_DropAccountSerializer implements StructuredSerializer<Capabilities_DropAccount> {
  @override
  final Iterable<Type> types = const [Capabilities_DropAccount, _$Capabilities_DropAccount];
  @override
  final String wireName = 'Capabilities_DropAccount';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_DropAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'api-version',
      serializers.serialize(object.apiVersion, specifiedType: const FullType(String)),
      'delay',
      serializers.serialize(object.delay, specifiedType: const FullType(Capabilities_DropAccount_Delay)),
    ];
    Object? value;
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Capabilities_DropAccount deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_DropAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'api-version':
          result.apiVersion = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'delay':
          result.delay.replace(serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_DropAccount_Delay))! as Capabilities_DropAccount_Delay);
          break;
        case 'details':
          result.details = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  @override
  final Iterable<Type> types = const [Capabilities, _$Capabilities];
  @override
  final String wireName = 'Capabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'drop-account',
      serializers.serialize(object.dropAccount, specifiedType: const FullType(Capabilities_DropAccount)),
    ];

    return result;
  }

  @override
  Capabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'drop-account':
          result.dropAccount.replace(serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_DropAccount))! as Capabilities_DropAccount);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $Capabilities_DropAccount_DelayInterfaceBuilder {
  void replace($Capabilities_DropAccount_DelayInterface other);
  void update(void Function($Capabilities_DropAccount_DelayInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  int? get hours;
  set hours(int? hours);
}

class _$Capabilities_DropAccount_Delay extends Capabilities_DropAccount_Delay {
  @override
  final bool enabled;
  @override
  final int hours;

  factory _$Capabilities_DropAccount_Delay([void Function(Capabilities_DropAccount_DelayBuilder)? updates]) =>
      (Capabilities_DropAccount_DelayBuilder()..update(updates))._build();

  _$Capabilities_DropAccount_Delay._({required this.enabled, required this.hours}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount_Delay', 'enabled');
    BuiltValueNullFieldError.checkNotNull(hours, r'Capabilities_DropAccount_Delay', 'hours');
  }

  @override
  Capabilities_DropAccount_Delay rebuild(void Function(Capabilities_DropAccount_DelayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_DropAccount_DelayBuilder toBuilder() => Capabilities_DropAccount_DelayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_DropAccount_Delay && enabled == other.enabled && hours == other.hours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, hours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_DropAccount_Delay')
          ..add('enabled', enabled)
          ..add('hours', hours))
        .toString();
  }
}

class Capabilities_DropAccount_DelayBuilder
    implements
        Builder<Capabilities_DropAccount_Delay, Capabilities_DropAccount_DelayBuilder>,
        $Capabilities_DropAccount_DelayInterfaceBuilder {
  _$Capabilities_DropAccount_Delay? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  int? _hours;
  int? get hours => _$this._hours;
  set hours(covariant int? hours) => _$this._hours = hours;

  Capabilities_DropAccount_DelayBuilder() {
    Capabilities_DropAccount_Delay._defaults(this);
  }

  Capabilities_DropAccount_DelayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _hours = $v.hours;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_DropAccount_Delay other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_DropAccount_Delay;
  }

  @override
  void update(void Function(Capabilities_DropAccount_DelayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_DropAccount_Delay build() => _build();

  _$Capabilities_DropAccount_Delay _build() {
    Capabilities_DropAccount_Delay._validate(this);
    final _$result = _$v ??
        _$Capabilities_DropAccount_Delay._(
            enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount_Delay', 'enabled'),
            hours: BuiltValueNullFieldError.checkNotNull(hours, r'Capabilities_DropAccount_Delay', 'hours'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Capabilities_DropAccountInterfaceBuilder {
  void replace($Capabilities_DropAccountInterface other);
  void update(void Function($Capabilities_DropAccountInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  String? get apiVersion;
  set apiVersion(String? apiVersion);

  Capabilities_DropAccount_DelayBuilder get delay;
  set delay(Capabilities_DropAccount_DelayBuilder? delay);

  String? get details;
  set details(String? details);
}

class _$Capabilities_DropAccount extends Capabilities_DropAccount {
  @override
  final bool enabled;
  @override
  final String apiVersion;
  @override
  final Capabilities_DropAccount_Delay delay;
  @override
  final String? details;

  factory _$Capabilities_DropAccount([void Function(Capabilities_DropAccountBuilder)? updates]) =>
      (Capabilities_DropAccountBuilder()..update(updates))._build();

  _$Capabilities_DropAccount._({required this.enabled, required this.apiVersion, required this.delay, this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount', 'enabled');
    BuiltValueNullFieldError.checkNotNull(apiVersion, r'Capabilities_DropAccount', 'apiVersion');
    BuiltValueNullFieldError.checkNotNull(delay, r'Capabilities_DropAccount', 'delay');
  }

  @override
  Capabilities_DropAccount rebuild(void Function(Capabilities_DropAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_DropAccountBuilder toBuilder() => Capabilities_DropAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_DropAccount &&
        enabled == other.enabled &&
        apiVersion == other.apiVersion &&
        delay == other.delay &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, delay.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_DropAccount')
          ..add('enabled', enabled)
          ..add('apiVersion', apiVersion)
          ..add('delay', delay)
          ..add('details', details))
        .toString();
  }
}

class Capabilities_DropAccountBuilder
    implements
        Builder<Capabilities_DropAccount, Capabilities_DropAccountBuilder>,
        $Capabilities_DropAccountInterfaceBuilder {
  _$Capabilities_DropAccount? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(covariant String? apiVersion) => _$this._apiVersion = apiVersion;

  Capabilities_DropAccount_DelayBuilder? _delay;
  Capabilities_DropAccount_DelayBuilder get delay => _$this._delay ??= Capabilities_DropAccount_DelayBuilder();
  set delay(covariant Capabilities_DropAccount_DelayBuilder? delay) => _$this._delay = delay;

  String? _details;
  String? get details => _$this._details;
  set details(covariant String? details) => _$this._details = details;

  Capabilities_DropAccountBuilder() {
    Capabilities_DropAccount._defaults(this);
  }

  Capabilities_DropAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _apiVersion = $v.apiVersion;
      _delay = $v.delay.toBuilder();
      _details = $v.details;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_DropAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_DropAccount;
  }

  @override
  void update(void Function(Capabilities_DropAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_DropAccount build() => _build();

  _$Capabilities_DropAccount _build() {
    Capabilities_DropAccount._validate(this);
    _$Capabilities_DropAccount _$result;
    try {
      _$result = _$v ??
          _$Capabilities_DropAccount._(
              enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount', 'enabled'),
              apiVersion: BuiltValueNullFieldError.checkNotNull(apiVersion, r'Capabilities_DropAccount', 'apiVersion'),
              delay: delay.build(),
              details: details);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'delay';
        delay.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities_DropAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $CapabilitiesInterfaceBuilder {
  void replace($CapabilitiesInterface other);
  void update(void Function($CapabilitiesInterfaceBuilder) updates);
  Capabilities_DropAccountBuilder get dropAccount;
  set dropAccount(Capabilities_DropAccountBuilder? dropAccount);
}

class _$Capabilities extends Capabilities {
  @override
  final Capabilities_DropAccount dropAccount;

  factory _$Capabilities([void Function(CapabilitiesBuilder)? updates]) =>
      (CapabilitiesBuilder()..update(updates))._build();

  _$Capabilities._({required this.dropAccount}) : super._() {
    BuiltValueNullFieldError.checkNotNull(dropAccount, r'Capabilities', 'dropAccount');
  }

  @override
  Capabilities rebuild(void Function(CapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CapabilitiesBuilder toBuilder() => CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities && dropAccount == other.dropAccount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dropAccount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities')..add('dropAccount', dropAccount)).toString();
  }
}

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, $CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_DropAccountBuilder? _dropAccount;
  Capabilities_DropAccountBuilder get dropAccount => _$this._dropAccount ??= Capabilities_DropAccountBuilder();
  set dropAccount(covariant Capabilities_DropAccountBuilder? dropAccount) => _$this._dropAccount = dropAccount;

  CapabilitiesBuilder() {
    Capabilities._defaults(this);
  }

  CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dropAccount = $v.dropAccount.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities;
  }

  @override
  void update(void Function(CapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities build() => _build();

  _$Capabilities _build() {
    Capabilities._validate(this);
    _$Capabilities _$result;
    try {
      _$result = _$v ?? _$Capabilities._(dropAccount: dropAccount.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dropAccount';
        dropAccount.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
