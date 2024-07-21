// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_status.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherStatusSetModeRequestApplicationJson> _$weatherStatusSetModeRequestApplicationJsonSerializer =
    _$WeatherStatusSetModeRequestApplicationJsonSerializer();
Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<Success> _$successSerializer = _$SuccessSerializer();
Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs> _$weatherStatusSetModeResponseApplicationJsonOcsSerializer =
    _$WeatherStatusSetModeResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusSetModeResponseApplicationJson> _$weatherStatusSetModeResponseApplicationJsonSerializer =
    _$WeatherStatusSetModeResponseApplicationJsonSerializer();
Serializer<Location> _$locationSerializer = _$LocationSerializer();
Serializer<LocationWithSuccess> _$locationWithSuccessSerializer = _$LocationWithSuccessSerializer();
Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs>
    _$weatherStatusUsePersonalAddressResponseApplicationJsonOcsSerializer =
    _$WeatherStatusUsePersonalAddressResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson>
    _$weatherStatusUsePersonalAddressResponseApplicationJsonSerializer =
    _$WeatherStatusUsePersonalAddressResponseApplicationJsonSerializer();
Serializer<Mode> _$modeSerializer = _$ModeSerializer();
Serializer<LocationWithMode> _$locationWithModeSerializer = _$LocationWithModeSerializer();
Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs>
    _$weatherStatusGetLocationResponseApplicationJsonOcsSerializer =
    _$WeatherStatusGetLocationResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusGetLocationResponseApplicationJson>
    _$weatherStatusGetLocationResponseApplicationJsonSerializer =
    _$WeatherStatusGetLocationResponseApplicationJsonSerializer();
Serializer<WeatherStatusSetLocationRequestApplicationJson> _$weatherStatusSetLocationRequestApplicationJsonSerializer =
    _$WeatherStatusSetLocationRequestApplicationJsonSerializer();
Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs>
    _$weatherStatusSetLocationResponseApplicationJsonOcsSerializer =
    _$WeatherStatusSetLocationResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusSetLocationResponseApplicationJson>
    _$weatherStatusSetLocationResponseApplicationJsonSerializer =
    _$WeatherStatusSetLocationResponseApplicationJsonSerializer();
Serializer<Forecast_Data_Instant_Details> _$forecastDataInstantDetailsSerializer =
    _$Forecast_Data_Instant_DetailsSerializer();
Serializer<Forecast_Data_Instant> _$forecastDataInstantSerializer = _$Forecast_Data_InstantSerializer();
Serializer<Forecast_Data_Next12Hours_Summary> _$forecastDataNext12HoursSummarySerializer =
    _$Forecast_Data_Next12Hours_SummarySerializer();
Serializer<Forecast_Data_Next12Hours_Details> _$forecastDataNext12HoursDetailsSerializer =
    _$Forecast_Data_Next12Hours_DetailsSerializer();
Serializer<Forecast_Data_Next12Hours> _$forecastDataNext12HoursSerializer = _$Forecast_Data_Next12HoursSerializer();
Serializer<Forecast_Data_Next1Hours_Summary> _$forecastDataNext1HoursSummarySerializer =
    _$Forecast_Data_Next1Hours_SummarySerializer();
Serializer<Forecast_Data_Next1Hours_Details> _$forecastDataNext1HoursDetailsSerializer =
    _$Forecast_Data_Next1Hours_DetailsSerializer();
Serializer<Forecast_Data_Next1Hours> _$forecastDataNext1HoursSerializer = _$Forecast_Data_Next1HoursSerializer();
Serializer<Forecast_Data_Next6Hours_Summary> _$forecastDataNext6HoursSummarySerializer =
    _$Forecast_Data_Next6Hours_SummarySerializer();
Serializer<Forecast_Data_Next6Hours_Details> _$forecastDataNext6HoursDetailsSerializer =
    _$Forecast_Data_Next6Hours_DetailsSerializer();
Serializer<Forecast_Data_Next6Hours> _$forecastDataNext6HoursSerializer = _$Forecast_Data_Next6HoursSerializer();
Serializer<Forecast_Data> _$forecastDataSerializer = _$Forecast_DataSerializer();
Serializer<Forecast> _$forecastSerializer = _$ForecastSerializer();
Serializer<WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1>
    _$weatherStatusGetForecastResponseApplicationJsonOcsData1Serializer =
    _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Serializer();
Serializer<WeatherStatusGetForecastResponseApplicationJson_Ocs>
    _$weatherStatusGetForecastResponseApplicationJsonOcsSerializer =
    _$WeatherStatusGetForecastResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusGetForecastResponseApplicationJson>
    _$weatherStatusGetForecastResponseApplicationJsonSerializer =
    _$WeatherStatusGetForecastResponseApplicationJsonSerializer();
Serializer<WeatherStatusGetFavoritesResponseApplicationJson_Ocs>
    _$weatherStatusGetFavoritesResponseApplicationJsonOcsSerializer =
    _$WeatherStatusGetFavoritesResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusGetFavoritesResponseApplicationJson>
    _$weatherStatusGetFavoritesResponseApplicationJsonSerializer =
    _$WeatherStatusGetFavoritesResponseApplicationJsonSerializer();
Serializer<WeatherStatusSetFavoritesRequestApplicationJson>
    _$weatherStatusSetFavoritesRequestApplicationJsonSerializer =
    _$WeatherStatusSetFavoritesRequestApplicationJsonSerializer();
Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs>
    _$weatherStatusSetFavoritesResponseApplicationJsonOcsSerializer =
    _$WeatherStatusSetFavoritesResponseApplicationJson_OcsSerializer();
Serializer<WeatherStatusSetFavoritesResponseApplicationJson>
    _$weatherStatusSetFavoritesResponseApplicationJsonSerializer =
    _$WeatherStatusSetFavoritesResponseApplicationJsonSerializer();
Serializer<Capabilities_WeatherStatus> _$capabilitiesWeatherStatusSerializer = _$Capabilities_WeatherStatusSerializer();
Serializer<Capabilities> _$capabilitiesSerializer = _$CapabilitiesSerializer();

class _$WeatherStatusSetModeRequestApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetModeRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetModeRequestApplicationJson,
    _$WeatherStatusSetModeRequestApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusSetModeRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetModeRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'mode',
      serializers.serialize(object.mode, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  WeatherStatusSetModeRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetModeRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mode':
          result.mode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

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

class _$SuccessSerializer implements StructuredSerializer<Success> {
  @override
  final Iterable<Type> types = const [Success, _$Success];
  @override
  final String wireName = 'Success';

  @override
  Iterable<Object?> serialize(Serializers serializers, Success object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Success deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetModeResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusSetModeResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetModeResponseApplicationJson_Ocs,
    _$WeatherStatusSetModeResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusSetModeResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetModeResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Success)),
    ];

    return result;
  }

  @override
  WeatherStatusSetModeResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetModeResponseApplicationJson_OcsBuilder();

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
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(Success))! as Success);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetModeResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetModeResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetModeResponseApplicationJson,
    _$WeatherStatusSetModeResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusSetModeResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetModeResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusSetModeResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetModeResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs))!
              as WeatherStatusSetModeResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable<Object?> serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Location deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationWithSuccessSerializer implements StructuredSerializer<LocationWithSuccess> {
  @override
  final Iterable<Type> types = const [LocationWithSuccess, _$LocationWithSuccess];
  @override
  final String wireName = 'LocationWithSuccess';

  @override
  Iterable<Object?> serialize(Serializers serializers, LocationWithSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LocationWithSuccess deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = LocationWithSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
    _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(LocationWithSuccess)),
    ];

    return result;
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder();

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
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(LocationWithSuccess))!
              as LocationWithSuccess);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusUsePersonalAddressResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusUsePersonalAddressResponseApplicationJson,
    _$WeatherStatusUsePersonalAddressResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusUsePersonalAddressResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusUsePersonalAddressResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs))!
              as WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ModeSerializer implements StructuredSerializer<Mode> {
  @override
  final Iterable<Type> types = const [Mode, _$Mode];
  @override
  final String wireName = 'Mode';

  @override
  Iterable<Object?> serialize(Serializers serializers, Mode object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'mode',
      serializers.serialize(object.mode, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Mode deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ModeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mode':
          result.mode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationWithModeSerializer implements StructuredSerializer<LocationWithMode> {
  @override
  final Iterable<Type> types = const [LocationWithMode, _$LocationWithMode];
  @override
  final String wireName = 'LocationWithMode';

  @override
  Iterable<Object?> serialize(Serializers serializers, LocationWithMode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'mode',
      serializers.serialize(object.mode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LocationWithMode deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = LocationWithModeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'mode':
          result.mode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetLocationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusGetLocationResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetLocationResponseApplicationJson_Ocs,
    _$WeatherStatusGetLocationResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusGetLocationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetLocationResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(LocationWithMode)),
    ];

    return result;
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetLocationResponseApplicationJson_OcsBuilder();

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
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(LocationWithMode))! as LocationWithMode);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetLocationResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusGetLocationResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetLocationResponseApplicationJson,
    _$WeatherStatusGetLocationResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusGetLocationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetLocationResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetLocationResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs))!
              as WeatherStatusGetLocationResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetLocationRequestApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetLocationRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetLocationRequestApplicationJson,
    _$WeatherStatusSetLocationRequestApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusSetLocationRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetLocationRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value, specifiedType: const FullType(double)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value, specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  WeatherStatusSetLocationRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetLocationRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(double)) as double?;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetLocationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusSetLocationResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetLocationResponseApplicationJson_Ocs,
    _$WeatherStatusSetLocationResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusSetLocationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetLocationResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(LocationWithSuccess)),
    ];

    return result;
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetLocationResponseApplicationJson_OcsBuilder();

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
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(LocationWithSuccess))!
              as LocationWithSuccess);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetLocationResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetLocationResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetLocationResponseApplicationJson,
    _$WeatherStatusSetLocationResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusSetLocationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetLocationResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetLocationResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs))!
              as WeatherStatusSetLocationResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Instant_DetailsSerializer implements StructuredSerializer<Forecast_Data_Instant_Details> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Instant_Details, _$Forecast_Data_Instant_Details];
  @override
  final String wireName = 'Forecast_Data_Instant_Details';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Instant_Details object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'air_pressure_at_sea_level',
      serializers.serialize(object.airPressureAtSeaLevel, specifiedType: const FullType(num)),
      'air_temperature',
      serializers.serialize(object.airTemperature, specifiedType: const FullType(num)),
      'cloud_area_fraction',
      serializers.serialize(object.cloudAreaFraction, specifiedType: const FullType(num)),
      'relative_humidity',
      serializers.serialize(object.relativeHumidity, specifiedType: const FullType(num)),
      'wind_from_direction',
      serializers.serialize(object.windFromDirection, specifiedType: const FullType(num)),
      'wind_speed',
      serializers.serialize(object.windSpeed, specifiedType: const FullType(num)),
    ];

    return result;
  }

  @override
  Forecast_Data_Instant_Details deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Instant_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'air_pressure_at_sea_level':
          result.airPressureAtSeaLevel = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'air_temperature':
          result.airTemperature = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'cloud_area_fraction':
          result.cloudAreaFraction = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'relative_humidity':
          result.relativeHumidity = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'wind_from_direction':
          result.windFromDirection = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'wind_speed':
          result.windSpeed = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_InstantSerializer implements StructuredSerializer<Forecast_Data_Instant> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Instant, _$Forecast_Data_Instant];
  @override
  final String wireName = 'Forecast_Data_Instant';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Instant object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Instant_Details)),
    ];

    return result;
  }

  @override
  Forecast_Data_Instant deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_InstantBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Instant_Details))! as Forecast_Data_Instant_Details);
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next12Hours_SummarySerializer implements StructuredSerializer<Forecast_Data_Next12Hours_Summary> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next12Hours_Summary, _$Forecast_Data_Next12Hours_Summary];
  @override
  final String wireName = 'Forecast_Data_Next12Hours_Summary';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next12Hours_Summary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'symbol_code',
      serializers.serialize(object.symbolCode, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Forecast_Data_Next12Hours_Summary deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next12Hours_SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'symbol_code':
          result.symbolCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next12Hours_DetailsSerializer implements StructuredSerializer<Forecast_Data_Next12Hours_Details> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next12Hours_Details, _$Forecast_Data_Next12Hours_Details];
  @override
  final String wireName = 'Forecast_Data_Next12Hours_Details';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next12Hours_Details object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.precipitationAmount;
    if (value != null) {
      result
        ..add('precipitation_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    return result;
  }

  @override
  Forecast_Data_Next12Hours_Details deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next12Hours_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'precipitation_amount':
          result.precipitationAmount = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next12HoursSerializer implements StructuredSerializer<Forecast_Data_Next12Hours> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next12Hours, _$Forecast_Data_Next12Hours];
  @override
  final String wireName = 'Forecast_Data_Next12Hours';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next12Hours object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(Forecast_Data_Next12Hours_Summary)),
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Next12Hours_Details)),
    ];

    return result;
  }

  @override
  Forecast_Data_Next12Hours deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next12HoursBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'summary':
          result.summary.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next12Hours_Summary))! as Forecast_Data_Next12Hours_Summary);
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next12Hours_Details))! as Forecast_Data_Next12Hours_Details);
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next1Hours_SummarySerializer implements StructuredSerializer<Forecast_Data_Next1Hours_Summary> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next1Hours_Summary, _$Forecast_Data_Next1Hours_Summary];
  @override
  final String wireName = 'Forecast_Data_Next1Hours_Summary';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next1Hours_Summary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'symbol_code',
      serializers.serialize(object.symbolCode, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Forecast_Data_Next1Hours_Summary deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next1Hours_SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'symbol_code':
          result.symbolCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next1Hours_DetailsSerializer implements StructuredSerializer<Forecast_Data_Next1Hours_Details> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next1Hours_Details, _$Forecast_Data_Next1Hours_Details];
  @override
  final String wireName = 'Forecast_Data_Next1Hours_Details';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next1Hours_Details object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.precipitationAmount;
    if (value != null) {
      result
        ..add('precipitation_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    return result;
  }

  @override
  Forecast_Data_Next1Hours_Details deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next1Hours_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'precipitation_amount':
          result.precipitationAmount = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next1HoursSerializer implements StructuredSerializer<Forecast_Data_Next1Hours> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next1Hours, _$Forecast_Data_Next1Hours];
  @override
  final String wireName = 'Forecast_Data_Next1Hours';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next1Hours object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(Forecast_Data_Next1Hours_Summary)),
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Next1Hours_Details)),
    ];

    return result;
  }

  @override
  Forecast_Data_Next1Hours deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next1HoursBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'summary':
          result.summary.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next1Hours_Summary))! as Forecast_Data_Next1Hours_Summary);
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next1Hours_Details))! as Forecast_Data_Next1Hours_Details);
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next6Hours_SummarySerializer implements StructuredSerializer<Forecast_Data_Next6Hours_Summary> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next6Hours_Summary, _$Forecast_Data_Next6Hours_Summary];
  @override
  final String wireName = 'Forecast_Data_Next6Hours_Summary';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next6Hours_Summary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'symbol_code',
      serializers.serialize(object.symbolCode, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Forecast_Data_Next6Hours_Summary deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next6Hours_SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'symbol_code':
          result.symbolCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next6Hours_DetailsSerializer implements StructuredSerializer<Forecast_Data_Next6Hours_Details> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next6Hours_Details, _$Forecast_Data_Next6Hours_Details];
  @override
  final String wireName = 'Forecast_Data_Next6Hours_Details';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next6Hours_Details object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.precipitationAmount;
    if (value != null) {
      result
        ..add('precipitation_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    return result;
  }

  @override
  Forecast_Data_Next6Hours_Details deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next6Hours_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'precipitation_amount':
          result.precipitationAmount = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_Data_Next6HoursSerializer implements StructuredSerializer<Forecast_Data_Next6Hours> {
  @override
  final Iterable<Type> types = const [Forecast_Data_Next6Hours, _$Forecast_Data_Next6Hours];
  @override
  final String wireName = 'Forecast_Data_Next6Hours';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data_Next6Hours object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(Forecast_Data_Next6Hours_Summary)),
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Next6Hours_Details)),
    ];

    return result;
  }

  @override
  Forecast_Data_Next6Hours deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_Data_Next6HoursBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'summary':
          result.summary.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next6Hours_Summary))! as Forecast_Data_Next6Hours_Summary);
          break;
        case 'details':
          result.details.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next6Hours_Details))! as Forecast_Data_Next6Hours_Details);
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast_DataSerializer implements StructuredSerializer<Forecast_Data> {
  @override
  final Iterable<Type> types = const [Forecast_Data, _$Forecast_Data];
  @override
  final String wireName = 'Forecast_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'instant',
      serializers.serialize(object.instant, specifiedType: const FullType(Forecast_Data_Instant)),
      'next_12_hours',
      serializers.serialize(object.next12Hours, specifiedType: const FullType(Forecast_Data_Next12Hours)),
      'next_1_hours',
      serializers.serialize(object.next1Hours, specifiedType: const FullType(Forecast_Data_Next1Hours)),
      'next_6_hours',
      serializers.serialize(object.next6Hours, specifiedType: const FullType(Forecast_Data_Next6Hours)),
    ];

    return result;
  }

  @override
  Forecast_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Forecast_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'instant':
          result.instant.replace(serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Instant))!
              as Forecast_Data_Instant);
          break;
        case 'next_12_hours':
          result.next12Hours.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next12Hours))! as Forecast_Data_Next12Hours);
          break;
        case 'next_1_hours':
          result.next1Hours.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next1Hours))! as Forecast_Data_Next1Hours);
          break;
        case 'next_6_hours':
          result.next6Hours.replace(serializers.deserialize(value,
              specifiedType: const FullType(Forecast_Data_Next6Hours))! as Forecast_Data_Next6Hours);
          break;
      }
    }

    return result.build();
  }
}

class _$ForecastSerializer implements StructuredSerializer<Forecast> {
  @override
  final Iterable<Type> types = const [Forecast, _$Forecast];
  @override
  final String wireName = 'Forecast';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Forecast_Data)),
    ];

    return result;
  }

  @override
  Forecast deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ForecastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'data':
          result.data
              .replace(serializers.deserialize(value, specifiedType: const FullType(Forecast_Data))! as Forecast_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Serializer
    implements StructuredSerializer<WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1,
    _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1
  ];
  @override
  final String wireName = 'WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'error',
      serializers.serialize(object.error, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetForecastResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusGetForecastResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetForecastResponseApplicationJson_Ocs,
    _$WeatherStatusGetForecastResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusGetForecastResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetForecastResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetForecastResponseApplicationJson_OcsBuilder();

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
          result.data = serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs_Data))!
              as WeatherStatusGetForecastResponseApplicationJson_Ocs_Data;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetForecastResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusGetForecastResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetForecastResponseApplicationJson,
    _$WeatherStatusGetForecastResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusGetForecastResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetForecastResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetForecastResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs))!
              as WeatherStatusGetForecastResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetFavoritesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusGetFavoritesResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
    _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusGetFavoritesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetFavoritesResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];

    return result;
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusGetFavoritesResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusGetFavoritesResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusGetFavoritesResponseApplicationJson,
    _$WeatherStatusGetFavoritesResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusGetFavoritesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusGetFavoritesResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WeatherStatusGetFavoritesResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusGetFavoritesResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusGetFavoritesResponseApplicationJson_Ocs))!
              as WeatherStatusGetFavoritesResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetFavoritesRequestApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetFavoritesRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetFavoritesRequestApplicationJson,
    _$WeatherStatusSetFavoritesRequestApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusSetFavoritesRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetFavoritesRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'favorites',
      serializers.serialize(object.favorites, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];

    return result;
  }

  @override
  WeatherStatusSetFavoritesRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetFavoritesRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'favorites':
          result.favorites.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetFavoritesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
    _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WeatherStatusSetFavoritesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetFavoritesResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Success)),
    ];

    return result;
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder();

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
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(Success))! as Success);
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherStatusSetFavoritesResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetFavoritesResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WeatherStatusSetFavoritesResponseApplicationJson,
    _$WeatherStatusSetFavoritesResponseApplicationJson
  ];
  @override
  final String wireName = 'WeatherStatusSetFavoritesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherStatusSetFavoritesResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WeatherStatusSetFavoritesResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs))!
              as WeatherStatusSetFavoritesResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$Capabilities_WeatherStatusSerializer implements StructuredSerializer<Capabilities_WeatherStatus> {
  @override
  final Iterable<Type> types = const [Capabilities_WeatherStatus, _$Capabilities_WeatherStatus];
  @override
  final String wireName = 'Capabilities_WeatherStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_WeatherStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Capabilities_WeatherStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_WeatherStatusBuilder();

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

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  @override
  final Iterable<Type> types = const [Capabilities, _$Capabilities];
  @override
  final String wireName = 'Capabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'weather_status',
      serializers.serialize(object.weatherStatus, specifiedType: const FullType(Capabilities_WeatherStatus)),
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
        case 'weather_status':
          result.weatherStatus.replace(serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_WeatherStatus))! as Capabilities_WeatherStatus);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $WeatherStatusSetModeRequestApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusSetModeRequestApplicationJsonInterface other);
  void update(void Function($WeatherStatusSetModeRequestApplicationJsonInterfaceBuilder) updates);
  int? get mode;
  set mode(int? mode);
}

class _$WeatherStatusSetModeRequestApplicationJson extends WeatherStatusSetModeRequestApplicationJson {
  @override
  final int mode;

  factory _$WeatherStatusSetModeRequestApplicationJson(
          [void Function(WeatherStatusSetModeRequestApplicationJsonBuilder)? updates]) =>
      (WeatherStatusSetModeRequestApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusSetModeRequestApplicationJson._({required this.mode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(mode, r'WeatherStatusSetModeRequestApplicationJson', 'mode');
  }

  @override
  WeatherStatusSetModeRequestApplicationJson rebuild(
          void Function(WeatherStatusSetModeRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetModeRequestApplicationJsonBuilder toBuilder() =>
      WeatherStatusSetModeRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetModeRequestApplicationJson && mode == other.mode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherStatusSetModeRequestApplicationJson')..add('mode', mode)).toString();
  }
}

class WeatherStatusSetModeRequestApplicationJsonBuilder
    implements
        Builder<WeatherStatusSetModeRequestApplicationJson, WeatherStatusSetModeRequestApplicationJsonBuilder>,
        $WeatherStatusSetModeRequestApplicationJsonInterfaceBuilder {
  _$WeatherStatusSetModeRequestApplicationJson? _$v;

  int? _mode;
  int? get mode => _$this._mode;
  set mode(covariant int? mode) => _$this._mode = mode;

  WeatherStatusSetModeRequestApplicationJsonBuilder() {
    WeatherStatusSetModeRequestApplicationJson._defaults(this);
  }

  WeatherStatusSetModeRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mode = $v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetModeRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetModeRequestApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusSetModeRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetModeRequestApplicationJson build() => _build();

  _$WeatherStatusSetModeRequestApplicationJson _build() {
    WeatherStatusSetModeRequestApplicationJson._validate(this);
    final _$result = _$v ??
        _$WeatherStatusSetModeRequestApplicationJson._(
            mode: BuiltValueNullFieldError.checkNotNull(mode, r'WeatherStatusSetModeRequestApplicationJson', 'mode'));
    replace(_$result);
    return _$result;
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

abstract mixin class $SuccessInterfaceBuilder {
  void replace($SuccessInterface other);
  void update(void Function($SuccessInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$Success extends Success {
  @override
  final bool success;

  factory _$Success([void Function(SuccessBuilder)? updates]) => (SuccessBuilder()..update(updates))._build();

  _$Success._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'Success', 'success');
  }

  @override
  Success rebuild(void Function(SuccessBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  SuccessBuilder toBuilder() => SuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Success && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Success')..add('success', success)).toString();
  }
}

class SuccessBuilder implements Builder<Success, SuccessBuilder>, $SuccessInterfaceBuilder {
  _$Success? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  SuccessBuilder() {
    Success._defaults(this);
  }

  SuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Success other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Success;
  }

  @override
  void update(void Function(SuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Success build() => _build();

  _$Success _build() {
    Success._validate(this);
    final _$result = _$v ?? _$Success._(success: BuiltValueNullFieldError.checkNotNull(success, r'Success', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetModeResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusSetModeResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusSetModeResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  SuccessBuilder get data;
  set data(SuccessBuilder? data);
}

class _$WeatherStatusSetModeResponseApplicationJson_Ocs extends WeatherStatusSetModeResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Success data;

  factory _$WeatherStatusSetModeResponseApplicationJson_Ocs(
          [void Function(WeatherStatusSetModeResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusSetModeResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusSetModeResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusSetModeResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusSetModeResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusSetModeResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusSetModeResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetModeResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusSetModeResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetModeResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusSetModeResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusSetModeResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusSetModeResponseApplicationJson_Ocs,
            WeatherStatusSetModeResponseApplicationJson_OcsBuilder>,
        $WeatherStatusSetModeResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusSetModeResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  SuccessBuilder? _data;
  SuccessBuilder get data => _$this._data ??= SuccessBuilder();
  set data(covariant SuccessBuilder? data) => _$this._data = data;

  WeatherStatusSetModeResponseApplicationJson_OcsBuilder() {
    WeatherStatusSetModeResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusSetModeResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetModeResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetModeResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusSetModeResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetModeResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusSetModeResponseApplicationJson_Ocs _build() {
    WeatherStatusSetModeResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusSetModeResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WeatherStatusSetModeResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusSetModeResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetModeResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusSetModeResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusSetModeResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusSetModeResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusSetModeResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusSetModeResponseApplicationJson extends WeatherStatusSetModeResponseApplicationJson {
  @override
  final WeatherStatusSetModeResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusSetModeResponseApplicationJson(
          [void Function(WeatherStatusSetModeResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusSetModeResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusSetModeResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusSetModeResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusSetModeResponseApplicationJson rebuild(
          void Function(WeatherStatusSetModeResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetModeResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusSetModeResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetModeResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusSetModeResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WeatherStatusSetModeResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusSetModeResponseApplicationJson, WeatherStatusSetModeResponseApplicationJsonBuilder>,
        $WeatherStatusSetModeResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusSetModeResponseApplicationJson? _$v;

  WeatherStatusSetModeResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusSetModeResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusSetModeResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusSetModeResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusSetModeResponseApplicationJsonBuilder() {
    WeatherStatusSetModeResponseApplicationJson._defaults(this);
  }

  WeatherStatusSetModeResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetModeResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetModeResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusSetModeResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetModeResponseApplicationJson build() => _build();

  _$WeatherStatusSetModeResponseApplicationJson _build() {
    WeatherStatusSetModeResponseApplicationJson._validate(this);
    _$WeatherStatusSetModeResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusSetModeResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WeatherStatusSetModeResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $LocationInterfaceBuilder {
  void replace($LocationInterface other);
  void update(void Function($LocationInterfaceBuilder) updates);
  String? get lat;
  set lat(String? lat);

  String? get lon;
  set lon(String? lon);

  String? get address;
  set address(String? address);
}

class _$Location extends Location {
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  final String? address;

  factory _$Location([void Function(LocationBuilder)? updates]) => (LocationBuilder()..update(updates))._build();

  _$Location._({this.lat, this.lon, this.address}) : super._();

  @override
  Location rebuild(void Function(LocationBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location && lat == other.lat && lon == other.lon && address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, lon.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Location')
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('address', address))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder>, $LocationInterfaceBuilder {
  _$Location? _$v;

  String? _lat;
  String? get lat => _$this._lat;
  set lat(covariant String? lat) => _$this._lat = lat;

  String? _lon;
  String? get lon => _$this._lon;
  set lon(covariant String? lon) => _$this._lon = lon;

  String? _address;
  String? get address => _$this._address;
  set address(covariant String? address) => _$this._address = address;

  LocationBuilder() {
    Location._defaults(this);
  }

  LocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lon = $v.lon;
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Location other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Location build() => _build();

  _$Location _build() {
    Location._validate(this);
    final _$result = _$v ?? _$Location._(lat: lat, lon: lon, address: address);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $LocationWithSuccessInterfaceBuilder
    implements $LocationInterfaceBuilder, $SuccessInterfaceBuilder {
  void replace(covariant $LocationWithSuccessInterface other);
  void update(void Function($LocationWithSuccessInterfaceBuilder) updates);
  String? get lat;
  set lat(covariant String? lat);

  String? get lon;
  set lon(covariant String? lon);

  String? get address;
  set address(covariant String? address);

  bool? get success;
  set success(covariant bool? success);
}

class _$LocationWithSuccess extends LocationWithSuccess {
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  final String? address;
  @override
  final bool success;

  factory _$LocationWithSuccess([void Function(LocationWithSuccessBuilder)? updates]) =>
      (LocationWithSuccessBuilder()..update(updates))._build();

  _$LocationWithSuccess._({this.lat, this.lon, this.address, required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'LocationWithSuccess', 'success');
  }

  @override
  LocationWithSuccess rebuild(void Function(LocationWithSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationWithSuccessBuilder toBuilder() => LocationWithSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationWithSuccess &&
        lat == other.lat &&
        lon == other.lon &&
        address == other.address &&
        success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, lon.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationWithSuccess')
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('address', address)
          ..add('success', success))
        .toString();
  }
}

class LocationWithSuccessBuilder
    implements Builder<LocationWithSuccess, LocationWithSuccessBuilder>, $LocationWithSuccessInterfaceBuilder {
  _$LocationWithSuccess? _$v;

  String? _lat;
  String? get lat => _$this._lat;
  set lat(covariant String? lat) => _$this._lat = lat;

  String? _lon;
  String? get lon => _$this._lon;
  set lon(covariant String? lon) => _$this._lon = lon;

  String? _address;
  String? get address => _$this._address;
  set address(covariant String? address) => _$this._address = address;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  LocationWithSuccessBuilder() {
    LocationWithSuccess._defaults(this);
  }

  LocationWithSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lon = $v.lon;
      _address = $v.address;
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LocationWithSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocationWithSuccess;
  }

  @override
  void update(void Function(LocationWithSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationWithSuccess build() => _build();

  _$LocationWithSuccess _build() {
    LocationWithSuccess._validate(this);
    final _$result = _$v ??
        _$LocationWithSuccess._(
            lat: lat,
            lon: lon,
            address: address,
            success: BuiltValueNullFieldError.checkNotNull(success, r'LocationWithSuccess', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  LocationWithSuccessBuilder get data;
  set data(LocationWithSuccessBuilder? data);
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs
    extends WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final LocationWithSuccess data;

  factory _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs(
          [void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
            WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder>,
        $WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  LocationWithSuccessBuilder? _data;
  LocationWithSuccessBuilder get data => _$this._data ??= LocationWithSuccessBuilder();
  set data(covariant LocationWithSuccessBuilder? data) => _$this._data = data;

  WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder() {
    WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs _build() {
    WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusUsePersonalAddressResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusUsePersonalAddressResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusUsePersonalAddressResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJson
    extends WeatherStatusUsePersonalAddressResponseApplicationJson {
  @override
  final WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusUsePersonalAddressResponseApplicationJson(
          [void Function(WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusUsePersonalAddressResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusUsePersonalAddressResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson rebuild(
          void Function(WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusUsePersonalAddressResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusUsePersonalAddressResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusUsePersonalAddressResponseApplicationJson,
            WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder>,
        $WeatherStatusUsePersonalAddressResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusUsePersonalAddressResponseApplicationJson? _$v;

  WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder() {
    WeatherStatusUsePersonalAddressResponseApplicationJson._defaults(this);
  }

  WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusUsePersonalAddressResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusUsePersonalAddressResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson build() => _build();

  _$WeatherStatusUsePersonalAddressResponseApplicationJson _build() {
    WeatherStatusUsePersonalAddressResponseApplicationJson._validate(this);
    _$WeatherStatusUsePersonalAddressResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusUsePersonalAddressResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusUsePersonalAddressResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ModeInterfaceBuilder {
  void replace($ModeInterface other);
  void update(void Function($ModeInterfaceBuilder) updates);
  int? get mode;
  set mode(int? mode);
}

class _$Mode extends Mode {
  @override
  final int mode;

  factory _$Mode([void Function(ModeBuilder)? updates]) => (ModeBuilder()..update(updates))._build();

  _$Mode._({required this.mode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(mode, r'Mode', 'mode');
  }

  @override
  Mode rebuild(void Function(ModeBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ModeBuilder toBuilder() => ModeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mode && mode == other.mode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Mode')..add('mode', mode)).toString();
  }
}

class ModeBuilder implements Builder<Mode, ModeBuilder>, $ModeInterfaceBuilder {
  _$Mode? _$v;

  int? _mode;
  int? get mode => _$this._mode;
  set mode(covariant int? mode) => _$this._mode = mode;

  ModeBuilder() {
    Mode._defaults(this);
  }

  ModeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mode = $v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Mode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Mode;
  }

  @override
  void update(void Function(ModeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Mode build() => _build();

  _$Mode _build() {
    Mode._validate(this);
    final _$result = _$v ?? _$Mode._(mode: BuiltValueNullFieldError.checkNotNull(mode, r'Mode', 'mode'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $LocationWithModeInterfaceBuilder implements $LocationInterfaceBuilder, $ModeInterfaceBuilder {
  void replace(covariant $LocationWithModeInterface other);
  void update(void Function($LocationWithModeInterfaceBuilder) updates);
  String? get lat;
  set lat(covariant String? lat);

  String? get lon;
  set lon(covariant String? lon);

  String? get address;
  set address(covariant String? address);

  int? get mode;
  set mode(covariant int? mode);
}

class _$LocationWithMode extends LocationWithMode {
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  final String? address;
  @override
  final int mode;

  factory _$LocationWithMode([void Function(LocationWithModeBuilder)? updates]) =>
      (LocationWithModeBuilder()..update(updates))._build();

  _$LocationWithMode._({this.lat, this.lon, this.address, required this.mode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(mode, r'LocationWithMode', 'mode');
  }

  @override
  LocationWithMode rebuild(void Function(LocationWithModeBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  LocationWithModeBuilder toBuilder() => LocationWithModeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationWithMode &&
        lat == other.lat &&
        lon == other.lon &&
        address == other.address &&
        mode == other.mode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, lon.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationWithMode')
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('address', address)
          ..add('mode', mode))
        .toString();
  }
}

class LocationWithModeBuilder
    implements Builder<LocationWithMode, LocationWithModeBuilder>, $LocationWithModeInterfaceBuilder {
  _$LocationWithMode? _$v;

  String? _lat;
  String? get lat => _$this._lat;
  set lat(covariant String? lat) => _$this._lat = lat;

  String? _lon;
  String? get lon => _$this._lon;
  set lon(covariant String? lon) => _$this._lon = lon;

  String? _address;
  String? get address => _$this._address;
  set address(covariant String? address) => _$this._address = address;

  int? _mode;
  int? get mode => _$this._mode;
  set mode(covariant int? mode) => _$this._mode = mode;

  LocationWithModeBuilder() {
    LocationWithMode._defaults(this);
  }

  LocationWithModeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lat = $v.lat;
      _lon = $v.lon;
      _address = $v.address;
      _mode = $v.mode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LocationWithMode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LocationWithMode;
  }

  @override
  void update(void Function(LocationWithModeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationWithMode build() => _build();

  _$LocationWithMode _build() {
    LocationWithMode._validate(this);
    final _$result = _$v ??
        _$LocationWithMode._(
            lat: lat,
            lon: lon,
            address: address,
            mode: BuiltValueNullFieldError.checkNotNull(mode, r'LocationWithMode', 'mode'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetLocationResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusGetLocationResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusGetLocationResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  LocationWithModeBuilder get data;
  set data(LocationWithModeBuilder? data);
}

class _$WeatherStatusGetLocationResponseApplicationJson_Ocs
    extends WeatherStatusGetLocationResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final LocationWithMode data;

  factory _$WeatherStatusGetLocationResponseApplicationJson_Ocs(
          [void Function(WeatherStatusGetLocationResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusGetLocationResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusGetLocationResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusGetLocationResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusGetLocationResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusGetLocationResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetLocationResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusGetLocationResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusGetLocationResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusGetLocationResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusGetLocationResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusGetLocationResponseApplicationJson_Ocs,
            WeatherStatusGetLocationResponseApplicationJson_OcsBuilder>,
        $WeatherStatusGetLocationResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusGetLocationResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  LocationWithModeBuilder? _data;
  LocationWithModeBuilder get data => _$this._data ??= LocationWithModeBuilder();
  set data(covariant LocationWithModeBuilder? data) => _$this._data = data;

  WeatherStatusGetLocationResponseApplicationJson_OcsBuilder() {
    WeatherStatusGetLocationResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusGetLocationResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetLocationResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetLocationResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusGetLocationResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusGetLocationResponseApplicationJson_Ocs _build() {
    WeatherStatusGetLocationResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusGetLocationResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WeatherStatusGetLocationResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusGetLocationResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetLocationResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusGetLocationResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusGetLocationResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusGetLocationResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusGetLocationResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusGetLocationResponseApplicationJson extends WeatherStatusGetLocationResponseApplicationJson {
  @override
  final WeatherStatusGetLocationResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusGetLocationResponseApplicationJson(
          [void Function(WeatherStatusGetLocationResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusGetLocationResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusGetLocationResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusGetLocationResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson rebuild(
          void Function(WeatherStatusGetLocationResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetLocationResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusGetLocationResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusGetLocationResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusGetLocationResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class WeatherStatusGetLocationResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusGetLocationResponseApplicationJson,
            WeatherStatusGetLocationResponseApplicationJsonBuilder>,
        $WeatherStatusGetLocationResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusGetLocationResponseApplicationJson? _$v;

  WeatherStatusGetLocationResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusGetLocationResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusGetLocationResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusGetLocationResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusGetLocationResponseApplicationJsonBuilder() {
    WeatherStatusGetLocationResponseApplicationJson._defaults(this);
  }

  WeatherStatusGetLocationResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetLocationResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetLocationResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusGetLocationResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson build() => _build();

  _$WeatherStatusGetLocationResponseApplicationJson _build() {
    WeatherStatusGetLocationResponseApplicationJson._validate(this);
    _$WeatherStatusGetLocationResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusGetLocationResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusGetLocationResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetLocationRequestApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusSetLocationRequestApplicationJsonInterface other);
  void update(void Function($WeatherStatusSetLocationRequestApplicationJsonInterfaceBuilder) updates);
  String? get address;
  set address(String? address);

  double? get lat;
  set lat(double? lat);

  double? get lon;
  set lon(double? lon);
}

class _$WeatherStatusSetLocationRequestApplicationJson extends WeatherStatusSetLocationRequestApplicationJson {
  @override
  final String? address;
  @override
  final double? lat;
  @override
  final double? lon;

  factory _$WeatherStatusSetLocationRequestApplicationJson(
          [void Function(WeatherStatusSetLocationRequestApplicationJsonBuilder)? updates]) =>
      (WeatherStatusSetLocationRequestApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusSetLocationRequestApplicationJson._({this.address, this.lat, this.lon}) : super._();

  @override
  WeatherStatusSetLocationRequestApplicationJson rebuild(
          void Function(WeatherStatusSetLocationRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetLocationRequestApplicationJsonBuilder toBuilder() =>
      WeatherStatusSetLocationRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetLocationRequestApplicationJson &&
        address == other.address &&
        lat == other.lat &&
        lon == other.lon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, lon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherStatusSetLocationRequestApplicationJson')
          ..add('address', address)
          ..add('lat', lat)
          ..add('lon', lon))
        .toString();
  }
}

class WeatherStatusSetLocationRequestApplicationJsonBuilder
    implements
        Builder<WeatherStatusSetLocationRequestApplicationJson, WeatherStatusSetLocationRequestApplicationJsonBuilder>,
        $WeatherStatusSetLocationRequestApplicationJsonInterfaceBuilder {
  _$WeatherStatusSetLocationRequestApplicationJson? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(covariant String? address) => _$this._address = address;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(covariant double? lat) => _$this._lat = lat;

  double? _lon;
  double? get lon => _$this._lon;
  set lon(covariant double? lon) => _$this._lon = lon;

  WeatherStatusSetLocationRequestApplicationJsonBuilder() {
    WeatherStatusSetLocationRequestApplicationJson._defaults(this);
  }

  WeatherStatusSetLocationRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _lat = $v.lat;
      _lon = $v.lon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetLocationRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetLocationRequestApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusSetLocationRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetLocationRequestApplicationJson build() => _build();

  _$WeatherStatusSetLocationRequestApplicationJson _build() {
    WeatherStatusSetLocationRequestApplicationJson._validate(this);
    final _$result = _$v ?? _$WeatherStatusSetLocationRequestApplicationJson._(address: address, lat: lat, lon: lon);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetLocationResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusSetLocationResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusSetLocationResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  LocationWithSuccessBuilder get data;
  set data(LocationWithSuccessBuilder? data);
}

class _$WeatherStatusSetLocationResponseApplicationJson_Ocs
    extends WeatherStatusSetLocationResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final LocationWithSuccess data;

  factory _$WeatherStatusSetLocationResponseApplicationJson_Ocs(
          [void Function(WeatherStatusSetLocationResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusSetLocationResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusSetLocationResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusSetLocationResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusSetLocationResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusSetLocationResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetLocationResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusSetLocationResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetLocationResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusSetLocationResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusSetLocationResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusSetLocationResponseApplicationJson_Ocs,
            WeatherStatusSetLocationResponseApplicationJson_OcsBuilder>,
        $WeatherStatusSetLocationResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusSetLocationResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  LocationWithSuccessBuilder? _data;
  LocationWithSuccessBuilder get data => _$this._data ??= LocationWithSuccessBuilder();
  set data(covariant LocationWithSuccessBuilder? data) => _$this._data = data;

  WeatherStatusSetLocationResponseApplicationJson_OcsBuilder() {
    WeatherStatusSetLocationResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusSetLocationResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetLocationResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetLocationResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusSetLocationResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusSetLocationResponseApplicationJson_Ocs _build() {
    WeatherStatusSetLocationResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusSetLocationResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WeatherStatusSetLocationResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusSetLocationResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetLocationResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusSetLocationResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusSetLocationResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusSetLocationResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusSetLocationResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusSetLocationResponseApplicationJson extends WeatherStatusSetLocationResponseApplicationJson {
  @override
  final WeatherStatusSetLocationResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusSetLocationResponseApplicationJson(
          [void Function(WeatherStatusSetLocationResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusSetLocationResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusSetLocationResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusSetLocationResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson rebuild(
          void Function(WeatherStatusSetLocationResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetLocationResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusSetLocationResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetLocationResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusSetLocationResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class WeatherStatusSetLocationResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusSetLocationResponseApplicationJson,
            WeatherStatusSetLocationResponseApplicationJsonBuilder>,
        $WeatherStatusSetLocationResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusSetLocationResponseApplicationJson? _$v;

  WeatherStatusSetLocationResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusSetLocationResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusSetLocationResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusSetLocationResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusSetLocationResponseApplicationJsonBuilder() {
    WeatherStatusSetLocationResponseApplicationJson._defaults(this);
  }

  WeatherStatusSetLocationResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetLocationResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetLocationResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusSetLocationResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson build() => _build();

  _$WeatherStatusSetLocationResponseApplicationJson _build() {
    WeatherStatusSetLocationResponseApplicationJson._validate(this);
    _$WeatherStatusSetLocationResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusSetLocationResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusSetLocationResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Instant_DetailsInterfaceBuilder {
  void replace($Forecast_Data_Instant_DetailsInterface other);
  void update(void Function($Forecast_Data_Instant_DetailsInterfaceBuilder) updates);
  num? get airPressureAtSeaLevel;
  set airPressureAtSeaLevel(num? airPressureAtSeaLevel);

  num? get airTemperature;
  set airTemperature(num? airTemperature);

  num? get cloudAreaFraction;
  set cloudAreaFraction(num? cloudAreaFraction);

  num? get relativeHumidity;
  set relativeHumidity(num? relativeHumidity);

  num? get windFromDirection;
  set windFromDirection(num? windFromDirection);

  num? get windSpeed;
  set windSpeed(num? windSpeed);
}

class _$Forecast_Data_Instant_Details extends Forecast_Data_Instant_Details {
  @override
  final num airPressureAtSeaLevel;
  @override
  final num airTemperature;
  @override
  final num cloudAreaFraction;
  @override
  final num relativeHumidity;
  @override
  final num windFromDirection;
  @override
  final num windSpeed;

  factory _$Forecast_Data_Instant_Details([void Function(Forecast_Data_Instant_DetailsBuilder)? updates]) =>
      (Forecast_Data_Instant_DetailsBuilder()..update(updates))._build();

  _$Forecast_Data_Instant_Details._(
      {required this.airPressureAtSeaLevel,
      required this.airTemperature,
      required this.cloudAreaFraction,
      required this.relativeHumidity,
      required this.windFromDirection,
      required this.windSpeed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        airPressureAtSeaLevel, r'Forecast_Data_Instant_Details', 'airPressureAtSeaLevel');
    BuiltValueNullFieldError.checkNotNull(airTemperature, r'Forecast_Data_Instant_Details', 'airTemperature');
    BuiltValueNullFieldError.checkNotNull(cloudAreaFraction, r'Forecast_Data_Instant_Details', 'cloudAreaFraction');
    BuiltValueNullFieldError.checkNotNull(relativeHumidity, r'Forecast_Data_Instant_Details', 'relativeHumidity');
    BuiltValueNullFieldError.checkNotNull(windFromDirection, r'Forecast_Data_Instant_Details', 'windFromDirection');
    BuiltValueNullFieldError.checkNotNull(windSpeed, r'Forecast_Data_Instant_Details', 'windSpeed');
  }

  @override
  Forecast_Data_Instant_Details rebuild(void Function(Forecast_Data_Instant_DetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Instant_DetailsBuilder toBuilder() => Forecast_Data_Instant_DetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Instant_Details &&
        airPressureAtSeaLevel == other.airPressureAtSeaLevel &&
        airTemperature == other.airTemperature &&
        cloudAreaFraction == other.cloudAreaFraction &&
        relativeHumidity == other.relativeHumidity &&
        windFromDirection == other.windFromDirection &&
        windSpeed == other.windSpeed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, airPressureAtSeaLevel.hashCode);
    _$hash = $jc(_$hash, airTemperature.hashCode);
    _$hash = $jc(_$hash, cloudAreaFraction.hashCode);
    _$hash = $jc(_$hash, relativeHumidity.hashCode);
    _$hash = $jc(_$hash, windFromDirection.hashCode);
    _$hash = $jc(_$hash, windSpeed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Instant_Details')
          ..add('airPressureAtSeaLevel', airPressureAtSeaLevel)
          ..add('airTemperature', airTemperature)
          ..add('cloudAreaFraction', cloudAreaFraction)
          ..add('relativeHumidity', relativeHumidity)
          ..add('windFromDirection', windFromDirection)
          ..add('windSpeed', windSpeed))
        .toString();
  }
}

class Forecast_Data_Instant_DetailsBuilder
    implements
        Builder<Forecast_Data_Instant_Details, Forecast_Data_Instant_DetailsBuilder>,
        $Forecast_Data_Instant_DetailsInterfaceBuilder {
  _$Forecast_Data_Instant_Details? _$v;

  num? _airPressureAtSeaLevel;
  num? get airPressureAtSeaLevel => _$this._airPressureAtSeaLevel;
  set airPressureAtSeaLevel(covariant num? airPressureAtSeaLevel) =>
      _$this._airPressureAtSeaLevel = airPressureAtSeaLevel;

  num? _airTemperature;
  num? get airTemperature => _$this._airTemperature;
  set airTemperature(covariant num? airTemperature) => _$this._airTemperature = airTemperature;

  num? _cloudAreaFraction;
  num? get cloudAreaFraction => _$this._cloudAreaFraction;
  set cloudAreaFraction(covariant num? cloudAreaFraction) => _$this._cloudAreaFraction = cloudAreaFraction;

  num? _relativeHumidity;
  num? get relativeHumidity => _$this._relativeHumidity;
  set relativeHumidity(covariant num? relativeHumidity) => _$this._relativeHumidity = relativeHumidity;

  num? _windFromDirection;
  num? get windFromDirection => _$this._windFromDirection;
  set windFromDirection(covariant num? windFromDirection) => _$this._windFromDirection = windFromDirection;

  num? _windSpeed;
  num? get windSpeed => _$this._windSpeed;
  set windSpeed(covariant num? windSpeed) => _$this._windSpeed = windSpeed;

  Forecast_Data_Instant_DetailsBuilder() {
    Forecast_Data_Instant_Details._defaults(this);
  }

  Forecast_Data_Instant_DetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _airPressureAtSeaLevel = $v.airPressureAtSeaLevel;
      _airTemperature = $v.airTemperature;
      _cloudAreaFraction = $v.cloudAreaFraction;
      _relativeHumidity = $v.relativeHumidity;
      _windFromDirection = $v.windFromDirection;
      _windSpeed = $v.windSpeed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Instant_Details other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Instant_Details;
  }

  @override
  void update(void Function(Forecast_Data_Instant_DetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Instant_Details build() => _build();

  _$Forecast_Data_Instant_Details _build() {
    Forecast_Data_Instant_Details._validate(this);
    final _$result = _$v ??
        _$Forecast_Data_Instant_Details._(
            airPressureAtSeaLevel: BuiltValueNullFieldError.checkNotNull(
                airPressureAtSeaLevel, r'Forecast_Data_Instant_Details', 'airPressureAtSeaLevel'),
            airTemperature: BuiltValueNullFieldError.checkNotNull(
                airTemperature, r'Forecast_Data_Instant_Details', 'airTemperature'),
            cloudAreaFraction: BuiltValueNullFieldError.checkNotNull(
                cloudAreaFraction, r'Forecast_Data_Instant_Details', 'cloudAreaFraction'),
            relativeHumidity: BuiltValueNullFieldError.checkNotNull(
                relativeHumidity, r'Forecast_Data_Instant_Details', 'relativeHumidity'),
            windFromDirection: BuiltValueNullFieldError.checkNotNull(
                windFromDirection, r'Forecast_Data_Instant_Details', 'windFromDirection'),
            windSpeed: BuiltValueNullFieldError.checkNotNull(windSpeed, r'Forecast_Data_Instant_Details', 'windSpeed'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_InstantInterfaceBuilder {
  void replace($Forecast_Data_InstantInterface other);
  void update(void Function($Forecast_Data_InstantInterfaceBuilder) updates);
  Forecast_Data_Instant_DetailsBuilder get details;
  set details(Forecast_Data_Instant_DetailsBuilder? details);
}

class _$Forecast_Data_Instant extends Forecast_Data_Instant {
  @override
  final Forecast_Data_Instant_Details details;

  factory _$Forecast_Data_Instant([void Function(Forecast_Data_InstantBuilder)? updates]) =>
      (Forecast_Data_InstantBuilder()..update(updates))._build();

  _$Forecast_Data_Instant._({required this.details}) : super._() {
    BuiltValueNullFieldError.checkNotNull(details, r'Forecast_Data_Instant', 'details');
  }

  @override
  Forecast_Data_Instant rebuild(void Function(Forecast_Data_InstantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_InstantBuilder toBuilder() => Forecast_Data_InstantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Instant && details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Instant')..add('details', details)).toString();
  }
}

class Forecast_Data_InstantBuilder
    implements Builder<Forecast_Data_Instant, Forecast_Data_InstantBuilder>, $Forecast_Data_InstantInterfaceBuilder {
  _$Forecast_Data_Instant? _$v;

  Forecast_Data_Instant_DetailsBuilder? _details;
  Forecast_Data_Instant_DetailsBuilder get details => _$this._details ??= Forecast_Data_Instant_DetailsBuilder();
  set details(covariant Forecast_Data_Instant_DetailsBuilder? details) => _$this._details = details;

  Forecast_Data_InstantBuilder() {
    Forecast_Data_Instant._defaults(this);
  }

  Forecast_Data_InstantBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Instant other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Instant;
  }

  @override
  void update(void Function(Forecast_Data_InstantBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Instant build() => _build();

  _$Forecast_Data_Instant _build() {
    Forecast_Data_Instant._validate(this);
    _$Forecast_Data_Instant _$result;
    try {
      _$result = _$v ?? _$Forecast_Data_Instant._(details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Forecast_Data_Instant', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next12Hours_SummaryInterfaceBuilder {
  void replace($Forecast_Data_Next12Hours_SummaryInterface other);
  void update(void Function($Forecast_Data_Next12Hours_SummaryInterfaceBuilder) updates);
  String? get symbolCode;
  set symbolCode(String? symbolCode);
}

class _$Forecast_Data_Next12Hours_Summary extends Forecast_Data_Next12Hours_Summary {
  @override
  final String symbolCode;

  factory _$Forecast_Data_Next12Hours_Summary([void Function(Forecast_Data_Next12Hours_SummaryBuilder)? updates]) =>
      (Forecast_Data_Next12Hours_SummaryBuilder()..update(updates))._build();

  _$Forecast_Data_Next12Hours_Summary._({required this.symbolCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(symbolCode, r'Forecast_Data_Next12Hours_Summary', 'symbolCode');
  }

  @override
  Forecast_Data_Next12Hours_Summary rebuild(void Function(Forecast_Data_Next12Hours_SummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next12Hours_SummaryBuilder toBuilder() => Forecast_Data_Next12Hours_SummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next12Hours_Summary && symbolCode == other.symbolCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, symbolCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next12Hours_Summary')..add('symbolCode', symbolCode))
        .toString();
  }
}

class Forecast_Data_Next12Hours_SummaryBuilder
    implements
        Builder<Forecast_Data_Next12Hours_Summary, Forecast_Data_Next12Hours_SummaryBuilder>,
        $Forecast_Data_Next12Hours_SummaryInterfaceBuilder {
  _$Forecast_Data_Next12Hours_Summary? _$v;

  String? _symbolCode;
  String? get symbolCode => _$this._symbolCode;
  set symbolCode(covariant String? symbolCode) => _$this._symbolCode = symbolCode;

  Forecast_Data_Next12Hours_SummaryBuilder() {
    Forecast_Data_Next12Hours_Summary._defaults(this);
  }

  Forecast_Data_Next12Hours_SummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _symbolCode = $v.symbolCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next12Hours_Summary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next12Hours_Summary;
  }

  @override
  void update(void Function(Forecast_Data_Next12Hours_SummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next12Hours_Summary build() => _build();

  _$Forecast_Data_Next12Hours_Summary _build() {
    Forecast_Data_Next12Hours_Summary._validate(this);
    final _$result = _$v ??
        _$Forecast_Data_Next12Hours_Summary._(
            symbolCode:
                BuiltValueNullFieldError.checkNotNull(symbolCode, r'Forecast_Data_Next12Hours_Summary', 'symbolCode'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next12Hours_DetailsInterfaceBuilder {
  void replace($Forecast_Data_Next12Hours_DetailsInterface other);
  void update(void Function($Forecast_Data_Next12Hours_DetailsInterfaceBuilder) updates);
  num? get precipitationAmount;
  set precipitationAmount(num? precipitationAmount);
}

class _$Forecast_Data_Next12Hours_Details extends Forecast_Data_Next12Hours_Details {
  @override
  final num? precipitationAmount;

  factory _$Forecast_Data_Next12Hours_Details([void Function(Forecast_Data_Next12Hours_DetailsBuilder)? updates]) =>
      (Forecast_Data_Next12Hours_DetailsBuilder()..update(updates))._build();

  _$Forecast_Data_Next12Hours_Details._({this.precipitationAmount}) : super._();

  @override
  Forecast_Data_Next12Hours_Details rebuild(void Function(Forecast_Data_Next12Hours_DetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next12Hours_DetailsBuilder toBuilder() => Forecast_Data_Next12Hours_DetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next12Hours_Details && precipitationAmount == other.precipitationAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, precipitationAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next12Hours_Details')
          ..add('precipitationAmount', precipitationAmount))
        .toString();
  }
}

class Forecast_Data_Next12Hours_DetailsBuilder
    implements
        Builder<Forecast_Data_Next12Hours_Details, Forecast_Data_Next12Hours_DetailsBuilder>,
        $Forecast_Data_Next12Hours_DetailsInterfaceBuilder {
  _$Forecast_Data_Next12Hours_Details? _$v;

  num? _precipitationAmount;
  num? get precipitationAmount => _$this._precipitationAmount;
  set precipitationAmount(covariant num? precipitationAmount) => _$this._precipitationAmount = precipitationAmount;

  Forecast_Data_Next12Hours_DetailsBuilder() {
    Forecast_Data_Next12Hours_Details._defaults(this);
  }

  Forecast_Data_Next12Hours_DetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _precipitationAmount = $v.precipitationAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next12Hours_Details other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next12Hours_Details;
  }

  @override
  void update(void Function(Forecast_Data_Next12Hours_DetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next12Hours_Details build() => _build();

  _$Forecast_Data_Next12Hours_Details _build() {
    Forecast_Data_Next12Hours_Details._validate(this);
    final _$result = _$v ?? _$Forecast_Data_Next12Hours_Details._(precipitationAmount: precipitationAmount);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next12HoursInterfaceBuilder {
  void replace($Forecast_Data_Next12HoursInterface other);
  void update(void Function($Forecast_Data_Next12HoursInterfaceBuilder) updates);
  Forecast_Data_Next12Hours_SummaryBuilder get summary;
  set summary(Forecast_Data_Next12Hours_SummaryBuilder? summary);

  Forecast_Data_Next12Hours_DetailsBuilder get details;
  set details(Forecast_Data_Next12Hours_DetailsBuilder? details);
}

class _$Forecast_Data_Next12Hours extends Forecast_Data_Next12Hours {
  @override
  final Forecast_Data_Next12Hours_Summary summary;
  @override
  final Forecast_Data_Next12Hours_Details details;

  factory _$Forecast_Data_Next12Hours([void Function(Forecast_Data_Next12HoursBuilder)? updates]) =>
      (Forecast_Data_Next12HoursBuilder()..update(updates))._build();

  _$Forecast_Data_Next12Hours._({required this.summary, required this.details}) : super._() {
    BuiltValueNullFieldError.checkNotNull(summary, r'Forecast_Data_Next12Hours', 'summary');
    BuiltValueNullFieldError.checkNotNull(details, r'Forecast_Data_Next12Hours', 'details');
  }

  @override
  Forecast_Data_Next12Hours rebuild(void Function(Forecast_Data_Next12HoursBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next12HoursBuilder toBuilder() => Forecast_Data_Next12HoursBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next12Hours && summary == other.summary && details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next12Hours')
          ..add('summary', summary)
          ..add('details', details))
        .toString();
  }
}

class Forecast_Data_Next12HoursBuilder
    implements
        Builder<Forecast_Data_Next12Hours, Forecast_Data_Next12HoursBuilder>,
        $Forecast_Data_Next12HoursInterfaceBuilder {
  _$Forecast_Data_Next12Hours? _$v;

  Forecast_Data_Next12Hours_SummaryBuilder? _summary;
  Forecast_Data_Next12Hours_SummaryBuilder get summary =>
      _$this._summary ??= Forecast_Data_Next12Hours_SummaryBuilder();
  set summary(covariant Forecast_Data_Next12Hours_SummaryBuilder? summary) => _$this._summary = summary;

  Forecast_Data_Next12Hours_DetailsBuilder? _details;
  Forecast_Data_Next12Hours_DetailsBuilder get details =>
      _$this._details ??= Forecast_Data_Next12Hours_DetailsBuilder();
  set details(covariant Forecast_Data_Next12Hours_DetailsBuilder? details) => _$this._details = details;

  Forecast_Data_Next12HoursBuilder() {
    Forecast_Data_Next12Hours._defaults(this);
  }

  Forecast_Data_Next12HoursBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary.toBuilder();
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next12Hours other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next12Hours;
  }

  @override
  void update(void Function(Forecast_Data_Next12HoursBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next12Hours build() => _build();

  _$Forecast_Data_Next12Hours _build() {
    Forecast_Data_Next12Hours._validate(this);
    _$Forecast_Data_Next12Hours _$result;
    try {
      _$result = _$v ?? _$Forecast_Data_Next12Hours._(summary: summary.build(), details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Forecast_Data_Next12Hours', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next1Hours_SummaryInterfaceBuilder {
  void replace($Forecast_Data_Next1Hours_SummaryInterface other);
  void update(void Function($Forecast_Data_Next1Hours_SummaryInterfaceBuilder) updates);
  String? get symbolCode;
  set symbolCode(String? symbolCode);
}

class _$Forecast_Data_Next1Hours_Summary extends Forecast_Data_Next1Hours_Summary {
  @override
  final String symbolCode;

  factory _$Forecast_Data_Next1Hours_Summary([void Function(Forecast_Data_Next1Hours_SummaryBuilder)? updates]) =>
      (Forecast_Data_Next1Hours_SummaryBuilder()..update(updates))._build();

  _$Forecast_Data_Next1Hours_Summary._({required this.symbolCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(symbolCode, r'Forecast_Data_Next1Hours_Summary', 'symbolCode');
  }

  @override
  Forecast_Data_Next1Hours_Summary rebuild(void Function(Forecast_Data_Next1Hours_SummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next1Hours_SummaryBuilder toBuilder() => Forecast_Data_Next1Hours_SummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next1Hours_Summary && symbolCode == other.symbolCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, symbolCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next1Hours_Summary')..add('symbolCode', symbolCode)).toString();
  }
}

class Forecast_Data_Next1Hours_SummaryBuilder
    implements
        Builder<Forecast_Data_Next1Hours_Summary, Forecast_Data_Next1Hours_SummaryBuilder>,
        $Forecast_Data_Next1Hours_SummaryInterfaceBuilder {
  _$Forecast_Data_Next1Hours_Summary? _$v;

  String? _symbolCode;
  String? get symbolCode => _$this._symbolCode;
  set symbolCode(covariant String? symbolCode) => _$this._symbolCode = symbolCode;

  Forecast_Data_Next1Hours_SummaryBuilder() {
    Forecast_Data_Next1Hours_Summary._defaults(this);
  }

  Forecast_Data_Next1Hours_SummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _symbolCode = $v.symbolCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next1Hours_Summary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next1Hours_Summary;
  }

  @override
  void update(void Function(Forecast_Data_Next1Hours_SummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next1Hours_Summary build() => _build();

  _$Forecast_Data_Next1Hours_Summary _build() {
    Forecast_Data_Next1Hours_Summary._validate(this);
    final _$result = _$v ??
        _$Forecast_Data_Next1Hours_Summary._(
            symbolCode:
                BuiltValueNullFieldError.checkNotNull(symbolCode, r'Forecast_Data_Next1Hours_Summary', 'symbolCode'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next1Hours_DetailsInterfaceBuilder {
  void replace($Forecast_Data_Next1Hours_DetailsInterface other);
  void update(void Function($Forecast_Data_Next1Hours_DetailsInterfaceBuilder) updates);
  num? get precipitationAmount;
  set precipitationAmount(num? precipitationAmount);
}

class _$Forecast_Data_Next1Hours_Details extends Forecast_Data_Next1Hours_Details {
  @override
  final num? precipitationAmount;

  factory _$Forecast_Data_Next1Hours_Details([void Function(Forecast_Data_Next1Hours_DetailsBuilder)? updates]) =>
      (Forecast_Data_Next1Hours_DetailsBuilder()..update(updates))._build();

  _$Forecast_Data_Next1Hours_Details._({this.precipitationAmount}) : super._();

  @override
  Forecast_Data_Next1Hours_Details rebuild(void Function(Forecast_Data_Next1Hours_DetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next1Hours_DetailsBuilder toBuilder() => Forecast_Data_Next1Hours_DetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next1Hours_Details && precipitationAmount == other.precipitationAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, precipitationAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next1Hours_Details')
          ..add('precipitationAmount', precipitationAmount))
        .toString();
  }
}

class Forecast_Data_Next1Hours_DetailsBuilder
    implements
        Builder<Forecast_Data_Next1Hours_Details, Forecast_Data_Next1Hours_DetailsBuilder>,
        $Forecast_Data_Next1Hours_DetailsInterfaceBuilder {
  _$Forecast_Data_Next1Hours_Details? _$v;

  num? _precipitationAmount;
  num? get precipitationAmount => _$this._precipitationAmount;
  set precipitationAmount(covariant num? precipitationAmount) => _$this._precipitationAmount = precipitationAmount;

  Forecast_Data_Next1Hours_DetailsBuilder() {
    Forecast_Data_Next1Hours_Details._defaults(this);
  }

  Forecast_Data_Next1Hours_DetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _precipitationAmount = $v.precipitationAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next1Hours_Details other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next1Hours_Details;
  }

  @override
  void update(void Function(Forecast_Data_Next1Hours_DetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next1Hours_Details build() => _build();

  _$Forecast_Data_Next1Hours_Details _build() {
    Forecast_Data_Next1Hours_Details._validate(this);
    final _$result = _$v ?? _$Forecast_Data_Next1Hours_Details._(precipitationAmount: precipitationAmount);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next1HoursInterfaceBuilder {
  void replace($Forecast_Data_Next1HoursInterface other);
  void update(void Function($Forecast_Data_Next1HoursInterfaceBuilder) updates);
  Forecast_Data_Next1Hours_SummaryBuilder get summary;
  set summary(Forecast_Data_Next1Hours_SummaryBuilder? summary);

  Forecast_Data_Next1Hours_DetailsBuilder get details;
  set details(Forecast_Data_Next1Hours_DetailsBuilder? details);
}

class _$Forecast_Data_Next1Hours extends Forecast_Data_Next1Hours {
  @override
  final Forecast_Data_Next1Hours_Summary summary;
  @override
  final Forecast_Data_Next1Hours_Details details;

  factory _$Forecast_Data_Next1Hours([void Function(Forecast_Data_Next1HoursBuilder)? updates]) =>
      (Forecast_Data_Next1HoursBuilder()..update(updates))._build();

  _$Forecast_Data_Next1Hours._({required this.summary, required this.details}) : super._() {
    BuiltValueNullFieldError.checkNotNull(summary, r'Forecast_Data_Next1Hours', 'summary');
    BuiltValueNullFieldError.checkNotNull(details, r'Forecast_Data_Next1Hours', 'details');
  }

  @override
  Forecast_Data_Next1Hours rebuild(void Function(Forecast_Data_Next1HoursBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next1HoursBuilder toBuilder() => Forecast_Data_Next1HoursBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next1Hours && summary == other.summary && details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next1Hours')
          ..add('summary', summary)
          ..add('details', details))
        .toString();
  }
}

class Forecast_Data_Next1HoursBuilder
    implements
        Builder<Forecast_Data_Next1Hours, Forecast_Data_Next1HoursBuilder>,
        $Forecast_Data_Next1HoursInterfaceBuilder {
  _$Forecast_Data_Next1Hours? _$v;

  Forecast_Data_Next1Hours_SummaryBuilder? _summary;
  Forecast_Data_Next1Hours_SummaryBuilder get summary => _$this._summary ??= Forecast_Data_Next1Hours_SummaryBuilder();
  set summary(covariant Forecast_Data_Next1Hours_SummaryBuilder? summary) => _$this._summary = summary;

  Forecast_Data_Next1Hours_DetailsBuilder? _details;
  Forecast_Data_Next1Hours_DetailsBuilder get details => _$this._details ??= Forecast_Data_Next1Hours_DetailsBuilder();
  set details(covariant Forecast_Data_Next1Hours_DetailsBuilder? details) => _$this._details = details;

  Forecast_Data_Next1HoursBuilder() {
    Forecast_Data_Next1Hours._defaults(this);
  }

  Forecast_Data_Next1HoursBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary.toBuilder();
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next1Hours other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next1Hours;
  }

  @override
  void update(void Function(Forecast_Data_Next1HoursBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next1Hours build() => _build();

  _$Forecast_Data_Next1Hours _build() {
    Forecast_Data_Next1Hours._validate(this);
    _$Forecast_Data_Next1Hours _$result;
    try {
      _$result = _$v ?? _$Forecast_Data_Next1Hours._(summary: summary.build(), details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Forecast_Data_Next1Hours', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next6Hours_SummaryInterfaceBuilder {
  void replace($Forecast_Data_Next6Hours_SummaryInterface other);
  void update(void Function($Forecast_Data_Next6Hours_SummaryInterfaceBuilder) updates);
  String? get symbolCode;
  set symbolCode(String? symbolCode);
}

class _$Forecast_Data_Next6Hours_Summary extends Forecast_Data_Next6Hours_Summary {
  @override
  final String symbolCode;

  factory _$Forecast_Data_Next6Hours_Summary([void Function(Forecast_Data_Next6Hours_SummaryBuilder)? updates]) =>
      (Forecast_Data_Next6Hours_SummaryBuilder()..update(updates))._build();

  _$Forecast_Data_Next6Hours_Summary._({required this.symbolCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(symbolCode, r'Forecast_Data_Next6Hours_Summary', 'symbolCode');
  }

  @override
  Forecast_Data_Next6Hours_Summary rebuild(void Function(Forecast_Data_Next6Hours_SummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next6Hours_SummaryBuilder toBuilder() => Forecast_Data_Next6Hours_SummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next6Hours_Summary && symbolCode == other.symbolCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, symbolCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next6Hours_Summary')..add('symbolCode', symbolCode)).toString();
  }
}

class Forecast_Data_Next6Hours_SummaryBuilder
    implements
        Builder<Forecast_Data_Next6Hours_Summary, Forecast_Data_Next6Hours_SummaryBuilder>,
        $Forecast_Data_Next6Hours_SummaryInterfaceBuilder {
  _$Forecast_Data_Next6Hours_Summary? _$v;

  String? _symbolCode;
  String? get symbolCode => _$this._symbolCode;
  set symbolCode(covariant String? symbolCode) => _$this._symbolCode = symbolCode;

  Forecast_Data_Next6Hours_SummaryBuilder() {
    Forecast_Data_Next6Hours_Summary._defaults(this);
  }

  Forecast_Data_Next6Hours_SummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _symbolCode = $v.symbolCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next6Hours_Summary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next6Hours_Summary;
  }

  @override
  void update(void Function(Forecast_Data_Next6Hours_SummaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next6Hours_Summary build() => _build();

  _$Forecast_Data_Next6Hours_Summary _build() {
    Forecast_Data_Next6Hours_Summary._validate(this);
    final _$result = _$v ??
        _$Forecast_Data_Next6Hours_Summary._(
            symbolCode:
                BuiltValueNullFieldError.checkNotNull(symbolCode, r'Forecast_Data_Next6Hours_Summary', 'symbolCode'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next6Hours_DetailsInterfaceBuilder {
  void replace($Forecast_Data_Next6Hours_DetailsInterface other);
  void update(void Function($Forecast_Data_Next6Hours_DetailsInterfaceBuilder) updates);
  num? get precipitationAmount;
  set precipitationAmount(num? precipitationAmount);
}

class _$Forecast_Data_Next6Hours_Details extends Forecast_Data_Next6Hours_Details {
  @override
  final num? precipitationAmount;

  factory _$Forecast_Data_Next6Hours_Details([void Function(Forecast_Data_Next6Hours_DetailsBuilder)? updates]) =>
      (Forecast_Data_Next6Hours_DetailsBuilder()..update(updates))._build();

  _$Forecast_Data_Next6Hours_Details._({this.precipitationAmount}) : super._();

  @override
  Forecast_Data_Next6Hours_Details rebuild(void Function(Forecast_Data_Next6Hours_DetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next6Hours_DetailsBuilder toBuilder() => Forecast_Data_Next6Hours_DetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next6Hours_Details && precipitationAmount == other.precipitationAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, precipitationAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next6Hours_Details')
          ..add('precipitationAmount', precipitationAmount))
        .toString();
  }
}

class Forecast_Data_Next6Hours_DetailsBuilder
    implements
        Builder<Forecast_Data_Next6Hours_Details, Forecast_Data_Next6Hours_DetailsBuilder>,
        $Forecast_Data_Next6Hours_DetailsInterfaceBuilder {
  _$Forecast_Data_Next6Hours_Details? _$v;

  num? _precipitationAmount;
  num? get precipitationAmount => _$this._precipitationAmount;
  set precipitationAmount(covariant num? precipitationAmount) => _$this._precipitationAmount = precipitationAmount;

  Forecast_Data_Next6Hours_DetailsBuilder() {
    Forecast_Data_Next6Hours_Details._defaults(this);
  }

  Forecast_Data_Next6Hours_DetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _precipitationAmount = $v.precipitationAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next6Hours_Details other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next6Hours_Details;
  }

  @override
  void update(void Function(Forecast_Data_Next6Hours_DetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next6Hours_Details build() => _build();

  _$Forecast_Data_Next6Hours_Details _build() {
    Forecast_Data_Next6Hours_Details._validate(this);
    final _$result = _$v ?? _$Forecast_Data_Next6Hours_Details._(precipitationAmount: precipitationAmount);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_Data_Next6HoursInterfaceBuilder {
  void replace($Forecast_Data_Next6HoursInterface other);
  void update(void Function($Forecast_Data_Next6HoursInterfaceBuilder) updates);
  Forecast_Data_Next6Hours_SummaryBuilder get summary;
  set summary(Forecast_Data_Next6Hours_SummaryBuilder? summary);

  Forecast_Data_Next6Hours_DetailsBuilder get details;
  set details(Forecast_Data_Next6Hours_DetailsBuilder? details);
}

class _$Forecast_Data_Next6Hours extends Forecast_Data_Next6Hours {
  @override
  final Forecast_Data_Next6Hours_Summary summary;
  @override
  final Forecast_Data_Next6Hours_Details details;

  factory _$Forecast_Data_Next6Hours([void Function(Forecast_Data_Next6HoursBuilder)? updates]) =>
      (Forecast_Data_Next6HoursBuilder()..update(updates))._build();

  _$Forecast_Data_Next6Hours._({required this.summary, required this.details}) : super._() {
    BuiltValueNullFieldError.checkNotNull(summary, r'Forecast_Data_Next6Hours', 'summary');
    BuiltValueNullFieldError.checkNotNull(details, r'Forecast_Data_Next6Hours', 'details');
  }

  @override
  Forecast_Data_Next6Hours rebuild(void Function(Forecast_Data_Next6HoursBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Forecast_Data_Next6HoursBuilder toBuilder() => Forecast_Data_Next6HoursBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data_Next6Hours && summary == other.summary && details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data_Next6Hours')
          ..add('summary', summary)
          ..add('details', details))
        .toString();
  }
}

class Forecast_Data_Next6HoursBuilder
    implements
        Builder<Forecast_Data_Next6Hours, Forecast_Data_Next6HoursBuilder>,
        $Forecast_Data_Next6HoursInterfaceBuilder {
  _$Forecast_Data_Next6Hours? _$v;

  Forecast_Data_Next6Hours_SummaryBuilder? _summary;
  Forecast_Data_Next6Hours_SummaryBuilder get summary => _$this._summary ??= Forecast_Data_Next6Hours_SummaryBuilder();
  set summary(covariant Forecast_Data_Next6Hours_SummaryBuilder? summary) => _$this._summary = summary;

  Forecast_Data_Next6Hours_DetailsBuilder? _details;
  Forecast_Data_Next6Hours_DetailsBuilder get details => _$this._details ??= Forecast_Data_Next6Hours_DetailsBuilder();
  set details(covariant Forecast_Data_Next6Hours_DetailsBuilder? details) => _$this._details = details;

  Forecast_Data_Next6HoursBuilder() {
    Forecast_Data_Next6Hours._defaults(this);
  }

  Forecast_Data_Next6HoursBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary.toBuilder();
      _details = $v.details.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data_Next6Hours other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data_Next6Hours;
  }

  @override
  void update(void Function(Forecast_Data_Next6HoursBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data_Next6Hours build() => _build();

  _$Forecast_Data_Next6Hours _build() {
    Forecast_Data_Next6Hours._validate(this);
    _$Forecast_Data_Next6Hours _$result;
    try {
      _$result = _$v ?? _$Forecast_Data_Next6Hours._(summary: summary.build(), details: details.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'details';
        details.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Forecast_Data_Next6Hours', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Forecast_DataInterfaceBuilder {
  void replace($Forecast_DataInterface other);
  void update(void Function($Forecast_DataInterfaceBuilder) updates);
  Forecast_Data_InstantBuilder get instant;
  set instant(Forecast_Data_InstantBuilder? instant);

  Forecast_Data_Next12HoursBuilder get next12Hours;
  set next12Hours(Forecast_Data_Next12HoursBuilder? next12Hours);

  Forecast_Data_Next1HoursBuilder get next1Hours;
  set next1Hours(Forecast_Data_Next1HoursBuilder? next1Hours);

  Forecast_Data_Next6HoursBuilder get next6Hours;
  set next6Hours(Forecast_Data_Next6HoursBuilder? next6Hours);
}

class _$Forecast_Data extends Forecast_Data {
  @override
  final Forecast_Data_Instant instant;
  @override
  final Forecast_Data_Next12Hours next12Hours;
  @override
  final Forecast_Data_Next1Hours next1Hours;
  @override
  final Forecast_Data_Next6Hours next6Hours;

  factory _$Forecast_Data([void Function(Forecast_DataBuilder)? updates]) =>
      (Forecast_DataBuilder()..update(updates))._build();

  _$Forecast_Data._(
      {required this.instant, required this.next12Hours, required this.next1Hours, required this.next6Hours})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(instant, r'Forecast_Data', 'instant');
    BuiltValueNullFieldError.checkNotNull(next12Hours, r'Forecast_Data', 'next12Hours');
    BuiltValueNullFieldError.checkNotNull(next1Hours, r'Forecast_Data', 'next1Hours');
    BuiltValueNullFieldError.checkNotNull(next6Hours, r'Forecast_Data', 'next6Hours');
  }

  @override
  Forecast_Data rebuild(void Function(Forecast_DataBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  Forecast_DataBuilder toBuilder() => Forecast_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast_Data &&
        instant == other.instant &&
        next12Hours == other.next12Hours &&
        next1Hours == other.next1Hours &&
        next6Hours == other.next6Hours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, instant.hashCode);
    _$hash = $jc(_$hash, next12Hours.hashCode);
    _$hash = $jc(_$hash, next1Hours.hashCode);
    _$hash = $jc(_$hash, next6Hours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast_Data')
          ..add('instant', instant)
          ..add('next12Hours', next12Hours)
          ..add('next1Hours', next1Hours)
          ..add('next6Hours', next6Hours))
        .toString();
  }
}

class Forecast_DataBuilder implements Builder<Forecast_Data, Forecast_DataBuilder>, $Forecast_DataInterfaceBuilder {
  _$Forecast_Data? _$v;

  Forecast_Data_InstantBuilder? _instant;
  Forecast_Data_InstantBuilder get instant => _$this._instant ??= Forecast_Data_InstantBuilder();
  set instant(covariant Forecast_Data_InstantBuilder? instant) => _$this._instant = instant;

  Forecast_Data_Next12HoursBuilder? _next12Hours;
  Forecast_Data_Next12HoursBuilder get next12Hours => _$this._next12Hours ??= Forecast_Data_Next12HoursBuilder();
  set next12Hours(covariant Forecast_Data_Next12HoursBuilder? next12Hours) => _$this._next12Hours = next12Hours;

  Forecast_Data_Next1HoursBuilder? _next1Hours;
  Forecast_Data_Next1HoursBuilder get next1Hours => _$this._next1Hours ??= Forecast_Data_Next1HoursBuilder();
  set next1Hours(covariant Forecast_Data_Next1HoursBuilder? next1Hours) => _$this._next1Hours = next1Hours;

  Forecast_Data_Next6HoursBuilder? _next6Hours;
  Forecast_Data_Next6HoursBuilder get next6Hours => _$this._next6Hours ??= Forecast_Data_Next6HoursBuilder();
  set next6Hours(covariant Forecast_Data_Next6HoursBuilder? next6Hours) => _$this._next6Hours = next6Hours;

  Forecast_DataBuilder() {
    Forecast_Data._defaults(this);
  }

  Forecast_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _instant = $v.instant.toBuilder();
      _next12Hours = $v.next12Hours.toBuilder();
      _next1Hours = $v.next1Hours.toBuilder();
      _next6Hours = $v.next6Hours.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast_Data;
  }

  @override
  void update(void Function(Forecast_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast_Data build() => _build();

  _$Forecast_Data _build() {
    Forecast_Data._validate(this);
    _$Forecast_Data _$result;
    try {
      _$result = _$v ??
          _$Forecast_Data._(
              instant: instant.build(),
              next12Hours: next12Hours.build(),
              next1Hours: next1Hours.build(),
              next6Hours: next6Hours.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'instant';
        instant.build();
        _$failedField = 'next12Hours';
        next12Hours.build();
        _$failedField = 'next1Hours';
        next1Hours.build();
        _$failedField = 'next6Hours';
        next6Hours.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Forecast_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ForecastInterfaceBuilder {
  void replace($ForecastInterface other);
  void update(void Function($ForecastInterfaceBuilder) updates);
  String? get time;
  set time(String? time);

  Forecast_DataBuilder get data;
  set data(Forecast_DataBuilder? data);
}

class _$Forecast extends Forecast {
  @override
  final String time;
  @override
  final Forecast_Data data;

  factory _$Forecast([void Function(ForecastBuilder)? updates]) => (ForecastBuilder()..update(updates))._build();

  _$Forecast._({required this.time, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(time, r'Forecast', 'time');
    BuiltValueNullFieldError.checkNotNull(data, r'Forecast', 'data');
  }

  @override
  Forecast rebuild(void Function(ForecastBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ForecastBuilder toBuilder() => ForecastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast && time == other.time && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Forecast')
          ..add('time', time)
          ..add('data', data))
        .toString();
  }
}

class ForecastBuilder implements Builder<Forecast, ForecastBuilder>, $ForecastInterfaceBuilder {
  _$Forecast? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(covariant String? time) => _$this._time = time;

  Forecast_DataBuilder? _data;
  Forecast_DataBuilder get data => _$this._data ??= Forecast_DataBuilder();
  set data(covariant Forecast_DataBuilder? data) => _$this._data = data;

  ForecastBuilder() {
    Forecast._defaults(this);
  }

  ForecastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Forecast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast;
  }

  @override
  void update(void Function(ForecastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Forecast build() => _build();

  _$Forecast _build() {
    Forecast._validate(this);
    _$Forecast _$result;
    try {
      _$result = _$v ??
          _$Forecast._(time: BuiltValueNullFieldError.checkNotNull(time, r'Forecast', 'time'), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Forecast', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1InterfaceBuilder {
  void replace($WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Interface other);
  void update(void Function($WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1InterfaceBuilder) updates);
  String? get error;
  set error(String? error);
}

class _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1
    extends WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 {
  @override
  final String error;

  factory _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1(
          [void Function(WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder)? updates]) =>
      (WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder()..update(updates))._build();

  _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1._({required this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1', 'error');
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 rebuild(
          void Function(WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder toBuilder() =>
      WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 && error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1')
          ..add('error', error))
        .toString();
  }
}

class WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder
    implements
        Builder<WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1,
            WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder>,
        $WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1InterfaceBuilder {
  _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(covariant String? error) => _$this._error = error;

  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder() {
    WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1._defaults(this);
  }

  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1;
  }

  @override
  void update(void Function(WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 build() => _build();

  _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1 _build() {
    WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1._validate(this);
    final _$result = _$v ??
        _$WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1._(
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'WeatherStatusGetForecastResponseApplicationJson_Ocs_Data1', 'error'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetForecastResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusGetForecastResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusGetForecastResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data? get data;
  set data(WeatherStatusGetForecastResponseApplicationJson_Ocs_Data? data);
}

class _$WeatherStatusGetForecastResponseApplicationJson_Ocs
    extends WeatherStatusGetForecastResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final WeatherStatusGetForecastResponseApplicationJson_Ocs_Data data;

  factory _$WeatherStatusGetForecastResponseApplicationJson_Ocs(
          [void Function(WeatherStatusGetForecastResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusGetForecastResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusGetForecastResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusGetForecastResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusGetForecastResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusGetForecastResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetForecastResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusGetForecastResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is WeatherStatusGetForecastResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == _$dynamicOther.data;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusGetForecastResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusGetForecastResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusGetForecastResponseApplicationJson_Ocs,
            WeatherStatusGetForecastResponseApplicationJson_OcsBuilder>,
        $WeatherStatusGetForecastResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusGetForecastResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data? _data;
  WeatherStatusGetForecastResponseApplicationJson_Ocs_Data? get data => _$this._data;
  set data(covariant WeatherStatusGetForecastResponseApplicationJson_Ocs_Data? data) => _$this._data = data;

  WeatherStatusGetForecastResponseApplicationJson_OcsBuilder() {
    WeatherStatusGetForecastResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusGetForecastResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetForecastResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetForecastResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusGetForecastResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusGetForecastResponseApplicationJson_Ocs _build() {
    WeatherStatusGetForecastResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusGetForecastResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$WeatherStatusGetForecastResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'WeatherStatusGetForecastResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusGetForecastResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetForecastResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusGetForecastResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusGetForecastResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusGetForecastResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusGetForecastResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusGetForecastResponseApplicationJson extends WeatherStatusGetForecastResponseApplicationJson {
  @override
  final WeatherStatusGetForecastResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusGetForecastResponseApplicationJson(
          [void Function(WeatherStatusGetForecastResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusGetForecastResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusGetForecastResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusGetForecastResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson rebuild(
          void Function(WeatherStatusGetForecastResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetForecastResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusGetForecastResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusGetForecastResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusGetForecastResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class WeatherStatusGetForecastResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusGetForecastResponseApplicationJson,
            WeatherStatusGetForecastResponseApplicationJsonBuilder>,
        $WeatherStatusGetForecastResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusGetForecastResponseApplicationJson? _$v;

  WeatherStatusGetForecastResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusGetForecastResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusGetForecastResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusGetForecastResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusGetForecastResponseApplicationJsonBuilder() {
    WeatherStatusGetForecastResponseApplicationJson._defaults(this);
  }

  WeatherStatusGetForecastResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetForecastResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetForecastResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusGetForecastResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson build() => _build();

  _$WeatherStatusGetForecastResponseApplicationJson _build() {
    WeatherStatusGetForecastResponseApplicationJson._validate(this);
    _$WeatherStatusGetForecastResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusGetForecastResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusGetForecastResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetFavoritesResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusGetFavoritesResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusGetFavoritesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<String> get data;
  set data(ListBuilder<String>? data);
}

class _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs
    extends WeatherStatusGetFavoritesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<String> data;

  factory _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs(
          [void Function(WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusGetFavoritesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusGetFavoritesResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusGetFavoritesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusGetFavoritesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder>,
        $WeatherStatusGetFavoritesResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<String>? _data;
  ListBuilder<String> get data => _$this._data ??= ListBuilder<String>();
  set data(covariant ListBuilder<String>? data) => _$this._data = data;

  WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder() {
    WeatherStatusGetFavoritesResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetFavoritesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs _build() {
    WeatherStatusGetFavoritesResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusGetFavoritesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusGetFavoritesResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusGetFavoritesResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusGetFavoritesResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusGetFavoritesResponseApplicationJson extends WeatherStatusGetFavoritesResponseApplicationJson {
  @override
  final WeatherStatusGetFavoritesResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusGetFavoritesResponseApplicationJson(
          [void Function(WeatherStatusGetFavoritesResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusGetFavoritesResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusGetFavoritesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusGetFavoritesResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson rebuild(
          void Function(WeatherStatusGetFavoritesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusGetFavoritesResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusGetFavoritesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusGetFavoritesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusGetFavoritesResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class WeatherStatusGetFavoritesResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusGetFavoritesResponseApplicationJson,
            WeatherStatusGetFavoritesResponseApplicationJsonBuilder>,
        $WeatherStatusGetFavoritesResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusGetFavoritesResponseApplicationJson? _$v;

  WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusGetFavoritesResponseApplicationJsonBuilder() {
    WeatherStatusGetFavoritesResponseApplicationJson._defaults(this);
  }

  WeatherStatusGetFavoritesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusGetFavoritesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusGetFavoritesResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusGetFavoritesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson build() => _build();

  _$WeatherStatusGetFavoritesResponseApplicationJson _build() {
    WeatherStatusGetFavoritesResponseApplicationJson._validate(this);
    _$WeatherStatusGetFavoritesResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusGetFavoritesResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusGetFavoritesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetFavoritesRequestApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusSetFavoritesRequestApplicationJsonInterface other);
  void update(void Function($WeatherStatusSetFavoritesRequestApplicationJsonInterfaceBuilder) updates);
  ListBuilder<String> get favorites;
  set favorites(ListBuilder<String>? favorites);
}

class _$WeatherStatusSetFavoritesRequestApplicationJson extends WeatherStatusSetFavoritesRequestApplicationJson {
  @override
  final BuiltList<String> favorites;

  factory _$WeatherStatusSetFavoritesRequestApplicationJson(
          [void Function(WeatherStatusSetFavoritesRequestApplicationJsonBuilder)? updates]) =>
      (WeatherStatusSetFavoritesRequestApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusSetFavoritesRequestApplicationJson._({required this.favorites}) : super._() {
    BuiltValueNullFieldError.checkNotNull(favorites, r'WeatherStatusSetFavoritesRequestApplicationJson', 'favorites');
  }

  @override
  WeatherStatusSetFavoritesRequestApplicationJson rebuild(
          void Function(WeatherStatusSetFavoritesRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetFavoritesRequestApplicationJsonBuilder toBuilder() =>
      WeatherStatusSetFavoritesRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetFavoritesRequestApplicationJson && favorites == other.favorites;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, favorites.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherStatusSetFavoritesRequestApplicationJson')
          ..add('favorites', favorites))
        .toString();
  }
}

class WeatherStatusSetFavoritesRequestApplicationJsonBuilder
    implements
        Builder<WeatherStatusSetFavoritesRequestApplicationJson,
            WeatherStatusSetFavoritesRequestApplicationJsonBuilder>,
        $WeatherStatusSetFavoritesRequestApplicationJsonInterfaceBuilder {
  _$WeatherStatusSetFavoritesRequestApplicationJson? _$v;

  ListBuilder<String>? _favorites;
  ListBuilder<String> get favorites => _$this._favorites ??= ListBuilder<String>();
  set favorites(covariant ListBuilder<String>? favorites) => _$this._favorites = favorites;

  WeatherStatusSetFavoritesRequestApplicationJsonBuilder() {
    WeatherStatusSetFavoritesRequestApplicationJson._defaults(this);
  }

  WeatherStatusSetFavoritesRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _favorites = $v.favorites.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetFavoritesRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetFavoritesRequestApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusSetFavoritesRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetFavoritesRequestApplicationJson build() => _build();

  _$WeatherStatusSetFavoritesRequestApplicationJson _build() {
    WeatherStatusSetFavoritesRequestApplicationJson._validate(this);
    _$WeatherStatusSetFavoritesRequestApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusSetFavoritesRequestApplicationJson._(favorites: favorites.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favorites';
        favorites.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusSetFavoritesRequestApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetFavoritesResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WeatherStatusSetFavoritesResponseApplicationJson_OcsInterface other);
  void update(void Function($WeatherStatusSetFavoritesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  SuccessBuilder get data;
  set data(SuccessBuilder? data);
}

class _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs
    extends WeatherStatusSetFavoritesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Success data;

  factory _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs(
          [void Function(WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder)? updates]) =>
      (WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WeatherStatusSetFavoritesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WeatherStatusSetFavoritesResponseApplicationJson_Ocs', 'data');
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs rebuild(
          void Function(WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder toBuilder() =>
      WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetFavoritesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusSetFavoritesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder
    implements
        Builder<WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder>,
        $WeatherStatusSetFavoritesResponseApplicationJson_OcsInterfaceBuilder {
  _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  SuccessBuilder? _data;
  SuccessBuilder get data => _$this._data ??= SuccessBuilder();
  set data(covariant SuccessBuilder? data) => _$this._data = data;

  WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder() {
    WeatherStatusSetFavoritesResponseApplicationJson_Ocs._defaults(this);
  }

  WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetFavoritesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs build() => _build();

  _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs _build() {
    WeatherStatusSetFavoritesResponseApplicationJson_Ocs._validate(this);
    _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusSetFavoritesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WeatherStatusSetFavoritesResponseApplicationJsonInterfaceBuilder {
  void replace($WeatherStatusSetFavoritesResponseApplicationJsonInterface other);
  void update(void Function($WeatherStatusSetFavoritesResponseApplicationJsonInterfaceBuilder) updates);
  WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder? ocs);
}

class _$WeatherStatusSetFavoritesResponseApplicationJson extends WeatherStatusSetFavoritesResponseApplicationJson {
  @override
  final WeatherStatusSetFavoritesResponseApplicationJson_Ocs ocs;

  factory _$WeatherStatusSetFavoritesResponseApplicationJson(
          [void Function(WeatherStatusSetFavoritesResponseApplicationJsonBuilder)? updates]) =>
      (WeatherStatusSetFavoritesResponseApplicationJsonBuilder()..update(updates))._build();

  _$WeatherStatusSetFavoritesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WeatherStatusSetFavoritesResponseApplicationJson', 'ocs');
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson rebuild(
          void Function(WeatherStatusSetFavoritesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusSetFavoritesResponseApplicationJsonBuilder toBuilder() =>
      WeatherStatusSetFavoritesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusSetFavoritesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WeatherStatusSetFavoritesResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class WeatherStatusSetFavoritesResponseApplicationJsonBuilder
    implements
        Builder<WeatherStatusSetFavoritesResponseApplicationJson,
            WeatherStatusSetFavoritesResponseApplicationJsonBuilder>,
        $WeatherStatusSetFavoritesResponseApplicationJsonInterfaceBuilder {
  _$WeatherStatusSetFavoritesResponseApplicationJson? _$v;

  WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder? _ocs;
  WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder();
  set ocs(covariant WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WeatherStatusSetFavoritesResponseApplicationJsonBuilder() {
    WeatherStatusSetFavoritesResponseApplicationJson._defaults(this);
  }

  WeatherStatusSetFavoritesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusSetFavoritesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusSetFavoritesResponseApplicationJson;
  }

  @override
  void update(void Function(WeatherStatusSetFavoritesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson build() => _build();

  _$WeatherStatusSetFavoritesResponseApplicationJson _build() {
    WeatherStatusSetFavoritesResponseApplicationJson._validate(this);
    _$WeatherStatusSetFavoritesResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WeatherStatusSetFavoritesResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WeatherStatusSetFavoritesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Capabilities_WeatherStatusInterfaceBuilder {
  void replace($Capabilities_WeatherStatusInterface other);
  void update(void Function($Capabilities_WeatherStatusInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$Capabilities_WeatherStatus extends Capabilities_WeatherStatus {
  @override
  final bool enabled;

  factory _$Capabilities_WeatherStatus([void Function(Capabilities_WeatherStatusBuilder)? updates]) =>
      (Capabilities_WeatherStatusBuilder()..update(updates))._build();

  _$Capabilities_WeatherStatus._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_WeatherStatus', 'enabled');
  }

  @override
  Capabilities_WeatherStatus rebuild(void Function(Capabilities_WeatherStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_WeatherStatusBuilder toBuilder() => Capabilities_WeatherStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_WeatherStatus && enabled == other.enabled;
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
    return (newBuiltValueToStringHelper(r'Capabilities_WeatherStatus')..add('enabled', enabled)).toString();
  }
}

class Capabilities_WeatherStatusBuilder
    implements
        Builder<Capabilities_WeatherStatus, Capabilities_WeatherStatusBuilder>,
        $Capabilities_WeatherStatusInterfaceBuilder {
  _$Capabilities_WeatherStatus? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  Capabilities_WeatherStatusBuilder() {
    Capabilities_WeatherStatus._defaults(this);
  }

  Capabilities_WeatherStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_WeatherStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_WeatherStatus;
  }

  @override
  void update(void Function(Capabilities_WeatherStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_WeatherStatus build() => _build();

  _$Capabilities_WeatherStatus _build() {
    Capabilities_WeatherStatus._validate(this);
    final _$result = _$v ??
        _$Capabilities_WeatherStatus._(
            enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_WeatherStatus', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $CapabilitiesInterfaceBuilder {
  void replace($CapabilitiesInterface other);
  void update(void Function($CapabilitiesInterfaceBuilder) updates);
  Capabilities_WeatherStatusBuilder get weatherStatus;
  set weatherStatus(Capabilities_WeatherStatusBuilder? weatherStatus);
}

class _$Capabilities extends Capabilities {
  @override
  final Capabilities_WeatherStatus weatherStatus;

  factory _$Capabilities([void Function(CapabilitiesBuilder)? updates]) =>
      (CapabilitiesBuilder()..update(updates))._build();

  _$Capabilities._({required this.weatherStatus}) : super._() {
    BuiltValueNullFieldError.checkNotNull(weatherStatus, r'Capabilities', 'weatherStatus');
  }

  @override
  Capabilities rebuild(void Function(CapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CapabilitiesBuilder toBuilder() => CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities && weatherStatus == other.weatherStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weatherStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities')..add('weatherStatus', weatherStatus)).toString();
  }
}

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, $CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_WeatherStatusBuilder? _weatherStatus;
  Capabilities_WeatherStatusBuilder get weatherStatus => _$this._weatherStatus ??= Capabilities_WeatherStatusBuilder();
  set weatherStatus(covariant Capabilities_WeatherStatusBuilder? weatherStatus) =>
      _$this._weatherStatus = weatherStatus;

  CapabilitiesBuilder() {
    Capabilities._defaults(this);
  }

  CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weatherStatus = $v.weatherStatus.toBuilder();
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
      _$result = _$v ?? _$Capabilities._(weatherStatus: weatherStatus.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weatherStatus';
        weatherStatus.build();
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
