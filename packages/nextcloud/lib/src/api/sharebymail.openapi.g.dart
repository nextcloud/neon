// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharebymail.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop>
    _$sharebymailCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer =
    _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropSerializer();
Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_Password>
    _$sharebymailCapabilitiesFilesSharingSharebymailPasswordSerializer =
    _$SharebymailCapabilities_FilesSharing_Sharebymail_PasswordSerializer();
Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate>
    _$sharebymailCapabilitiesFilesSharingSharebymailExpireDateSerializer =
    _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateSerializer();
Serializer<SharebymailCapabilities_FilesSharing_Sharebymail>
    _$sharebymailCapabilitiesFilesSharingSharebymailSerializer =
    _$SharebymailCapabilities_FilesSharing_SharebymailSerializer();
Serializer<SharebymailCapabilities_FilesSharing> _$sharebymailCapabilitiesFilesSharingSerializer =
    _$SharebymailCapabilities_FilesSharingSerializer();
Serializer<SharebymailCapabilities> _$sharebymailCapabilitiesSerializer = _$SharebymailCapabilitiesSerializer();

class _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropSerializer
    implements StructuredSerializer<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop> {
  @override
  final Iterable<Type> types = const [
    SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop,
    _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop
  ];
  @override
  final String wireName = 'SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SharebymailCapabilities_FilesSharing_Sharebymail_PasswordSerializer
    implements StructuredSerializer<SharebymailCapabilities_FilesSharing_Sharebymail_Password> {
  @override
  final Iterable<Type> types = const [
    SharebymailCapabilities_FilesSharing_Sharebymail_Password,
    _$SharebymailCapabilities_FilesSharing_Sharebymail_Password
  ];
  @override
  final String wireName = 'SharebymailCapabilities_FilesSharing_Sharebymail_Password';

  @override
  Iterable<Object?> serialize(Serializers serializers, SharebymailCapabilities_FilesSharing_Sharebymail_Password object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_Password deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateSerializer
    implements StructuredSerializer<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate> {
  @override
  final Iterable<Type> types = const [
    SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate,
    _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate
  ];
  @override
  final String wireName = 'SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SharebymailCapabilities_FilesSharing_SharebymailSerializer
    implements StructuredSerializer<SharebymailCapabilities_FilesSharing_Sharebymail> {
  @override
  final Iterable<Type> types = const [
    SharebymailCapabilities_FilesSharing_Sharebymail,
    _$SharebymailCapabilities_FilesSharing_Sharebymail
  ];
  @override
  final String wireName = 'SharebymailCapabilities_FilesSharing_Sharebymail';

  @override
  Iterable<Object?> serialize(Serializers serializers, SharebymailCapabilities_FilesSharing_Sharebymail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'send_password_by_mail',
      serializers.serialize(object.sendPasswordByMail, specifiedType: const FullType(bool)),
      'upload_files_drop',
      serializers.serialize(object.uploadFilesDrop,
          specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_Password)),
      'expire_date',
      serializers.serialize(object.expireDate,
          specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate)),
    ];

    return result;
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SharebymailCapabilities_FilesSharing_SharebymailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'send_password_by_mail':
          result.sendPasswordByMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'upload_files_drop':
          result.uploadFilesDrop.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop))!
              as SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop);
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_Password))!
              as SharebymailCapabilities_FilesSharing_Sharebymail_Password);
          break;
        case 'expire_date':
          result.expireDate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate))!
              as SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate);
          break;
      }
    }

    return result.build();
  }
}

class _$SharebymailCapabilities_FilesSharingSerializer
    implements StructuredSerializer<SharebymailCapabilities_FilesSharing> {
  @override
  final Iterable<Type> types = const [SharebymailCapabilities_FilesSharing, _$SharebymailCapabilities_FilesSharing];
  @override
  final String wireName = 'SharebymailCapabilities_FilesSharing';

  @override
  Iterable<Object?> serialize(Serializers serializers, SharebymailCapabilities_FilesSharing object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sharebymail',
      serializers.serialize(object.sharebymail,
          specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail)),
    ];

    return result;
  }

  @override
  SharebymailCapabilities_FilesSharing deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SharebymailCapabilities_FilesSharingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sharebymail':
          result.sharebymail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SharebymailCapabilities_FilesSharing_Sharebymail))!
              as SharebymailCapabilities_FilesSharing_Sharebymail);
          break;
      }
    }

    return result.build();
  }
}

class _$SharebymailCapabilitiesSerializer implements StructuredSerializer<SharebymailCapabilities> {
  @override
  final Iterable<Type> types = const [SharebymailCapabilities, _$SharebymailCapabilities];
  @override
  final String wireName = 'SharebymailCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, SharebymailCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'files_sharing',
      serializers.serialize(object.filesSharing, specifiedType: const FullType(SharebymailCapabilities_FilesSharing)),
    ];

    return result;
  }

  @override
  SharebymailCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SharebymailCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'files_sharing':
          result.filesSharing.replace(
              serializers.deserialize(value, specifiedType: const FullType(SharebymailCapabilities_FilesSharing))!
                  as SharebymailCapabilities_FilesSharing);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder {
  void replace(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterface other);
  void update(void Function(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop
    extends SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop {
  @override
  final bool enabled;

  factory _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop(
          [void Function(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)? updates]) =>
      (SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder()..update(updates))._build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop', 'enabled');
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop rebuild(
          void Function(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder toBuilder() =>
      SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop')
          ..add('enabled', enabled))
        .toString();
  }
}

class SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder
    implements
        Builder<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder>,
        SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder {
  _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder();

  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop;
  }

  @override
  void update(void Function(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop build() => _build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop _build() {
    final _$result = _$v ??
        _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterfaceBuilder {
  void replace(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterface other);
  void update(void Function(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$SharebymailCapabilities_FilesSharing_Sharebymail_Password
    extends SharebymailCapabilities_FilesSharing_Sharebymail_Password {
  @override
  final bool enabled;
  @override
  final bool enforced;

  factory _$SharebymailCapabilities_FilesSharing_Sharebymail_Password(
          [void Function(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder)? updates]) =>
      (SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder()..update(updates))._build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail_Password._({required this.enabled, required this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail_Password', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        enforced, r'SharebymailCapabilities_FilesSharing_Sharebymail_Password', 'enforced');
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_Password rebuild(
          void Function(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder toBuilder() =>
      SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities_FilesSharing_Sharebymail_Password &&
        enabled == other.enabled &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities_FilesSharing_Sharebymail_Password')
          ..add('enabled', enabled)
          ..add('enforced', enforced))
        .toString();
  }
}

class SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder
    implements
        Builder<SharebymailCapabilities_FilesSharing_Sharebymail_Password,
            SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder>,
        SharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterfaceBuilder {
  _$SharebymailCapabilities_FilesSharing_Sharebymail_Password? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder();

  SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities_FilesSharing_Sharebymail_Password other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities_FilesSharing_Sharebymail_Password;
  }

  @override
  void update(void Function(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_Password build() => _build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail_Password _build() {
    final _$result = _$v ??
        _$SharebymailCapabilities_FilesSharing_Sharebymail_Password._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail_Password', 'enabled'),
            enforced: BuiltValueNullFieldError.checkNotNull(
                enforced, r'SharebymailCapabilities_FilesSharing_Sharebymail_Password', 'enforced'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder {
  void replace(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterface other);
  void update(void Function(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate
    extends SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate {
  @override
  final bool enabled;
  @override
  final bool enforced;

  factory _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate(
          [void Function(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? updates]) =>
      (SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder()..update(updates))._build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate._({required this.enabled, required this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        enforced, r'SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate', 'enforced');
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate rebuild(
          void Function(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder toBuilder() =>
      SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate &&
        enabled == other.enabled &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate')
          ..add('enabled', enabled)
          ..add('enforced', enforced))
        .toString();
  }
}

class SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder
    implements
        Builder<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate,
            SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder>,
        SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder {
  _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder();

  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate;
  }

  @override
  void update(void Function(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate build() => _build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate _build() {
    final _$result = _$v ??
        _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate', 'enabled'),
            enforced: BuiltValueNullFieldError.checkNotNull(
                enforced, r'SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate', 'enforced'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities_FilesSharing_SharebymailInterfaceBuilder {
  void replace(SharebymailCapabilities_FilesSharing_SharebymailInterface other);
  void update(void Function(SharebymailCapabilities_FilesSharing_SharebymailInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get sendPasswordByMail;
  set sendPasswordByMail(bool? sendPasswordByMail);

  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder get uploadFilesDrop;
  set uploadFilesDrop(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder? uploadFilesDrop);

  SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder get password;
  set password(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder? password);

  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder get expireDate;
  set expireDate(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder? expireDate);
}

class _$SharebymailCapabilities_FilesSharing_Sharebymail extends SharebymailCapabilities_FilesSharing_Sharebymail {
  @override
  final bool enabled;
  @override
  final bool sendPasswordByMail;
  @override
  final SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop uploadFilesDrop;
  @override
  final SharebymailCapabilities_FilesSharing_Sharebymail_Password password;
  @override
  final SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate expireDate;

  factory _$SharebymailCapabilities_FilesSharing_Sharebymail(
          [void Function(SharebymailCapabilities_FilesSharing_SharebymailBuilder)? updates]) =>
      (SharebymailCapabilities_FilesSharing_SharebymailBuilder()..update(updates))._build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail._(
      {required this.enabled,
      required this.sendPasswordByMail,
      required this.uploadFilesDrop,
      required this.password,
      required this.expireDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        sendPasswordByMail, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'sendPasswordByMail');
    BuiltValueNullFieldError.checkNotNull(
        uploadFilesDrop, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'uploadFilesDrop');
    BuiltValueNullFieldError.checkNotNull(password, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'password');
    BuiltValueNullFieldError.checkNotNull(
        expireDate, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'expireDate');
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail rebuild(
          void Function(SharebymailCapabilities_FilesSharing_SharebymailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities_FilesSharing_SharebymailBuilder toBuilder() =>
      SharebymailCapabilities_FilesSharing_SharebymailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities_FilesSharing_Sharebymail &&
        enabled == other.enabled &&
        sendPasswordByMail == other.sendPasswordByMail &&
        uploadFilesDrop == other.uploadFilesDrop &&
        password == other.password &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, sendPasswordByMail.hashCode);
    _$hash = $jc(_$hash, uploadFilesDrop.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities_FilesSharing_Sharebymail')
          ..add('enabled', enabled)
          ..add('sendPasswordByMail', sendPasswordByMail)
          ..add('uploadFilesDrop', uploadFilesDrop)
          ..add('password', password)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class SharebymailCapabilities_FilesSharing_SharebymailBuilder
    implements
        Builder<SharebymailCapabilities_FilesSharing_Sharebymail,
            SharebymailCapabilities_FilesSharing_SharebymailBuilder>,
        SharebymailCapabilities_FilesSharing_SharebymailInterfaceBuilder {
  _$SharebymailCapabilities_FilesSharing_Sharebymail? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _sendPasswordByMail;
  bool? get sendPasswordByMail => _$this._sendPasswordByMail;
  set sendPasswordByMail(covariant bool? sendPasswordByMail) => _$this._sendPasswordByMail = sendPasswordByMail;

  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder? _uploadFilesDrop;
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder get uploadFilesDrop =>
      _$this._uploadFilesDrop ??= SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder();
  set uploadFilesDrop(
          covariant SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder? uploadFilesDrop) =>
      _$this._uploadFilesDrop = uploadFilesDrop;

  SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder? _password;
  SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder get password =>
      _$this._password ??= SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder();
  set password(covariant SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder? password) =>
      _$this._password = password;

  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder? _expireDate;
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??= SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder();
  set expireDate(covariant SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  SharebymailCapabilities_FilesSharing_SharebymailBuilder();

  SharebymailCapabilities_FilesSharing_SharebymailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _sendPasswordByMail = $v.sendPasswordByMail;
      _uploadFilesDrop = $v.uploadFilesDrop.toBuilder();
      _password = $v.password.toBuilder();
      _expireDate = $v.expireDate.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities_FilesSharing_Sharebymail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities_FilesSharing_Sharebymail;
  }

  @override
  void update(void Function(SharebymailCapabilities_FilesSharing_SharebymailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities_FilesSharing_Sharebymail build() => _build();

  _$SharebymailCapabilities_FilesSharing_Sharebymail _build() {
    _$SharebymailCapabilities_FilesSharing_Sharebymail _$result;
    try {
      _$result = _$v ??
          _$SharebymailCapabilities_FilesSharing_Sharebymail._(
              enabled: BuiltValueNullFieldError.checkNotNull(
                  enabled, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'enabled'),
              sendPasswordByMail: BuiltValueNullFieldError.checkNotNull(
                  sendPasswordByMail, r'SharebymailCapabilities_FilesSharing_Sharebymail', 'sendPasswordByMail'),
              uploadFilesDrop: uploadFilesDrop.build(),
              password: password.build(),
              expireDate: expireDate.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'uploadFilesDrop';
        uploadFilesDrop.build();
        _$failedField = 'password';
        password.build();
        _$failedField = 'expireDate';
        expireDate.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SharebymailCapabilities_FilesSharing_Sharebymail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities_FilesSharingInterfaceBuilder {
  void replace(SharebymailCapabilities_FilesSharingInterface other);
  void update(void Function(SharebymailCapabilities_FilesSharingInterfaceBuilder) updates);
  SharebymailCapabilities_FilesSharing_SharebymailBuilder get sharebymail;
  set sharebymail(SharebymailCapabilities_FilesSharing_SharebymailBuilder? sharebymail);
}

class _$SharebymailCapabilities_FilesSharing extends SharebymailCapabilities_FilesSharing {
  @override
  final SharebymailCapabilities_FilesSharing_Sharebymail sharebymail;

  factory _$SharebymailCapabilities_FilesSharing(
          [void Function(SharebymailCapabilities_FilesSharingBuilder)? updates]) =>
      (SharebymailCapabilities_FilesSharingBuilder()..update(updates))._build();

  _$SharebymailCapabilities_FilesSharing._({required this.sharebymail}) : super._() {
    BuiltValueNullFieldError.checkNotNull(sharebymail, r'SharebymailCapabilities_FilesSharing', 'sharebymail');
  }

  @override
  SharebymailCapabilities_FilesSharing rebuild(void Function(SharebymailCapabilities_FilesSharingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities_FilesSharingBuilder toBuilder() =>
      SharebymailCapabilities_FilesSharingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities_FilesSharing && sharebymail == other.sharebymail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sharebymail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities_FilesSharing')..add('sharebymail', sharebymail))
        .toString();
  }
}

class SharebymailCapabilities_FilesSharingBuilder
    implements
        Builder<SharebymailCapabilities_FilesSharing, SharebymailCapabilities_FilesSharingBuilder>,
        SharebymailCapabilities_FilesSharingInterfaceBuilder {
  _$SharebymailCapabilities_FilesSharing? _$v;

  SharebymailCapabilities_FilesSharing_SharebymailBuilder? _sharebymail;
  SharebymailCapabilities_FilesSharing_SharebymailBuilder get sharebymail =>
      _$this._sharebymail ??= SharebymailCapabilities_FilesSharing_SharebymailBuilder();
  set sharebymail(covariant SharebymailCapabilities_FilesSharing_SharebymailBuilder? sharebymail) =>
      _$this._sharebymail = sharebymail;

  SharebymailCapabilities_FilesSharingBuilder();

  SharebymailCapabilities_FilesSharingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sharebymail = $v.sharebymail.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities_FilesSharing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities_FilesSharing;
  }

  @override
  void update(void Function(SharebymailCapabilities_FilesSharingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities_FilesSharing build() => _build();

  _$SharebymailCapabilities_FilesSharing _build() {
    _$SharebymailCapabilities_FilesSharing _$result;
    try {
      _$result = _$v ?? _$SharebymailCapabilities_FilesSharing._(sharebymail: sharebymail.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sharebymail';
        sharebymail.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SharebymailCapabilities_FilesSharing', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilitiesInterfaceBuilder {
  void replace(SharebymailCapabilitiesInterface other);
  void update(void Function(SharebymailCapabilitiesInterfaceBuilder) updates);
  SharebymailCapabilities_FilesSharingBuilder get filesSharing;
  set filesSharing(SharebymailCapabilities_FilesSharingBuilder? filesSharing);
}

class _$SharebymailCapabilities extends SharebymailCapabilities {
  @override
  final SharebymailCapabilities_FilesSharing filesSharing;

  factory _$SharebymailCapabilities([void Function(SharebymailCapabilitiesBuilder)? updates]) =>
      (SharebymailCapabilitiesBuilder()..update(updates))._build();

  _$SharebymailCapabilities._({required this.filesSharing}) : super._() {
    BuiltValueNullFieldError.checkNotNull(filesSharing, r'SharebymailCapabilities', 'filesSharing');
  }

  @override
  SharebymailCapabilities rebuild(void Function(SharebymailCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilitiesBuilder toBuilder() => SharebymailCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities && filesSharing == other.filesSharing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, filesSharing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities')..add('filesSharing', filesSharing)).toString();
  }
}

class SharebymailCapabilitiesBuilder
    implements
        Builder<SharebymailCapabilities, SharebymailCapabilitiesBuilder>,
        SharebymailCapabilitiesInterfaceBuilder {
  _$SharebymailCapabilities? _$v;

  SharebymailCapabilities_FilesSharingBuilder? _filesSharing;
  SharebymailCapabilities_FilesSharingBuilder get filesSharing =>
      _$this._filesSharing ??= SharebymailCapabilities_FilesSharingBuilder();
  set filesSharing(covariant SharebymailCapabilities_FilesSharingBuilder? filesSharing) =>
      _$this._filesSharing = filesSharing;

  SharebymailCapabilitiesBuilder();

  SharebymailCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _filesSharing = $v.filesSharing.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities;
  }

  @override
  void update(void Function(SharebymailCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities build() => _build();

  _$SharebymailCapabilities _build() {
    _$SharebymailCapabilities _$result;
    try {
      _$result = _$v ?? _$SharebymailCapabilities._(filesSharing: filesSharing.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filesSharing';
        filesSharing.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SharebymailCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
