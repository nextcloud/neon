// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theming.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ThemingThemingGetManifestResponse200ApplicationJson_Icons>
    _$themingThemingGetManifestResponse200ApplicationJsonIconsSerializer =
    _$ThemingThemingGetManifestResponse200ApplicationJson_IconsSerializer();
Serializer<ThemingThemingGetManifestResponse200ApplicationJson>
    _$themingThemingGetManifestResponse200ApplicationJsonSerializer =
    _$ThemingThemingGetManifestResponse200ApplicationJsonSerializer();
Serializer<ThemingBackground> _$themingBackgroundSerializer = _$ThemingBackgroundSerializer();
Serializer<ThemingOCSMeta> _$themingOCSMetaSerializer = _$ThemingOCSMetaSerializer();
Serializer<ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs>
    _$themingUserThemeEnableThemeResponse200ApplicationJsonOcsSerializer =
    _$ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsSerializer();
Serializer<ThemingUserThemeEnableThemeResponse200ApplicationJson>
    _$themingUserThemeEnableThemeResponse200ApplicationJsonSerializer =
    _$ThemingUserThemeEnableThemeResponse200ApplicationJsonSerializer();
Serializer<ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs>
    _$themingUserThemeDisableThemeResponse200ApplicationJsonOcsSerializer =
    _$ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsSerializer();
Serializer<ThemingUserThemeDisableThemeResponse200ApplicationJson>
    _$themingUserThemeDisableThemeResponse200ApplicationJsonSerializer =
    _$ThemingUserThemeDisableThemeResponse200ApplicationJsonSerializer();
Serializer<ThemingPublicCapabilities_Theming> _$themingPublicCapabilitiesThemingSerializer =
    _$ThemingPublicCapabilities_ThemingSerializer();
Serializer<ThemingPublicCapabilities> _$themingPublicCapabilitiesSerializer = _$ThemingPublicCapabilitiesSerializer();

class _$ThemingThemingGetManifestResponse200ApplicationJson_IconsSerializer
    implements StructuredSerializer<ThemingThemingGetManifestResponse200ApplicationJson_Icons> {
  @override
  final Iterable<Type> types = const [
    ThemingThemingGetManifestResponse200ApplicationJson_Icons,
    _$ThemingThemingGetManifestResponse200ApplicationJson_Icons
  ];
  @override
  final String wireName = 'ThemingThemingGetManifestResponse200ApplicationJson_Icons';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingThemingGetManifestResponse200ApplicationJson_Icons object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'src',
      serializers.serialize(object.src, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'sizes',
      serializers.serialize(object.sizes, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ThemingThemingGetManifestResponse200ApplicationJson_Icons deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'src':
          result.src = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'sizes':
          result.sizes = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingThemingGetManifestResponse200ApplicationJsonSerializer
    implements StructuredSerializer<ThemingThemingGetManifestResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ThemingThemingGetManifestResponse200ApplicationJson,
    _$ThemingThemingGetManifestResponse200ApplicationJson
  ];
  @override
  final String wireName = 'ThemingThemingGetManifestResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingThemingGetManifestResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'short_name',
      serializers.serialize(object.shortName, specifiedType: const FullType(String)),
      'start_url',
      serializers.serialize(object.startUrl, specifiedType: const FullType(String)),
      'theme_color',
      serializers.serialize(object.themeColor, specifiedType: const FullType(String)),
      'background_color',
      serializers.serialize(object.backgroundColor, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description, specifiedType: const FullType(String)),
      'icons',
      serializers.serialize(object.icons,
          specifiedType:
              const FullType(BuiltList, [FullType(ThemingThemingGetManifestResponse200ApplicationJson_Icons)])),
      'display',
      serializers.serialize(object.display, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ThemingThemingGetManifestResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingThemingGetManifestResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'short_name':
          result.shortName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'start_url':
          result.startUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'theme_color':
          result.themeColor = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'background_color':
          result.backgroundColor = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'icons':
          result.icons.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, [FullType(ThemingThemingGetManifestResponse200ApplicationJson_Icons)]))!
              as BuiltList<Object?>);
          break;
        case 'display':
          result.display = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingBackgroundSerializer implements StructuredSerializer<ThemingBackground> {
  @override
  final Iterable<Type> types = const [ThemingBackground, _$ThemingBackground];
  @override
  final String wireName = 'ThemingBackground';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingBackground object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'backgroundColor',
      serializers.serialize(object.backgroundColor, specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.backgroundImage;
    if (value != null) {
      result
        ..add('backgroundImage')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ThemingBackground deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingBackgroundBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'backgroundImage':
          result.backgroundImage = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'backgroundColor':
          result.backgroundColor = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingOCSMetaSerializer implements StructuredSerializer<ThemingOCSMeta> {
  @override
  final Iterable<Type> types = const [ThemingOCSMeta, _$ThemingOCSMeta];
  @override
  final String wireName = 'ThemingOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingOCSMeta object,
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
  ThemingOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingOCSMetaBuilder();

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

class _$ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs,
    _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(ThemingOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(ThemingOCSMeta))! as ThemingOCSMeta);
          break;
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingUserThemeEnableThemeResponse200ApplicationJsonSerializer
    implements StructuredSerializer<ThemingUserThemeEnableThemeResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeEnableThemeResponse200ApplicationJson,
    _$ThemingUserThemeEnableThemeResponse200ApplicationJson
  ];
  @override
  final String wireName = 'ThemingUserThemeEnableThemeResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeEnableThemeResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs))!
              as ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs,
    _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(ThemingOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(ThemingOCSMeta))! as ThemingOCSMeta);
          break;
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingUserThemeDisableThemeResponse200ApplicationJsonSerializer
    implements StructuredSerializer<ThemingUserThemeDisableThemeResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeDisableThemeResponse200ApplicationJson,
    _$ThemingUserThemeDisableThemeResponse200ApplicationJson
  ];
  @override
  final String wireName = 'ThemingUserThemeDisableThemeResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeDisableThemeResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs))!
              as ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingPublicCapabilities_ThemingSerializer implements StructuredSerializer<ThemingPublicCapabilities_Theming> {
  @override
  final Iterable<Type> types = const [ThemingPublicCapabilities_Theming, _$ThemingPublicCapabilities_Theming];
  @override
  final String wireName = 'ThemingPublicCapabilities_Theming';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingPublicCapabilities_Theming object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'slogan',
      serializers.serialize(object.slogan, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(String)),
      'color-text',
      serializers.serialize(object.colorText, specifiedType: const FullType(String)),
      'color-element',
      serializers.serialize(object.colorElement, specifiedType: const FullType(String)),
      'color-element-bright',
      serializers.serialize(object.colorElementBright, specifiedType: const FullType(String)),
      'color-element-dark',
      serializers.serialize(object.colorElementDark, specifiedType: const FullType(String)),
      'logo',
      serializers.serialize(object.logo, specifiedType: const FullType(String)),
      'background',
      serializers.serialize(object.background, specifiedType: const FullType(String)),
      'background-plain',
      serializers.serialize(object.backgroundPlain, specifiedType: const FullType(bool)),
      'background-default',
      serializers.serialize(object.backgroundDefault, specifiedType: const FullType(bool)),
      'logoheader',
      serializers.serialize(object.logoheader, specifiedType: const FullType(String)),
      'favicon',
      serializers.serialize(object.favicon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ThemingPublicCapabilities_Theming deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingPublicCapabilities_ThemingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'slogan':
          result.slogan = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'color-text':
          result.colorText = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'color-element':
          result.colorElement = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'color-element-bright':
          result.colorElementBright = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'color-element-dark':
          result.colorElementDark = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'background':
          result.background = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'background-plain':
          result.backgroundPlain = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'background-default':
          result.backgroundDefault = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'logoheader':
          result.logoheader = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'favicon':
          result.favicon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingPublicCapabilitiesSerializer implements StructuredSerializer<ThemingPublicCapabilities> {
  @override
  final Iterable<Type> types = const [ThemingPublicCapabilities, _$ThemingPublicCapabilities];
  @override
  final String wireName = 'ThemingPublicCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingPublicCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'theming',
      serializers.serialize(object.theming, specifiedType: const FullType(ThemingPublicCapabilities_Theming)),
    ];

    return result;
  }

  @override
  ThemingPublicCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingPublicCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'theming':
          result.theming.replace(serializers.deserialize(value,
              specifiedType: const FullType(ThemingPublicCapabilities_Theming))! as ThemingPublicCapabilities_Theming);
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingThemingGetManifestResponse200ApplicationJson_Icons
    extends ThemingThemingGetManifestResponse200ApplicationJson_Icons {
  @override
  final String src;
  @override
  final String type;
  @override
  final String sizes;

  factory _$ThemingThemingGetManifestResponse200ApplicationJson_Icons(
          [void Function(ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder)? updates]) =>
      (ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder()..update(updates))._build();

  _$ThemingThemingGetManifestResponse200ApplicationJson_Icons._(
      {required this.src, required this.type, required this.sizes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(src, r'ThemingThemingGetManifestResponse200ApplicationJson_Icons', 'src');
    BuiltValueNullFieldError.checkNotNull(type, r'ThemingThemingGetManifestResponse200ApplicationJson_Icons', 'type');
    BuiltValueNullFieldError.checkNotNull(sizes, r'ThemingThemingGetManifestResponse200ApplicationJson_Icons', 'sizes');
  }

  @override
  ThemingThemingGetManifestResponse200ApplicationJson_Icons rebuild(
          void Function(ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder toBuilder() =>
      ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingThemingGetManifestResponse200ApplicationJson_Icons &&
        src == other.src &&
        type == other.type &&
        sizes == other.sizes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, src.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sizes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingThemingGetManifestResponse200ApplicationJson_Icons')
          ..add('src', src)
          ..add('type', type)
          ..add('sizes', sizes))
        .toString();
  }
}

class ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder
    implements
        Builder<ThemingThemingGetManifestResponse200ApplicationJson_Icons,
            ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder> {
  _$ThemingThemingGetManifestResponse200ApplicationJson_Icons? _$v;

  String? _src;
  String? get src => _$this._src;
  set src(String? src) => _$this._src = src;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _sizes;
  String? get sizes => _$this._sizes;
  set sizes(String? sizes) => _$this._sizes = sizes;

  ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder();

  ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _src = $v.src;
      _type = $v.type;
      _sizes = $v.sizes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingThemingGetManifestResponse200ApplicationJson_Icons other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingThemingGetManifestResponse200ApplicationJson_Icons;
  }

  @override
  void update(void Function(ThemingThemingGetManifestResponse200ApplicationJson_IconsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingThemingGetManifestResponse200ApplicationJson_Icons build() => _build();

  _$ThemingThemingGetManifestResponse200ApplicationJson_Icons _build() {
    final _$result = _$v ??
        _$ThemingThemingGetManifestResponse200ApplicationJson_Icons._(
            src: BuiltValueNullFieldError.checkNotNull(
                src, r'ThemingThemingGetManifestResponse200ApplicationJson_Icons', 'src'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ThemingThemingGetManifestResponse200ApplicationJson_Icons', 'type'),
            sizes: BuiltValueNullFieldError.checkNotNull(
                sizes, r'ThemingThemingGetManifestResponse200ApplicationJson_Icons', 'sizes'));
    replace(_$result);
    return _$result;
  }
}

class _$ThemingThemingGetManifestResponse200ApplicationJson
    extends ThemingThemingGetManifestResponse200ApplicationJson {
  @override
  final String name;
  @override
  final String shortName;
  @override
  final String startUrl;
  @override
  final String themeColor;
  @override
  final String backgroundColor;
  @override
  final String description;
  @override
  final BuiltList<ThemingThemingGetManifestResponse200ApplicationJson_Icons> icons;
  @override
  final String display;

  factory _$ThemingThemingGetManifestResponse200ApplicationJson(
          [void Function(ThemingThemingGetManifestResponse200ApplicationJsonBuilder)? updates]) =>
      (ThemingThemingGetManifestResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$ThemingThemingGetManifestResponse200ApplicationJson._(
      {required this.name,
      required this.shortName,
      required this.startUrl,
      required this.themeColor,
      required this.backgroundColor,
      required this.description,
      required this.icons,
      required this.display})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ThemingThemingGetManifestResponse200ApplicationJson', 'name');
    BuiltValueNullFieldError.checkNotNull(
        shortName, r'ThemingThemingGetManifestResponse200ApplicationJson', 'shortName');
    BuiltValueNullFieldError.checkNotNull(startUrl, r'ThemingThemingGetManifestResponse200ApplicationJson', 'startUrl');
    BuiltValueNullFieldError.checkNotNull(
        themeColor, r'ThemingThemingGetManifestResponse200ApplicationJson', 'themeColor');
    BuiltValueNullFieldError.checkNotNull(
        backgroundColor, r'ThemingThemingGetManifestResponse200ApplicationJson', 'backgroundColor');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ThemingThemingGetManifestResponse200ApplicationJson', 'description');
    BuiltValueNullFieldError.checkNotNull(icons, r'ThemingThemingGetManifestResponse200ApplicationJson', 'icons');
    BuiltValueNullFieldError.checkNotNull(display, r'ThemingThemingGetManifestResponse200ApplicationJson', 'display');
  }

  @override
  ThemingThemingGetManifestResponse200ApplicationJson rebuild(
          void Function(ThemingThemingGetManifestResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingThemingGetManifestResponse200ApplicationJsonBuilder toBuilder() =>
      ThemingThemingGetManifestResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingThemingGetManifestResponse200ApplicationJson &&
        name == other.name &&
        shortName == other.shortName &&
        startUrl == other.startUrl &&
        themeColor == other.themeColor &&
        backgroundColor == other.backgroundColor &&
        description == other.description &&
        icons == other.icons &&
        display == other.display;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, shortName.hashCode);
    _$hash = $jc(_$hash, startUrl.hashCode);
    _$hash = $jc(_$hash, themeColor.hashCode);
    _$hash = $jc(_$hash, backgroundColor.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icons.hashCode);
    _$hash = $jc(_$hash, display.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingThemingGetManifestResponse200ApplicationJson')
          ..add('name', name)
          ..add('shortName', shortName)
          ..add('startUrl', startUrl)
          ..add('themeColor', themeColor)
          ..add('backgroundColor', backgroundColor)
          ..add('description', description)
          ..add('icons', icons)
          ..add('display', display))
        .toString();
  }
}

class ThemingThemingGetManifestResponse200ApplicationJsonBuilder
    implements
        Builder<ThemingThemingGetManifestResponse200ApplicationJson,
            ThemingThemingGetManifestResponse200ApplicationJsonBuilder> {
  _$ThemingThemingGetManifestResponse200ApplicationJson? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _shortName;
  String? get shortName => _$this._shortName;
  set shortName(String? shortName) => _$this._shortName = shortName;

  String? _startUrl;
  String? get startUrl => _$this._startUrl;
  set startUrl(String? startUrl) => _$this._startUrl = startUrl;

  String? _themeColor;
  String? get themeColor => _$this._themeColor;
  set themeColor(String? themeColor) => _$this._themeColor = themeColor;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(String? backgroundColor) => _$this._backgroundColor = backgroundColor;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<ThemingThemingGetManifestResponse200ApplicationJson_Icons>? _icons;
  ListBuilder<ThemingThemingGetManifestResponse200ApplicationJson_Icons> get icons =>
      _$this._icons ??= ListBuilder<ThemingThemingGetManifestResponse200ApplicationJson_Icons>();
  set icons(ListBuilder<ThemingThemingGetManifestResponse200ApplicationJson_Icons>? icons) => _$this._icons = icons;

  String? _display;
  String? get display => _$this._display;
  set display(String? display) => _$this._display = display;

  ThemingThemingGetManifestResponse200ApplicationJsonBuilder();

  ThemingThemingGetManifestResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _shortName = $v.shortName;
      _startUrl = $v.startUrl;
      _themeColor = $v.themeColor;
      _backgroundColor = $v.backgroundColor;
      _description = $v.description;
      _icons = $v.icons.toBuilder();
      _display = $v.display;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingThemingGetManifestResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingThemingGetManifestResponse200ApplicationJson;
  }

  @override
  void update(void Function(ThemingThemingGetManifestResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingThemingGetManifestResponse200ApplicationJson build() => _build();

  _$ThemingThemingGetManifestResponse200ApplicationJson _build() {
    _$ThemingThemingGetManifestResponse200ApplicationJson _$result;
    try {
      _$result = _$v ??
          _$ThemingThemingGetManifestResponse200ApplicationJson._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ThemingThemingGetManifestResponse200ApplicationJson', 'name'),
              shortName: BuiltValueNullFieldError.checkNotNull(
                  shortName, r'ThemingThemingGetManifestResponse200ApplicationJson', 'shortName'),
              startUrl: BuiltValueNullFieldError.checkNotNull(
                  startUrl, r'ThemingThemingGetManifestResponse200ApplicationJson', 'startUrl'),
              themeColor: BuiltValueNullFieldError.checkNotNull(
                  themeColor, r'ThemingThemingGetManifestResponse200ApplicationJson', 'themeColor'),
              backgroundColor: BuiltValueNullFieldError.checkNotNull(
                  backgroundColor, r'ThemingThemingGetManifestResponse200ApplicationJson', 'backgroundColor'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ThemingThemingGetManifestResponse200ApplicationJson', 'description'),
              icons: icons.build(),
              display: BuiltValueNullFieldError.checkNotNull(
                  display, r'ThemingThemingGetManifestResponse200ApplicationJson', 'display'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'icons';
        icons.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingThemingGetManifestResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThemingBackground extends ThemingBackground {
  @override
  final String? backgroundImage;
  @override
  final String backgroundColor;
  @override
  final int version;

  factory _$ThemingBackground([void Function(ThemingBackgroundBuilder)? updates]) =>
      (ThemingBackgroundBuilder()..update(updates))._build();

  _$ThemingBackground._({this.backgroundImage, required this.backgroundColor, required this.version}) : super._() {
    BuiltValueNullFieldError.checkNotNull(backgroundColor, r'ThemingBackground', 'backgroundColor');
    BuiltValueNullFieldError.checkNotNull(version, r'ThemingBackground', 'version');
  }

  @override
  ThemingBackground rebuild(void Function(ThemingBackgroundBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ThemingBackgroundBuilder toBuilder() => ThemingBackgroundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingBackground &&
        backgroundImage == other.backgroundImage &&
        backgroundColor == other.backgroundColor &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, backgroundImage.hashCode);
    _$hash = $jc(_$hash, backgroundColor.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingBackground')
          ..add('backgroundImage', backgroundImage)
          ..add('backgroundColor', backgroundColor)
          ..add('version', version))
        .toString();
  }
}

class ThemingBackgroundBuilder implements Builder<ThemingBackground, ThemingBackgroundBuilder> {
  _$ThemingBackground? _$v;

  String? _backgroundImage;
  String? get backgroundImage => _$this._backgroundImage;
  set backgroundImage(String? backgroundImage) => _$this._backgroundImage = backgroundImage;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(String? backgroundColor) => _$this._backgroundColor = backgroundColor;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  ThemingBackgroundBuilder();

  ThemingBackgroundBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _backgroundImage = $v.backgroundImage;
      _backgroundColor = $v.backgroundColor;
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingBackground other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingBackground;
  }

  @override
  void update(void Function(ThemingBackgroundBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingBackground build() => _build();

  _$ThemingBackground _build() {
    final _$result = _$v ??
        _$ThemingBackground._(
            backgroundImage: backgroundImage,
            backgroundColor:
                BuiltValueNullFieldError.checkNotNull(backgroundColor, r'ThemingBackground', 'backgroundColor'),
            version: BuiltValueNullFieldError.checkNotNull(version, r'ThemingBackground', 'version'));
    replace(_$result);
    return _$result;
  }
}

class _$ThemingOCSMeta extends ThemingOCSMeta {
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

  factory _$ThemingOCSMeta([void Function(ThemingOCSMetaBuilder)? updates]) =>
      (ThemingOCSMetaBuilder()..update(updates))._build();

  _$ThemingOCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'ThemingOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'ThemingOCSMeta', 'statuscode');
  }

  @override
  ThemingOCSMeta rebuild(void Function(ThemingOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ThemingOCSMetaBuilder toBuilder() => ThemingOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'ThemingOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class ThemingOCSMetaBuilder implements Builder<ThemingOCSMeta, ThemingOCSMetaBuilder> {
  _$ThemingOCSMeta? _$v;

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

  ThemingOCSMetaBuilder();

  ThemingOCSMetaBuilder get _$this {
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
  void replace(ThemingOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingOCSMeta;
  }

  @override
  void update(void Function(ThemingOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingOCSMeta build() => _build();

  _$ThemingOCSMeta _build() {
    final _$result = _$v ??
        _$ThemingOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'ThemingOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'ThemingOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

class _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs
    extends ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs {
  @override
  final ThemingOCSMeta meta;
  @override
  final JsonObject data;

  factory _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs(
          [void Function(ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs rebuild(
          void Function(ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder toBuilder() =>
      ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder
    implements
        Builder<ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs,
            ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder> {
  _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs? _$v;

  ThemingOCSMetaBuilder? _meta;
  ThemingOCSMetaBuilder get meta => _$this._meta ??= ThemingOCSMetaBuilder();
  set meta(ThemingOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder();

  ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs build() => _build();

  _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs _build() {
    _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThemingUserThemeEnableThemeResponse200ApplicationJson
    extends ThemingUserThemeEnableThemeResponse200ApplicationJson {
  @override
  final ThemingUserThemeEnableThemeResponse200ApplicationJson_Ocs ocs;

  factory _$ThemingUserThemeEnableThemeResponse200ApplicationJson(
          [void Function(ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder)? updates]) =>
      (ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$ThemingUserThemeEnableThemeResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ThemingUserThemeEnableThemeResponse200ApplicationJson', 'ocs');
  }

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson rebuild(
          void Function(ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder toBuilder() =>
      ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeEnableThemeResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeEnableThemeResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder
    implements
        Builder<ThemingUserThemeEnableThemeResponse200ApplicationJson,
            ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder> {
  _$ThemingUserThemeEnableThemeResponse200ApplicationJson? _$v;

  ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder? _ocs;
  ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder();
  set ocs(ThemingUserThemeEnableThemeResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder();

  ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingUserThemeEnableThemeResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeEnableThemeResponse200ApplicationJson;
  }

  @override
  void update(void Function(ThemingUserThemeEnableThemeResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeEnableThemeResponse200ApplicationJson build() => _build();

  _$ThemingUserThemeEnableThemeResponse200ApplicationJson _build() {
    _$ThemingUserThemeEnableThemeResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$ThemingUserThemeEnableThemeResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeEnableThemeResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs
    extends ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs {
  @override
  final ThemingOCSMeta meta;
  @override
  final JsonObject data;

  factory _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs(
          [void Function(ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs rebuild(
          void Function(ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder toBuilder() =>
      ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder
    implements
        Builder<ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs,
            ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder> {
  _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs? _$v;

  ThemingOCSMetaBuilder? _meta;
  ThemingOCSMetaBuilder get meta => _$this._meta ??= ThemingOCSMetaBuilder();
  set meta(ThemingOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder();

  ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs build() => _build();

  _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs _build() {
    _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThemingUserThemeDisableThemeResponse200ApplicationJson
    extends ThemingUserThemeDisableThemeResponse200ApplicationJson {
  @override
  final ThemingUserThemeDisableThemeResponse200ApplicationJson_Ocs ocs;

  factory _$ThemingUserThemeDisableThemeResponse200ApplicationJson(
          [void Function(ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder)? updates]) =>
      (ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$ThemingUserThemeDisableThemeResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ThemingUserThemeDisableThemeResponse200ApplicationJson', 'ocs');
  }

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson rebuild(
          void Function(ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder toBuilder() =>
      ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeDisableThemeResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeDisableThemeResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder
    implements
        Builder<ThemingUserThemeDisableThemeResponse200ApplicationJson,
            ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder> {
  _$ThemingUserThemeDisableThemeResponse200ApplicationJson? _$v;

  ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder? _ocs;
  ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder();
  set ocs(ThemingUserThemeDisableThemeResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder();

  ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingUserThemeDisableThemeResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeDisableThemeResponse200ApplicationJson;
  }

  @override
  void update(void Function(ThemingUserThemeDisableThemeResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeDisableThemeResponse200ApplicationJson build() => _build();

  _$ThemingUserThemeDisableThemeResponse200ApplicationJson _build() {
    _$ThemingUserThemeDisableThemeResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$ThemingUserThemeDisableThemeResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeDisableThemeResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ThemingPublicCapabilities_Theming extends ThemingPublicCapabilities_Theming {
  @override
  final String name;
  @override
  final String url;
  @override
  final String slogan;
  @override
  final String color;
  @override
  final String colorText;
  @override
  final String colorElement;
  @override
  final String colorElementBright;
  @override
  final String colorElementDark;
  @override
  final String logo;
  @override
  final String background;
  @override
  final bool backgroundPlain;
  @override
  final bool backgroundDefault;
  @override
  final String logoheader;
  @override
  final String favicon;

  factory _$ThemingPublicCapabilities_Theming([void Function(ThemingPublicCapabilities_ThemingBuilder)? updates]) =>
      (ThemingPublicCapabilities_ThemingBuilder()..update(updates))._build();

  _$ThemingPublicCapabilities_Theming._(
      {required this.name,
      required this.url,
      required this.slogan,
      required this.color,
      required this.colorText,
      required this.colorElement,
      required this.colorElementBright,
      required this.colorElementDark,
      required this.logo,
      required this.background,
      required this.backgroundPlain,
      required this.backgroundDefault,
      required this.logoheader,
      required this.favicon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ThemingPublicCapabilities_Theming', 'name');
    BuiltValueNullFieldError.checkNotNull(url, r'ThemingPublicCapabilities_Theming', 'url');
    BuiltValueNullFieldError.checkNotNull(slogan, r'ThemingPublicCapabilities_Theming', 'slogan');
    BuiltValueNullFieldError.checkNotNull(color, r'ThemingPublicCapabilities_Theming', 'color');
    BuiltValueNullFieldError.checkNotNull(colorText, r'ThemingPublicCapabilities_Theming', 'colorText');
    BuiltValueNullFieldError.checkNotNull(colorElement, r'ThemingPublicCapabilities_Theming', 'colorElement');
    BuiltValueNullFieldError.checkNotNull(
        colorElementBright, r'ThemingPublicCapabilities_Theming', 'colorElementBright');
    BuiltValueNullFieldError.checkNotNull(colorElementDark, r'ThemingPublicCapabilities_Theming', 'colorElementDark');
    BuiltValueNullFieldError.checkNotNull(logo, r'ThemingPublicCapabilities_Theming', 'logo');
    BuiltValueNullFieldError.checkNotNull(background, r'ThemingPublicCapabilities_Theming', 'background');
    BuiltValueNullFieldError.checkNotNull(backgroundPlain, r'ThemingPublicCapabilities_Theming', 'backgroundPlain');
    BuiltValueNullFieldError.checkNotNull(backgroundDefault, r'ThemingPublicCapabilities_Theming', 'backgroundDefault');
    BuiltValueNullFieldError.checkNotNull(logoheader, r'ThemingPublicCapabilities_Theming', 'logoheader');
    BuiltValueNullFieldError.checkNotNull(favicon, r'ThemingPublicCapabilities_Theming', 'favicon');
  }

  @override
  ThemingPublicCapabilities_Theming rebuild(void Function(ThemingPublicCapabilities_ThemingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingPublicCapabilities_ThemingBuilder toBuilder() => ThemingPublicCapabilities_ThemingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingPublicCapabilities_Theming &&
        name == other.name &&
        url == other.url &&
        slogan == other.slogan &&
        color == other.color &&
        colorText == other.colorText &&
        colorElement == other.colorElement &&
        colorElementBright == other.colorElementBright &&
        colorElementDark == other.colorElementDark &&
        logo == other.logo &&
        background == other.background &&
        backgroundPlain == other.backgroundPlain &&
        backgroundDefault == other.backgroundDefault &&
        logoheader == other.logoheader &&
        favicon == other.favicon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, slogan.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, colorText.hashCode);
    _$hash = $jc(_$hash, colorElement.hashCode);
    _$hash = $jc(_$hash, colorElementBright.hashCode);
    _$hash = $jc(_$hash, colorElementDark.hashCode);
    _$hash = $jc(_$hash, logo.hashCode);
    _$hash = $jc(_$hash, background.hashCode);
    _$hash = $jc(_$hash, backgroundPlain.hashCode);
    _$hash = $jc(_$hash, backgroundDefault.hashCode);
    _$hash = $jc(_$hash, logoheader.hashCode);
    _$hash = $jc(_$hash, favicon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingPublicCapabilities_Theming')
          ..add('name', name)
          ..add('url', url)
          ..add('slogan', slogan)
          ..add('color', color)
          ..add('colorText', colorText)
          ..add('colorElement', colorElement)
          ..add('colorElementBright', colorElementBright)
          ..add('colorElementDark', colorElementDark)
          ..add('logo', logo)
          ..add('background', background)
          ..add('backgroundPlain', backgroundPlain)
          ..add('backgroundDefault', backgroundDefault)
          ..add('logoheader', logoheader)
          ..add('favicon', favicon))
        .toString();
  }
}

class ThemingPublicCapabilities_ThemingBuilder
    implements Builder<ThemingPublicCapabilities_Theming, ThemingPublicCapabilities_ThemingBuilder> {
  _$ThemingPublicCapabilities_Theming? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _slogan;
  String? get slogan => _$this._slogan;
  set slogan(String? slogan) => _$this._slogan = slogan;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _colorText;
  String? get colorText => _$this._colorText;
  set colorText(String? colorText) => _$this._colorText = colorText;

  String? _colorElement;
  String? get colorElement => _$this._colorElement;
  set colorElement(String? colorElement) => _$this._colorElement = colorElement;

  String? _colorElementBright;
  String? get colorElementBright => _$this._colorElementBright;
  set colorElementBright(String? colorElementBright) => _$this._colorElementBright = colorElementBright;

  String? _colorElementDark;
  String? get colorElementDark => _$this._colorElementDark;
  set colorElementDark(String? colorElementDark) => _$this._colorElementDark = colorElementDark;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  String? _background;
  String? get background => _$this._background;
  set background(String? background) => _$this._background = background;

  bool? _backgroundPlain;
  bool? get backgroundPlain => _$this._backgroundPlain;
  set backgroundPlain(bool? backgroundPlain) => _$this._backgroundPlain = backgroundPlain;

  bool? _backgroundDefault;
  bool? get backgroundDefault => _$this._backgroundDefault;
  set backgroundDefault(bool? backgroundDefault) => _$this._backgroundDefault = backgroundDefault;

  String? _logoheader;
  String? get logoheader => _$this._logoheader;
  set logoheader(String? logoheader) => _$this._logoheader = logoheader;

  String? _favicon;
  String? get favicon => _$this._favicon;
  set favicon(String? favicon) => _$this._favicon = favicon;

  ThemingPublicCapabilities_ThemingBuilder();

  ThemingPublicCapabilities_ThemingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _slogan = $v.slogan;
      _color = $v.color;
      _colorText = $v.colorText;
      _colorElement = $v.colorElement;
      _colorElementBright = $v.colorElementBright;
      _colorElementDark = $v.colorElementDark;
      _logo = $v.logo;
      _background = $v.background;
      _backgroundPlain = $v.backgroundPlain;
      _backgroundDefault = $v.backgroundDefault;
      _logoheader = $v.logoheader;
      _favicon = $v.favicon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingPublicCapabilities_Theming other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingPublicCapabilities_Theming;
  }

  @override
  void update(void Function(ThemingPublicCapabilities_ThemingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingPublicCapabilities_Theming build() => _build();

  _$ThemingPublicCapabilities_Theming _build() {
    final _$result = _$v ??
        _$ThemingPublicCapabilities_Theming._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'ThemingPublicCapabilities_Theming', 'name'),
            url: BuiltValueNullFieldError.checkNotNull(url, r'ThemingPublicCapabilities_Theming', 'url'),
            slogan: BuiltValueNullFieldError.checkNotNull(slogan, r'ThemingPublicCapabilities_Theming', 'slogan'),
            color: BuiltValueNullFieldError.checkNotNull(color, r'ThemingPublicCapabilities_Theming', 'color'),
            colorText:
                BuiltValueNullFieldError.checkNotNull(colorText, r'ThemingPublicCapabilities_Theming', 'colorText'),
            colorElement: BuiltValueNullFieldError.checkNotNull(
                colorElement, r'ThemingPublicCapabilities_Theming', 'colorElement'),
            colorElementBright: BuiltValueNullFieldError.checkNotNull(
                colorElementBright, r'ThemingPublicCapabilities_Theming', 'colorElementBright'),
            colorElementDark: BuiltValueNullFieldError.checkNotNull(
                colorElementDark, r'ThemingPublicCapabilities_Theming', 'colorElementDark'),
            logo: BuiltValueNullFieldError.checkNotNull(logo, r'ThemingPublicCapabilities_Theming', 'logo'),
            background:
                BuiltValueNullFieldError.checkNotNull(background, r'ThemingPublicCapabilities_Theming', 'background'),
            backgroundPlain: BuiltValueNullFieldError.checkNotNull(
                backgroundPlain, r'ThemingPublicCapabilities_Theming', 'backgroundPlain'),
            backgroundDefault: BuiltValueNullFieldError.checkNotNull(
                backgroundDefault, r'ThemingPublicCapabilities_Theming', 'backgroundDefault'),
            logoheader:
                BuiltValueNullFieldError.checkNotNull(logoheader, r'ThemingPublicCapabilities_Theming', 'logoheader'),
            favicon: BuiltValueNullFieldError.checkNotNull(favicon, r'ThemingPublicCapabilities_Theming', 'favicon'));
    replace(_$result);
    return _$result;
  }
}

class _$ThemingPublicCapabilities extends ThemingPublicCapabilities {
  @override
  final ThemingPublicCapabilities_Theming theming;

  factory _$ThemingPublicCapabilities([void Function(ThemingPublicCapabilitiesBuilder)? updates]) =>
      (ThemingPublicCapabilitiesBuilder()..update(updates))._build();

  _$ThemingPublicCapabilities._({required this.theming}) : super._() {
    BuiltValueNullFieldError.checkNotNull(theming, r'ThemingPublicCapabilities', 'theming');
  }

  @override
  ThemingPublicCapabilities rebuild(void Function(ThemingPublicCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingPublicCapabilitiesBuilder toBuilder() => ThemingPublicCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingPublicCapabilities && theming == other.theming;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, theming.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingPublicCapabilities')..add('theming', theming)).toString();
  }
}

class ThemingPublicCapabilitiesBuilder implements Builder<ThemingPublicCapabilities, ThemingPublicCapabilitiesBuilder> {
  _$ThemingPublicCapabilities? _$v;

  ThemingPublicCapabilities_ThemingBuilder? _theming;
  ThemingPublicCapabilities_ThemingBuilder get theming =>
      _$this._theming ??= ThemingPublicCapabilities_ThemingBuilder();
  set theming(ThemingPublicCapabilities_ThemingBuilder? theming) => _$this._theming = theming;

  ThemingPublicCapabilitiesBuilder();

  ThemingPublicCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _theming = $v.theming.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemingPublicCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingPublicCapabilities;
  }

  @override
  void update(void Function(ThemingPublicCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingPublicCapabilities build() => _build();

  _$ThemingPublicCapabilities _build() {
    _$ThemingPublicCapabilities _$result;
    try {
      _$result = _$v ?? _$ThemingPublicCapabilities._(theming: theming.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'theming';
        theming.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ThemingPublicCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
