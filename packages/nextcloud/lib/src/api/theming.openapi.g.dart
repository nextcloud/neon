// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theming.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ThemingThemingGetManifestResponseApplicationJson_Icons>
    _$themingThemingGetManifestResponseApplicationJsonIconsSerializer =
    _$ThemingThemingGetManifestResponseApplicationJson_IconsSerializer();
Serializer<ThemingThemingGetManifestResponseApplicationJson>
    _$themingThemingGetManifestResponseApplicationJsonSerializer =
    _$ThemingThemingGetManifestResponseApplicationJsonSerializer();
Serializer<ThemingBackground> _$themingBackgroundSerializer = _$ThemingBackgroundSerializer();
Serializer<ThemingOCSMeta> _$themingOCSMetaSerializer = _$ThemingOCSMetaSerializer();
Serializer<ThemingUserThemeEnableThemeResponseApplicationJson_Ocs>
    _$themingUserThemeEnableThemeResponseApplicationJsonOcsSerializer =
    _$ThemingUserThemeEnableThemeResponseApplicationJson_OcsSerializer();
Serializer<ThemingUserThemeEnableThemeResponseApplicationJson>
    _$themingUserThemeEnableThemeResponseApplicationJsonSerializer =
    _$ThemingUserThemeEnableThemeResponseApplicationJsonSerializer();
Serializer<ThemingUserThemeDisableThemeResponseApplicationJson_Ocs>
    _$themingUserThemeDisableThemeResponseApplicationJsonOcsSerializer =
    _$ThemingUserThemeDisableThemeResponseApplicationJson_OcsSerializer();
Serializer<ThemingUserThemeDisableThemeResponseApplicationJson>
    _$themingUserThemeDisableThemeResponseApplicationJsonSerializer =
    _$ThemingUserThemeDisableThemeResponseApplicationJsonSerializer();
Serializer<ThemingPublicCapabilities_Theming> _$themingPublicCapabilitiesThemingSerializer =
    _$ThemingPublicCapabilities_ThemingSerializer();
Serializer<ThemingPublicCapabilities> _$themingPublicCapabilitiesSerializer = _$ThemingPublicCapabilitiesSerializer();

class _$ThemingThemingGetManifestResponseApplicationJson_IconsSerializer
    implements StructuredSerializer<ThemingThemingGetManifestResponseApplicationJson_Icons> {
  @override
  final Iterable<Type> types = const [
    ThemingThemingGetManifestResponseApplicationJson_Icons,
    _$ThemingThemingGetManifestResponseApplicationJson_Icons
  ];
  @override
  final String wireName = 'ThemingThemingGetManifestResponseApplicationJson_Icons';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingThemingGetManifestResponseApplicationJson_Icons object,
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
  ThemingThemingGetManifestResponseApplicationJson_Icons deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingThemingGetManifestResponseApplicationJson_IconsBuilder();

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

class _$ThemingThemingGetManifestResponseApplicationJsonSerializer
    implements StructuredSerializer<ThemingThemingGetManifestResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ThemingThemingGetManifestResponseApplicationJson,
    _$ThemingThemingGetManifestResponseApplicationJson
  ];
  @override
  final String wireName = 'ThemingThemingGetManifestResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingThemingGetManifestResponseApplicationJson object,
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
          specifiedType: const FullType(BuiltList, [FullType(ThemingThemingGetManifestResponseApplicationJson_Icons)])),
      'display',
      serializers.serialize(object.display, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ThemingThemingGetManifestResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingThemingGetManifestResponseApplicationJsonBuilder();

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
                      const FullType(BuiltList, [FullType(ThemingThemingGetManifestResponseApplicationJson_Icons)]))!
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

class _$ThemingUserThemeEnableThemeResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ThemingUserThemeEnableThemeResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeEnableThemeResponseApplicationJson_Ocs,
    _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ThemingUserThemeEnableThemeResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeEnableThemeResponseApplicationJson_Ocs object,
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
  ThemingUserThemeEnableThemeResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder();

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

class _$ThemingUserThemeEnableThemeResponseApplicationJsonSerializer
    implements StructuredSerializer<ThemingUserThemeEnableThemeResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeEnableThemeResponseApplicationJson,
    _$ThemingUserThemeEnableThemeResponseApplicationJson
  ];
  @override
  final String wireName = 'ThemingUserThemeEnableThemeResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeEnableThemeResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(ThemingUserThemeEnableThemeResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ThemingUserThemeEnableThemeResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeEnableThemeResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ThemingUserThemeEnableThemeResponseApplicationJson_Ocs))!
              as ThemingUserThemeEnableThemeResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ThemingUserThemeDisableThemeResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ThemingUserThemeDisableThemeResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeDisableThemeResponseApplicationJson_Ocs,
    _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ThemingUserThemeDisableThemeResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeDisableThemeResponseApplicationJson_Ocs object,
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
  ThemingUserThemeDisableThemeResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder();

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

class _$ThemingUserThemeDisableThemeResponseApplicationJsonSerializer
    implements StructuredSerializer<ThemingUserThemeDisableThemeResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ThemingUserThemeDisableThemeResponseApplicationJson,
    _$ThemingUserThemeDisableThemeResponseApplicationJson
  ];
  @override
  final String wireName = 'ThemingUserThemeDisableThemeResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemingUserThemeDisableThemeResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(ThemingUserThemeDisableThemeResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ThemingUserThemeDisableThemeResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThemingUserThemeDisableThemeResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ThemingUserThemeDisableThemeResponseApplicationJson_Ocs))!
              as ThemingUserThemeDisableThemeResponseApplicationJson_Ocs);
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

abstract mixin class ThemingThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder {
  void replace(ThemingThemingGetManifestResponseApplicationJson_IconsInterface other);
  void update(void Function(ThemingThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder) updates);
  String? get src;
  set src(String? src);

  String? get type;
  set type(String? type);

  String? get sizes;
  set sizes(String? sizes);
}

class _$ThemingThemingGetManifestResponseApplicationJson_Icons
    extends ThemingThemingGetManifestResponseApplicationJson_Icons {
  @override
  final String src;
  @override
  final String type;
  @override
  final String sizes;

  factory _$ThemingThemingGetManifestResponseApplicationJson_Icons(
          [void Function(ThemingThemingGetManifestResponseApplicationJson_IconsBuilder)? updates]) =>
      (ThemingThemingGetManifestResponseApplicationJson_IconsBuilder()..update(updates))._build();

  _$ThemingThemingGetManifestResponseApplicationJson_Icons._(
      {required this.src, required this.type, required this.sizes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(src, r'ThemingThemingGetManifestResponseApplicationJson_Icons', 'src');
    BuiltValueNullFieldError.checkNotNull(type, r'ThemingThemingGetManifestResponseApplicationJson_Icons', 'type');
    BuiltValueNullFieldError.checkNotNull(sizes, r'ThemingThemingGetManifestResponseApplicationJson_Icons', 'sizes');
  }

  @override
  ThemingThemingGetManifestResponseApplicationJson_Icons rebuild(
          void Function(ThemingThemingGetManifestResponseApplicationJson_IconsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingThemingGetManifestResponseApplicationJson_IconsBuilder toBuilder() =>
      ThemingThemingGetManifestResponseApplicationJson_IconsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingThemingGetManifestResponseApplicationJson_Icons &&
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
    return (newBuiltValueToStringHelper(r'ThemingThemingGetManifestResponseApplicationJson_Icons')
          ..add('src', src)
          ..add('type', type)
          ..add('sizes', sizes))
        .toString();
  }
}

class ThemingThemingGetManifestResponseApplicationJson_IconsBuilder
    implements
        Builder<ThemingThemingGetManifestResponseApplicationJson_Icons,
            ThemingThemingGetManifestResponseApplicationJson_IconsBuilder>,
        ThemingThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder {
  _$ThemingThemingGetManifestResponseApplicationJson_Icons? _$v;

  String? _src;
  String? get src => _$this._src;
  set src(covariant String? src) => _$this._src = src;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _sizes;
  String? get sizes => _$this._sizes;
  set sizes(covariant String? sizes) => _$this._sizes = sizes;

  ThemingThemingGetManifestResponseApplicationJson_IconsBuilder();

  ThemingThemingGetManifestResponseApplicationJson_IconsBuilder get _$this {
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
  void replace(covariant ThemingThemingGetManifestResponseApplicationJson_Icons other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingThemingGetManifestResponseApplicationJson_Icons;
  }

  @override
  void update(void Function(ThemingThemingGetManifestResponseApplicationJson_IconsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingThemingGetManifestResponseApplicationJson_Icons build() => _build();

  _$ThemingThemingGetManifestResponseApplicationJson_Icons _build() {
    final _$result = _$v ??
        _$ThemingThemingGetManifestResponseApplicationJson_Icons._(
            src: BuiltValueNullFieldError.checkNotNull(
                src, r'ThemingThemingGetManifestResponseApplicationJson_Icons', 'src'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ThemingThemingGetManifestResponseApplicationJson_Icons', 'type'),
            sizes: BuiltValueNullFieldError.checkNotNull(
                sizes, r'ThemingThemingGetManifestResponseApplicationJson_Icons', 'sizes'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingThemingGetManifestResponseApplicationJsonInterfaceBuilder {
  void replace(ThemingThemingGetManifestResponseApplicationJsonInterface other);
  void update(void Function(ThemingThemingGetManifestResponseApplicationJsonInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get shortName;
  set shortName(String? shortName);

  String? get startUrl;
  set startUrl(String? startUrl);

  String? get themeColor;
  set themeColor(String? themeColor);

  String? get backgroundColor;
  set backgroundColor(String? backgroundColor);

  String? get description;
  set description(String? description);

  ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons> get icons;
  set icons(ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons>? icons);

  String? get display;
  set display(String? display);
}

class _$ThemingThemingGetManifestResponseApplicationJson extends ThemingThemingGetManifestResponseApplicationJson {
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
  final BuiltList<ThemingThemingGetManifestResponseApplicationJson_Icons> icons;
  @override
  final String display;

  factory _$ThemingThemingGetManifestResponseApplicationJson(
          [void Function(ThemingThemingGetManifestResponseApplicationJsonBuilder)? updates]) =>
      (ThemingThemingGetManifestResponseApplicationJsonBuilder()..update(updates))._build();

  _$ThemingThemingGetManifestResponseApplicationJson._(
      {required this.name,
      required this.shortName,
      required this.startUrl,
      required this.themeColor,
      required this.backgroundColor,
      required this.description,
      required this.icons,
      required this.display})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ThemingThemingGetManifestResponseApplicationJson', 'name');
    BuiltValueNullFieldError.checkNotNull(shortName, r'ThemingThemingGetManifestResponseApplicationJson', 'shortName');
    BuiltValueNullFieldError.checkNotNull(startUrl, r'ThemingThemingGetManifestResponseApplicationJson', 'startUrl');
    BuiltValueNullFieldError.checkNotNull(
        themeColor, r'ThemingThemingGetManifestResponseApplicationJson', 'themeColor');
    BuiltValueNullFieldError.checkNotNull(
        backgroundColor, r'ThemingThemingGetManifestResponseApplicationJson', 'backgroundColor');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ThemingThemingGetManifestResponseApplicationJson', 'description');
    BuiltValueNullFieldError.checkNotNull(icons, r'ThemingThemingGetManifestResponseApplicationJson', 'icons');
    BuiltValueNullFieldError.checkNotNull(display, r'ThemingThemingGetManifestResponseApplicationJson', 'display');
  }

  @override
  ThemingThemingGetManifestResponseApplicationJson rebuild(
          void Function(ThemingThemingGetManifestResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingThemingGetManifestResponseApplicationJsonBuilder toBuilder() =>
      ThemingThemingGetManifestResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingThemingGetManifestResponseApplicationJson &&
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
    return (newBuiltValueToStringHelper(r'ThemingThemingGetManifestResponseApplicationJson')
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

class ThemingThemingGetManifestResponseApplicationJsonBuilder
    implements
        Builder<ThemingThemingGetManifestResponseApplicationJson,
            ThemingThemingGetManifestResponseApplicationJsonBuilder>,
        ThemingThemingGetManifestResponseApplicationJsonInterfaceBuilder {
  _$ThemingThemingGetManifestResponseApplicationJson? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _shortName;
  String? get shortName => _$this._shortName;
  set shortName(covariant String? shortName) => _$this._shortName = shortName;

  String? _startUrl;
  String? get startUrl => _$this._startUrl;
  set startUrl(covariant String? startUrl) => _$this._startUrl = startUrl;

  String? _themeColor;
  String? get themeColor => _$this._themeColor;
  set themeColor(covariant String? themeColor) => _$this._themeColor = themeColor;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(covariant String? backgroundColor) => _$this._backgroundColor = backgroundColor;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons>? _icons;
  ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons> get icons =>
      _$this._icons ??= ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons>();
  set icons(covariant ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons>? icons) =>
      _$this._icons = icons;

  String? _display;
  String? get display => _$this._display;
  set display(covariant String? display) => _$this._display = display;

  ThemingThemingGetManifestResponseApplicationJsonBuilder();

  ThemingThemingGetManifestResponseApplicationJsonBuilder get _$this {
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
  void replace(covariant ThemingThemingGetManifestResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingThemingGetManifestResponseApplicationJson;
  }

  @override
  void update(void Function(ThemingThemingGetManifestResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingThemingGetManifestResponseApplicationJson build() => _build();

  _$ThemingThemingGetManifestResponseApplicationJson _build() {
    _$ThemingThemingGetManifestResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          _$ThemingThemingGetManifestResponseApplicationJson._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ThemingThemingGetManifestResponseApplicationJson', 'name'),
              shortName: BuiltValueNullFieldError.checkNotNull(
                  shortName, r'ThemingThemingGetManifestResponseApplicationJson', 'shortName'),
              startUrl: BuiltValueNullFieldError.checkNotNull(
                  startUrl, r'ThemingThemingGetManifestResponseApplicationJson', 'startUrl'),
              themeColor: BuiltValueNullFieldError.checkNotNull(
                  themeColor, r'ThemingThemingGetManifestResponseApplicationJson', 'themeColor'),
              backgroundColor: BuiltValueNullFieldError.checkNotNull(
                  backgroundColor, r'ThemingThemingGetManifestResponseApplicationJson', 'backgroundColor'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ThemingThemingGetManifestResponseApplicationJson', 'description'),
              icons: icons.build(),
              display: BuiltValueNullFieldError.checkNotNull(
                  display, r'ThemingThemingGetManifestResponseApplicationJson', 'display'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'icons';
        icons.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingThemingGetManifestResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingBackgroundInterfaceBuilder {
  void replace(ThemingBackgroundInterface other);
  void update(void Function(ThemingBackgroundInterfaceBuilder) updates);
  String? get backgroundImage;
  set backgroundImage(String? backgroundImage);

  String? get backgroundColor;
  set backgroundColor(String? backgroundColor);

  int? get version;
  set version(int? version);
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

class ThemingBackgroundBuilder
    implements Builder<ThemingBackground, ThemingBackgroundBuilder>, ThemingBackgroundInterfaceBuilder {
  _$ThemingBackground? _$v;

  String? _backgroundImage;
  String? get backgroundImage => _$this._backgroundImage;
  set backgroundImage(covariant String? backgroundImage) => _$this._backgroundImage = backgroundImage;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(covariant String? backgroundColor) => _$this._backgroundColor = backgroundColor;

  int? _version;
  int? get version => _$this._version;
  set version(covariant int? version) => _$this._version = version;

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
  void replace(covariant ThemingBackground other) {
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

abstract mixin class ThemingOCSMetaInterfaceBuilder {
  void replace(ThemingOCSMetaInterface other);
  void update(void Function(ThemingOCSMetaInterfaceBuilder) updates);
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

class ThemingOCSMetaBuilder implements Builder<ThemingOCSMeta, ThemingOCSMetaBuilder>, ThemingOCSMetaInterfaceBuilder {
  _$ThemingOCSMeta? _$v;

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
  void replace(covariant ThemingOCSMeta other) {
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

abstract mixin class ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterface other);
  void update(void Function(ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder) updates);
  ThemingOCSMetaBuilder get meta;
  set meta(ThemingOCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs
    extends ThemingUserThemeEnableThemeResponseApplicationJson_Ocs {
  @override
  final ThemingOCSMeta meta;
  @override
  final JsonObject data;

  factory _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs(
          [void Function(ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder)? updates]) =>
      (ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ThemingUserThemeEnableThemeResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ThemingUserThemeEnableThemeResponseApplicationJson_Ocs', 'data');
  }

  @override
  ThemingUserThemeEnableThemeResponseApplicationJson_Ocs rebuild(
          void Function(ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder toBuilder() =>
      ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeEnableThemeResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeEnableThemeResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder
    implements
        Builder<ThemingUserThemeEnableThemeResponseApplicationJson_Ocs,
            ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder>,
        ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder {
  _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs? _$v;

  ThemingOCSMetaBuilder? _meta;
  ThemingOCSMetaBuilder get meta => _$this._meta ??= ThemingOCSMetaBuilder();
  set meta(covariant ThemingOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder();

  ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingUserThemeEnableThemeResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeEnableThemeResponseApplicationJson_Ocs build() => _build();

  _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs _build() {
    _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'ThemingUserThemeEnableThemeResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeEnableThemeResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingUserThemeEnableThemeResponseApplicationJsonInterfaceBuilder {
  void replace(ThemingUserThemeEnableThemeResponseApplicationJsonInterface other);
  void update(void Function(ThemingUserThemeEnableThemeResponseApplicationJsonInterfaceBuilder) updates);
  ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder? ocs);
}

class _$ThemingUserThemeEnableThemeResponseApplicationJson extends ThemingUserThemeEnableThemeResponseApplicationJson {
  @override
  final ThemingUserThemeEnableThemeResponseApplicationJson_Ocs ocs;

  factory _$ThemingUserThemeEnableThemeResponseApplicationJson(
          [void Function(ThemingUserThemeEnableThemeResponseApplicationJsonBuilder)? updates]) =>
      (ThemingUserThemeEnableThemeResponseApplicationJsonBuilder()..update(updates))._build();

  _$ThemingUserThemeEnableThemeResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ThemingUserThemeEnableThemeResponseApplicationJson', 'ocs');
  }

  @override
  ThemingUserThemeEnableThemeResponseApplicationJson rebuild(
          void Function(ThemingUserThemeEnableThemeResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeEnableThemeResponseApplicationJsonBuilder toBuilder() =>
      ThemingUserThemeEnableThemeResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeEnableThemeResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeEnableThemeResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class ThemingUserThemeEnableThemeResponseApplicationJsonBuilder
    implements
        Builder<ThemingUserThemeEnableThemeResponseApplicationJson,
            ThemingUserThemeEnableThemeResponseApplicationJsonBuilder>,
        ThemingUserThemeEnableThemeResponseApplicationJsonInterfaceBuilder {
  _$ThemingUserThemeEnableThemeResponseApplicationJson? _$v;

  ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder? _ocs;
  ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder();
  set ocs(covariant ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ThemingUserThemeEnableThemeResponseApplicationJsonBuilder();

  ThemingUserThemeEnableThemeResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingUserThemeEnableThemeResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeEnableThemeResponseApplicationJson;
  }

  @override
  void update(void Function(ThemingUserThemeEnableThemeResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeEnableThemeResponseApplicationJson build() => _build();

  _$ThemingUserThemeEnableThemeResponseApplicationJson _build() {
    _$ThemingUserThemeEnableThemeResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ThemingUserThemeEnableThemeResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeEnableThemeResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterface other);
  void update(void Function(ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder) updates);
  ThemingOCSMetaBuilder get meta;
  set meta(ThemingOCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs
    extends ThemingUserThemeDisableThemeResponseApplicationJson_Ocs {
  @override
  final ThemingOCSMeta meta;
  @override
  final JsonObject data;

  factory _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs(
          [void Function(ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder)? updates]) =>
      (ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ThemingUserThemeDisableThemeResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ThemingUserThemeDisableThemeResponseApplicationJson_Ocs', 'data');
  }

  @override
  ThemingUserThemeDisableThemeResponseApplicationJson_Ocs rebuild(
          void Function(ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder toBuilder() =>
      ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeDisableThemeResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeDisableThemeResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder
    implements
        Builder<ThemingUserThemeDisableThemeResponseApplicationJson_Ocs,
            ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder>,
        ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder {
  _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs? _$v;

  ThemingOCSMetaBuilder? _meta;
  ThemingOCSMetaBuilder get meta => _$this._meta ??= ThemingOCSMetaBuilder();
  set meta(covariant ThemingOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder();

  ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingUserThemeDisableThemeResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeDisableThemeResponseApplicationJson_Ocs build() => _build();

  _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs _build() {
    _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'ThemingUserThemeDisableThemeResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeDisableThemeResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingUserThemeDisableThemeResponseApplicationJsonInterfaceBuilder {
  void replace(ThemingUserThemeDisableThemeResponseApplicationJsonInterface other);
  void update(void Function(ThemingUserThemeDisableThemeResponseApplicationJsonInterfaceBuilder) updates);
  ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder? ocs);
}

class _$ThemingUserThemeDisableThemeResponseApplicationJson
    extends ThemingUserThemeDisableThemeResponseApplicationJson {
  @override
  final ThemingUserThemeDisableThemeResponseApplicationJson_Ocs ocs;

  factory _$ThemingUserThemeDisableThemeResponseApplicationJson(
          [void Function(ThemingUserThemeDisableThemeResponseApplicationJsonBuilder)? updates]) =>
      (ThemingUserThemeDisableThemeResponseApplicationJsonBuilder()..update(updates))._build();

  _$ThemingUserThemeDisableThemeResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ThemingUserThemeDisableThemeResponseApplicationJson', 'ocs');
  }

  @override
  ThemingUserThemeDisableThemeResponseApplicationJson rebuild(
          void Function(ThemingUserThemeDisableThemeResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingUserThemeDisableThemeResponseApplicationJsonBuilder toBuilder() =>
      ThemingUserThemeDisableThemeResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingUserThemeDisableThemeResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ThemingUserThemeDisableThemeResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class ThemingUserThemeDisableThemeResponseApplicationJsonBuilder
    implements
        Builder<ThemingUserThemeDisableThemeResponseApplicationJson,
            ThemingUserThemeDisableThemeResponseApplicationJsonBuilder>,
        ThemingUserThemeDisableThemeResponseApplicationJsonInterfaceBuilder {
  _$ThemingUserThemeDisableThemeResponseApplicationJson? _$v;

  ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder? _ocs;
  ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder();
  set ocs(covariant ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ThemingUserThemeDisableThemeResponseApplicationJsonBuilder();

  ThemingUserThemeDisableThemeResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingUserThemeDisableThemeResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingUserThemeDisableThemeResponseApplicationJson;
  }

  @override
  void update(void Function(ThemingUserThemeDisableThemeResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingUserThemeDisableThemeResponseApplicationJson build() => _build();

  _$ThemingUserThemeDisableThemeResponseApplicationJson _build() {
    _$ThemingUserThemeDisableThemeResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ThemingUserThemeDisableThemeResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ThemingUserThemeDisableThemeResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingPublicCapabilities_ThemingInterfaceBuilder {
  void replace(ThemingPublicCapabilities_ThemingInterface other);
  void update(void Function(ThemingPublicCapabilities_ThemingInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get url;
  set url(String? url);

  String? get slogan;
  set slogan(String? slogan);

  String? get color;
  set color(String? color);

  String? get colorText;
  set colorText(String? colorText);

  String? get colorElement;
  set colorElement(String? colorElement);

  String? get colorElementBright;
  set colorElementBright(String? colorElementBright);

  String? get colorElementDark;
  set colorElementDark(String? colorElementDark);

  String? get logo;
  set logo(String? logo);

  String? get background;
  set background(String? background);

  bool? get backgroundPlain;
  set backgroundPlain(bool? backgroundPlain);

  bool? get backgroundDefault;
  set backgroundDefault(bool? backgroundDefault);

  String? get logoheader;
  set logoheader(String? logoheader);

  String? get favicon;
  set favicon(String? favicon);
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
    implements
        Builder<ThemingPublicCapabilities_Theming, ThemingPublicCapabilities_ThemingBuilder>,
        ThemingPublicCapabilities_ThemingInterfaceBuilder {
  _$ThemingPublicCapabilities_Theming? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _slogan;
  String? get slogan => _$this._slogan;
  set slogan(covariant String? slogan) => _$this._slogan = slogan;

  String? _color;
  String? get color => _$this._color;
  set color(covariant String? color) => _$this._color = color;

  String? _colorText;
  String? get colorText => _$this._colorText;
  set colorText(covariant String? colorText) => _$this._colorText = colorText;

  String? _colorElement;
  String? get colorElement => _$this._colorElement;
  set colorElement(covariant String? colorElement) => _$this._colorElement = colorElement;

  String? _colorElementBright;
  String? get colorElementBright => _$this._colorElementBright;
  set colorElementBright(covariant String? colorElementBright) => _$this._colorElementBright = colorElementBright;

  String? _colorElementDark;
  String? get colorElementDark => _$this._colorElementDark;
  set colorElementDark(covariant String? colorElementDark) => _$this._colorElementDark = colorElementDark;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(covariant String? logo) => _$this._logo = logo;

  String? _background;
  String? get background => _$this._background;
  set background(covariant String? background) => _$this._background = background;

  bool? _backgroundPlain;
  bool? get backgroundPlain => _$this._backgroundPlain;
  set backgroundPlain(covariant bool? backgroundPlain) => _$this._backgroundPlain = backgroundPlain;

  bool? _backgroundDefault;
  bool? get backgroundDefault => _$this._backgroundDefault;
  set backgroundDefault(covariant bool? backgroundDefault) => _$this._backgroundDefault = backgroundDefault;

  String? _logoheader;
  String? get logoheader => _$this._logoheader;
  set logoheader(covariant String? logoheader) => _$this._logoheader = logoheader;

  String? _favicon;
  String? get favicon => _$this._favicon;
  set favicon(covariant String? favicon) => _$this._favicon = favicon;

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
  void replace(covariant ThemingPublicCapabilities_Theming other) {
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

abstract mixin class ThemingPublicCapabilitiesInterfaceBuilder {
  void replace(ThemingPublicCapabilitiesInterface other);
  void update(void Function(ThemingPublicCapabilitiesInterfaceBuilder) updates);
  ThemingPublicCapabilities_ThemingBuilder get theming;
  set theming(ThemingPublicCapabilities_ThemingBuilder? theming);
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

class ThemingPublicCapabilitiesBuilder
    implements
        Builder<ThemingPublicCapabilities, ThemingPublicCapabilitiesBuilder>,
        ThemingPublicCapabilitiesInterfaceBuilder {
  _$ThemingPublicCapabilities? _$v;

  ThemingPublicCapabilities_ThemingBuilder? _theming;
  ThemingPublicCapabilities_ThemingBuilder get theming =>
      _$this._theming ??= ThemingPublicCapabilities_ThemingBuilder();
  set theming(covariant ThemingPublicCapabilities_ThemingBuilder? theming) => _$this._theming = theming;

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
  void replace(covariant ThemingPublicCapabilities other) {
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
