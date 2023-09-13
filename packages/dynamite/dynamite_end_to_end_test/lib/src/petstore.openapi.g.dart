// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petstore.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SwaggerPetstoreOpenAPI30Pet_Status _$swaggerPetstoreOpenAPI30PetStatusAvailable =
    SwaggerPetstoreOpenAPI30Pet_Status._('available');
const SwaggerPetstoreOpenAPI30Pet_Status _$swaggerPetstoreOpenAPI30PetStatusPending =
    SwaggerPetstoreOpenAPI30Pet_Status._('pending');
const SwaggerPetstoreOpenAPI30Pet_Status _$swaggerPetstoreOpenAPI30PetStatusSold =
    SwaggerPetstoreOpenAPI30Pet_Status._('sold');

SwaggerPetstoreOpenAPI30Pet_Status _$valueOfSwaggerPetstoreOpenAPI30Pet_Status(String name) {
  switch (name) {
    case 'available':
      return _$swaggerPetstoreOpenAPI30PetStatusAvailable;
    case 'pending':
      return _$swaggerPetstoreOpenAPI30PetStatusPending;
    case 'sold':
      return _$swaggerPetstoreOpenAPI30PetStatusSold;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SwaggerPetstoreOpenAPI30Pet_Status> _$swaggerPetstoreOpenAPI30PetStatusValues =
    BuiltSet<SwaggerPetstoreOpenAPI30Pet_Status>(const <SwaggerPetstoreOpenAPI30Pet_Status>[
  _$swaggerPetstoreOpenAPI30PetStatusAvailable,
  _$swaggerPetstoreOpenAPI30PetStatusPending,
  _$swaggerPetstoreOpenAPI30PetStatusSold,
]);

const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusAvailable =
    SwaggerPetstoreOpenAPI30FindPetsByStatusStatus._('available');
const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusPending =
    SwaggerPetstoreOpenAPI30FindPetsByStatusStatus._('pending');
const SwaggerPetstoreOpenAPI30FindPetsByStatusStatus _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusSold =
    SwaggerPetstoreOpenAPI30FindPetsByStatusStatus._('sold');

SwaggerPetstoreOpenAPI30FindPetsByStatusStatus _$valueOfSwaggerPetstoreOpenAPI30FindPetsByStatusStatus(String name) {
  switch (name) {
    case 'available':
      return _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusAvailable;
    case 'pending':
      return _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusPending;
    case 'sold':
      return _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusSold;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SwaggerPetstoreOpenAPI30FindPetsByStatusStatus> _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusValues =
    BuiltSet<SwaggerPetstoreOpenAPI30FindPetsByStatusStatus>(const <SwaggerPetstoreOpenAPI30FindPetsByStatusStatus>[
  _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusAvailable,
  _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusPending,
  _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusSold,
]);

const SwaggerPetstoreOpenAPI30Order_Status _$swaggerPetstoreOpenAPI30OrderStatusPlaced =
    SwaggerPetstoreOpenAPI30Order_Status._('placed');
const SwaggerPetstoreOpenAPI30Order_Status _$swaggerPetstoreOpenAPI30OrderStatusApproved =
    SwaggerPetstoreOpenAPI30Order_Status._('approved');
const SwaggerPetstoreOpenAPI30Order_Status _$swaggerPetstoreOpenAPI30OrderStatusDelivered =
    SwaggerPetstoreOpenAPI30Order_Status._('delivered');

SwaggerPetstoreOpenAPI30Order_Status _$valueOfSwaggerPetstoreOpenAPI30Order_Status(String name) {
  switch (name) {
    case 'placed':
      return _$swaggerPetstoreOpenAPI30OrderStatusPlaced;
    case 'approved':
      return _$swaggerPetstoreOpenAPI30OrderStatusApproved;
    case 'delivered':
      return _$swaggerPetstoreOpenAPI30OrderStatusDelivered;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SwaggerPetstoreOpenAPI30Order_Status> _$swaggerPetstoreOpenAPI30OrderStatusValues =
    BuiltSet<SwaggerPetstoreOpenAPI30Order_Status>(const <SwaggerPetstoreOpenAPI30Order_Status>[
  _$swaggerPetstoreOpenAPI30OrderStatusPlaced,
  _$swaggerPetstoreOpenAPI30OrderStatusApproved,
  _$swaggerPetstoreOpenAPI30OrderStatusDelivered,
]);

Serializer<SwaggerPetstoreOpenAPI30Category> _$swaggerPetstoreOpenAPI30CategorySerializer =
    _$SwaggerPetstoreOpenAPI30CategorySerializer();
Serializer<SwaggerPetstoreOpenAPI30Tag> _$swaggerPetstoreOpenAPI30TagSerializer =
    _$SwaggerPetstoreOpenAPI30TagSerializer();
Serializer<SwaggerPetstoreOpenAPI30Pet_Status> _$swaggerPetstoreOpenAPI30PetStatusSerializer =
    _$SwaggerPetstoreOpenAPI30Pet_StatusSerializer();
Serializer<SwaggerPetstoreOpenAPI30Pet> _$swaggerPetstoreOpenAPI30PetSerializer =
    _$SwaggerPetstoreOpenAPI30PetSerializer();
Serializer<SwaggerPetstoreOpenAPI30FindPetsByStatusStatus> _$swaggerPetstoreOpenAPI30FindPetsByStatusStatusSerializer =
    _$SwaggerPetstoreOpenAPI30FindPetsByStatusStatusSerializer();
Serializer<SwaggerPetstoreOpenAPI30ApiResponse> _$swaggerPetstoreOpenAPI30ApiResponseSerializer =
    _$SwaggerPetstoreOpenAPI30ApiResponseSerializer();
Serializer<SwaggerPetstoreOpenAPI30Order_Status> _$swaggerPetstoreOpenAPI30OrderStatusSerializer =
    _$SwaggerPetstoreOpenAPI30Order_StatusSerializer();
Serializer<SwaggerPetstoreOpenAPI30Order> _$swaggerPetstoreOpenAPI30OrderSerializer =
    _$SwaggerPetstoreOpenAPI30OrderSerializer();
Serializer<SwaggerPetstoreOpenAPI30User> _$swaggerPetstoreOpenAPI30UserSerializer =
    _$SwaggerPetstoreOpenAPI30UserSerializer();
Serializer<SwaggerPetstoreOpenAPI30Address> _$swaggerPetstoreOpenAPI30AddressSerializer =
    _$SwaggerPetstoreOpenAPI30AddressSerializer();
Serializer<SwaggerPetstoreOpenAPI30Customer> _$swaggerPetstoreOpenAPI30CustomerSerializer =
    _$SwaggerPetstoreOpenAPI30CustomerSerializer();

class _$SwaggerPetstoreOpenAPI30CategorySerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30Category> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30Category, _$SwaggerPetstoreOpenAPI30Category];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Category';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30Category deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30CategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30TagSerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30Tag> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30Tag, _$SwaggerPetstoreOpenAPI30Tag];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Tag';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Tag object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30Tag deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30TagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30Pet_StatusSerializer
    implements PrimitiveSerializer<SwaggerPetstoreOpenAPI30Pet_Status> {
  @override
  final Iterable<Type> types = const <Type>[SwaggerPetstoreOpenAPI30Pet_Status];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Pet_Status';

  @override
  Object serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Pet_Status object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SwaggerPetstoreOpenAPI30Pet_Status deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SwaggerPetstoreOpenAPI30Pet_Status.valueOf(serialized as String);
}

class _$SwaggerPetstoreOpenAPI30PetSerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30Pet> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30Pet, _$SwaggerPetstoreOpenAPI30Pet];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Pet';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Pet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'photoUrls',
      serializers.serialize(object.photoUrls, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Category)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Tag)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet_Status)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30Pet deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30PetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(SwaggerPetstoreOpenAPI30Category))! as SwaggerPetstoreOpenAPI30Category);
          break;
        case 'photoUrls':
          result.photoUrls.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Tag)]))!
              as BuiltList<Object?>);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(SwaggerPetstoreOpenAPI30Pet_Status)) as SwaggerPetstoreOpenAPI30Pet_Status?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30FindPetsByStatusStatusSerializer
    implements PrimitiveSerializer<SwaggerPetstoreOpenAPI30FindPetsByStatusStatus> {
  @override
  final Iterable<Type> types = const <Type>[SwaggerPetstoreOpenAPI30FindPetsByStatusStatus];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30FindPetsByStatusStatus';

  @override
  Object serialize(Serializers serializers, SwaggerPetstoreOpenAPI30FindPetsByStatusStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SwaggerPetstoreOpenAPI30FindPetsByStatusStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SwaggerPetstoreOpenAPI30FindPetsByStatusStatus.valueOf(serialized as String);
}

class _$SwaggerPetstoreOpenAPI30ApiResponseSerializer
    implements StructuredSerializer<SwaggerPetstoreOpenAPI30ApiResponse> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30ApiResponse, _$SwaggerPetstoreOpenAPI30ApiResponse];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30ApiResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30ApiResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30ApiResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30ApiResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30Order_StatusSerializer
    implements PrimitiveSerializer<SwaggerPetstoreOpenAPI30Order_Status> {
  @override
  final Iterable<Type> types = const <Type>[SwaggerPetstoreOpenAPI30Order_Status];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Order_Status';

  @override
  Object serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Order_Status object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SwaggerPetstoreOpenAPI30Order_Status deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SwaggerPetstoreOpenAPI30Order_Status.valueOf(serialized as String);
}

class _$SwaggerPetstoreOpenAPI30OrderSerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30Order> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30Order, _$SwaggerPetstoreOpenAPI30Order];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Order';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Order object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.petId;
    if (value != null) {
      result
        ..add('petId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shipDate;
    if (value != null) {
      result
        ..add('shipDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Order_Status)));
    }
    value = object.complete;
    if (value != null) {
      result
        ..add('complete')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30Order deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30OrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'petId':
          result.petId = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'shipDate':
          result.shipDate = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status =
              serializers.deserialize(value, specifiedType: const FullType(SwaggerPetstoreOpenAPI30Order_Status))
                  as SwaggerPetstoreOpenAPI30Order_Status?;
          break;
        case 'complete':
          result.complete = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30UserSerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30User> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30User, _$SwaggerPetstoreOpenAPI30User];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30User';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.userStatus;
    if (value != null) {
      result
        ..add('userStatus')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'username':
          result.username = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'userStatus':
          result.userStatus = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30AddressSerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30Address> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30Address, _$SwaggerPetstoreOpenAPI30Address];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Address';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Address object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.street;
    if (value != null) {
      result
        ..add('street')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.zip;
    if (value != null) {
      result
        ..add('zip')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30Address deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30AddressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'street':
          result.street = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'city':
          result.city = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'zip':
          result.zip = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SwaggerPetstoreOpenAPI30CustomerSerializer implements StructuredSerializer<SwaggerPetstoreOpenAPI30Customer> {
  @override
  final Iterable<Type> types = const [SwaggerPetstoreOpenAPI30Customer, _$SwaggerPetstoreOpenAPI30Customer];
  @override
  final String wireName = 'SwaggerPetstoreOpenAPI30Customer';

  @override
  Iterable<Object?> serialize(Serializers serializers, SwaggerPetstoreOpenAPI30Customer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Address)])));
    }
    return result;
  }

  @override
  SwaggerPetstoreOpenAPI30Customer deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SwaggerPetstoreOpenAPI30CustomerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'username':
          result.username = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(SwaggerPetstoreOpenAPI30Address)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30CategoryInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30CategoryInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30CategoryInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get name;
  set name(String? name);
}

class _$SwaggerPetstoreOpenAPI30Category extends SwaggerPetstoreOpenAPI30Category {
  @override
  final int? id;
  @override
  final String? name;

  factory _$SwaggerPetstoreOpenAPI30Category([void Function(SwaggerPetstoreOpenAPI30CategoryBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30CategoryBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30Category._({this.id, this.name}) : super._();

  @override
  SwaggerPetstoreOpenAPI30Category rebuild(void Function(SwaggerPetstoreOpenAPI30CategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30CategoryBuilder toBuilder() => SwaggerPetstoreOpenAPI30CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30Category && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30Category')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30CategoryBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30Category, SwaggerPetstoreOpenAPI30CategoryBuilder>,
        SwaggerPetstoreOpenAPI30CategoryInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30Category? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  SwaggerPetstoreOpenAPI30CategoryBuilder();

  SwaggerPetstoreOpenAPI30CategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30Category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30Category;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30CategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30Category build() => _build();

  _$SwaggerPetstoreOpenAPI30Category _build() {
    final _$result = _$v ?? _$SwaggerPetstoreOpenAPI30Category._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30TagInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30TagInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30TagInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get name;
  set name(String? name);
}

class _$SwaggerPetstoreOpenAPI30Tag extends SwaggerPetstoreOpenAPI30Tag {
  @override
  final int? id;
  @override
  final String? name;

  factory _$SwaggerPetstoreOpenAPI30Tag([void Function(SwaggerPetstoreOpenAPI30TagBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30TagBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30Tag._({this.id, this.name}) : super._();

  @override
  SwaggerPetstoreOpenAPI30Tag rebuild(void Function(SwaggerPetstoreOpenAPI30TagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30TagBuilder toBuilder() => SwaggerPetstoreOpenAPI30TagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30Tag && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30Tag')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30TagBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30Tag, SwaggerPetstoreOpenAPI30TagBuilder>,
        SwaggerPetstoreOpenAPI30TagInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30Tag? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  SwaggerPetstoreOpenAPI30TagBuilder();

  SwaggerPetstoreOpenAPI30TagBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30Tag other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30Tag;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30TagBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30Tag build() => _build();

  _$SwaggerPetstoreOpenAPI30Tag _build() {
    final _$result = _$v ?? _$SwaggerPetstoreOpenAPI30Tag._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30PetInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30PetInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30PetInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get name;
  set name(String? name);

  SwaggerPetstoreOpenAPI30CategoryBuilder get category;
  set category(SwaggerPetstoreOpenAPI30CategoryBuilder? category);

  ListBuilder<String> get photoUrls;
  set photoUrls(ListBuilder<String>? photoUrls);

  ListBuilder<SwaggerPetstoreOpenAPI30Tag> get tags;
  set tags(ListBuilder<SwaggerPetstoreOpenAPI30Tag>? tags);

  SwaggerPetstoreOpenAPI30Pet_Status? get status;
  set status(SwaggerPetstoreOpenAPI30Pet_Status? status);
}

class _$SwaggerPetstoreOpenAPI30Pet extends SwaggerPetstoreOpenAPI30Pet {
  @override
  final int? id;
  @override
  final String name;
  @override
  final SwaggerPetstoreOpenAPI30Category? category;
  @override
  final BuiltList<String> photoUrls;
  @override
  final BuiltList<SwaggerPetstoreOpenAPI30Tag>? tags;
  @override
  final SwaggerPetstoreOpenAPI30Pet_Status? status;

  factory _$SwaggerPetstoreOpenAPI30Pet([void Function(SwaggerPetstoreOpenAPI30PetBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30PetBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30Pet._(
      {this.id, required this.name, this.category, required this.photoUrls, this.tags, this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'SwaggerPetstoreOpenAPI30Pet', 'name');
    BuiltValueNullFieldError.checkNotNull(photoUrls, r'SwaggerPetstoreOpenAPI30Pet', 'photoUrls');
  }

  @override
  SwaggerPetstoreOpenAPI30Pet rebuild(void Function(SwaggerPetstoreOpenAPI30PetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30PetBuilder toBuilder() => SwaggerPetstoreOpenAPI30PetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30Pet &&
        id == other.id &&
        name == other.name &&
        category == other.category &&
        photoUrls == other.photoUrls &&
        tags == other.tags &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, photoUrls.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30Pet')
          ..add('id', id)
          ..add('name', name)
          ..add('category', category)
          ..add('photoUrls', photoUrls)
          ..add('tags', tags)
          ..add('status', status))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30PetBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30Pet, SwaggerPetstoreOpenAPI30PetBuilder>,
        SwaggerPetstoreOpenAPI30PetInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30Pet? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  SwaggerPetstoreOpenAPI30CategoryBuilder? _category;
  SwaggerPetstoreOpenAPI30CategoryBuilder get category =>
      _$this._category ??= SwaggerPetstoreOpenAPI30CategoryBuilder();
  set category(covariant SwaggerPetstoreOpenAPI30CategoryBuilder? category) => _$this._category = category;

  ListBuilder<String>? _photoUrls;
  ListBuilder<String> get photoUrls => _$this._photoUrls ??= ListBuilder<String>();
  set photoUrls(covariant ListBuilder<String>? photoUrls) => _$this._photoUrls = photoUrls;

  ListBuilder<SwaggerPetstoreOpenAPI30Tag>? _tags;
  ListBuilder<SwaggerPetstoreOpenAPI30Tag> get tags => _$this._tags ??= ListBuilder<SwaggerPetstoreOpenAPI30Tag>();
  set tags(covariant ListBuilder<SwaggerPetstoreOpenAPI30Tag>? tags) => _$this._tags = tags;

  SwaggerPetstoreOpenAPI30Pet_Status? _status;
  SwaggerPetstoreOpenAPI30Pet_Status? get status => _$this._status;
  set status(covariant SwaggerPetstoreOpenAPI30Pet_Status? status) => _$this._status = status;

  SwaggerPetstoreOpenAPI30PetBuilder();

  SwaggerPetstoreOpenAPI30PetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _category = $v.category?.toBuilder();
      _photoUrls = $v.photoUrls.toBuilder();
      _tags = $v.tags?.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30Pet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30Pet;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30PetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30Pet build() => _build();

  _$SwaggerPetstoreOpenAPI30Pet _build() {
    _$SwaggerPetstoreOpenAPI30Pet _$result;
    try {
      _$result = _$v ??
          _$SwaggerPetstoreOpenAPI30Pet._(
              id: id,
              name: BuiltValueNullFieldError.checkNotNull(name, r'SwaggerPetstoreOpenAPI30Pet', 'name'),
              category: _category?.build(),
              photoUrls: photoUrls.build(),
              tags: _tags?.build(),
              status: status);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
        _$failedField = 'photoUrls';
        photoUrls.build();
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SwaggerPetstoreOpenAPI30Pet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30ApiResponseInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30ApiResponseInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30ApiResponseInterfaceBuilder) updates);
  int? get code;
  set code(int? code);

  String? get type;
  set type(String? type);

  String? get message;
  set message(String? message);
}

class _$SwaggerPetstoreOpenAPI30ApiResponse extends SwaggerPetstoreOpenAPI30ApiResponse {
  @override
  final int? code;
  @override
  final String? type;
  @override
  final String? message;

  factory _$SwaggerPetstoreOpenAPI30ApiResponse([void Function(SwaggerPetstoreOpenAPI30ApiResponseBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30ApiResponseBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30ApiResponse._({this.code, this.type, this.message}) : super._();

  @override
  SwaggerPetstoreOpenAPI30ApiResponse rebuild(void Function(SwaggerPetstoreOpenAPI30ApiResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30ApiResponseBuilder toBuilder() => SwaggerPetstoreOpenAPI30ApiResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30ApiResponse &&
        code == other.code &&
        type == other.type &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30ApiResponse')
          ..add('code', code)
          ..add('type', type)
          ..add('message', message))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30ApiResponseBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30ApiResponse, SwaggerPetstoreOpenAPI30ApiResponseBuilder>,
        SwaggerPetstoreOpenAPI30ApiResponseInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30ApiResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(covariant int? code) => _$this._code = code;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  SwaggerPetstoreOpenAPI30ApiResponseBuilder();

  SwaggerPetstoreOpenAPI30ApiResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _type = $v.type;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30ApiResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30ApiResponse;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30ApiResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30ApiResponse build() => _build();

  _$SwaggerPetstoreOpenAPI30ApiResponse _build() {
    final _$result = _$v ?? _$SwaggerPetstoreOpenAPI30ApiResponse._(code: code, type: type, message: message);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30OrderInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30OrderInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30OrderInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  int? get petId;
  set petId(int? petId);

  int? get quantity;
  set quantity(int? quantity);

  String? get shipDate;
  set shipDate(String? shipDate);

  SwaggerPetstoreOpenAPI30Order_Status? get status;
  set status(SwaggerPetstoreOpenAPI30Order_Status? status);

  bool? get complete;
  set complete(bool? complete);
}

class _$SwaggerPetstoreOpenAPI30Order extends SwaggerPetstoreOpenAPI30Order {
  @override
  final int? id;
  @override
  final int? petId;
  @override
  final int? quantity;
  @override
  final String? shipDate;
  @override
  final SwaggerPetstoreOpenAPI30Order_Status? status;
  @override
  final bool? complete;

  factory _$SwaggerPetstoreOpenAPI30Order([void Function(SwaggerPetstoreOpenAPI30OrderBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30OrderBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30Order._({this.id, this.petId, this.quantity, this.shipDate, this.status, this.complete})
      : super._();

  @override
  SwaggerPetstoreOpenAPI30Order rebuild(void Function(SwaggerPetstoreOpenAPI30OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30OrderBuilder toBuilder() => SwaggerPetstoreOpenAPI30OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30Order &&
        id == other.id &&
        petId == other.petId &&
        quantity == other.quantity &&
        shipDate == other.shipDate &&
        status == other.status &&
        complete == other.complete;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, petId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, shipDate.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, complete.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30Order')
          ..add('id', id)
          ..add('petId', petId)
          ..add('quantity', quantity)
          ..add('shipDate', shipDate)
          ..add('status', status)
          ..add('complete', complete))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30OrderBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30Order, SwaggerPetstoreOpenAPI30OrderBuilder>,
        SwaggerPetstoreOpenAPI30OrderInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30Order? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  int? _petId;
  int? get petId => _$this._petId;
  set petId(covariant int? petId) => _$this._petId = petId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(covariant int? quantity) => _$this._quantity = quantity;

  String? _shipDate;
  String? get shipDate => _$this._shipDate;
  set shipDate(covariant String? shipDate) => _$this._shipDate = shipDate;

  SwaggerPetstoreOpenAPI30Order_Status? _status;
  SwaggerPetstoreOpenAPI30Order_Status? get status => _$this._status;
  set status(covariant SwaggerPetstoreOpenAPI30Order_Status? status) => _$this._status = status;

  bool? _complete;
  bool? get complete => _$this._complete;
  set complete(covariant bool? complete) => _$this._complete = complete;

  SwaggerPetstoreOpenAPI30OrderBuilder();

  SwaggerPetstoreOpenAPI30OrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _petId = $v.petId;
      _quantity = $v.quantity;
      _shipDate = $v.shipDate;
      _status = $v.status;
      _complete = $v.complete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30Order other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30Order;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30OrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30Order build() => _build();

  _$SwaggerPetstoreOpenAPI30Order _build() {
    final _$result = _$v ??
        _$SwaggerPetstoreOpenAPI30Order._(
            id: id, petId: petId, quantity: quantity, shipDate: shipDate, status: status, complete: complete);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30UserInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30UserInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30UserInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get username;
  set username(String? username);

  String? get firstName;
  set firstName(String? firstName);

  String? get lastName;
  set lastName(String? lastName);

  String? get email;
  set email(String? email);

  String? get password;
  set password(String? password);

  String? get phone;
  set phone(String? phone);

  int? get userStatus;
  set userStatus(int? userStatus);
}

class _$SwaggerPetstoreOpenAPI30User extends SwaggerPetstoreOpenAPI30User {
  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phone;
  @override
  final int? userStatus;

  factory _$SwaggerPetstoreOpenAPI30User([void Function(SwaggerPetstoreOpenAPI30UserBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30UserBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30User._(
      {this.id, this.username, this.firstName, this.lastName, this.email, this.password, this.phone, this.userStatus})
      : super._();

  @override
  SwaggerPetstoreOpenAPI30User rebuild(void Function(SwaggerPetstoreOpenAPI30UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30UserBuilder toBuilder() => SwaggerPetstoreOpenAPI30UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30User &&
        id == other.id &&
        username == other.username &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        userStatus == other.userStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, userStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30User')
          ..add('id', id)
          ..add('username', username)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('password', password)
          ..add('phone', phone)
          ..add('userStatus', userStatus))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30UserBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30User, SwaggerPetstoreOpenAPI30UserBuilder>,
        SwaggerPetstoreOpenAPI30UserInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30User? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(covariant String? username) => _$this._username = username;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(covariant String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(covariant String? lastName) => _$this._lastName = lastName;

  String? _email;
  String? get email => _$this._email;
  set email(covariant String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(covariant String? password) => _$this._password = password;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(covariant String? phone) => _$this._phone = phone;

  int? _userStatus;
  int? get userStatus => _$this._userStatus;
  set userStatus(covariant int? userStatus) => _$this._userStatus = userStatus;

  SwaggerPetstoreOpenAPI30UserBuilder();

  SwaggerPetstoreOpenAPI30UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _password = $v.password;
      _phone = $v.phone;
      _userStatus = $v.userStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30User;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30User build() => _build();

  _$SwaggerPetstoreOpenAPI30User _build() {
    final _$result = _$v ??
        _$SwaggerPetstoreOpenAPI30User._(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            phone: phone,
            userStatus: userStatus);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterfaceBuilder) updates);
  int? get xRateLimit;
  set xRateLimit(int? xRateLimit);

  String? get xExpiresAfter;
  set xExpiresAfter(String? xExpiresAfter);
}

class _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders extends SwaggerPetstoreOpenAPI30UserLoginUserHeaders {
  @override
  final int? xRateLimit;
  @override
  final String? xExpiresAfter;

  factory _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders(
          [void Function(SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders._({this.xRateLimit, this.xExpiresAfter}) : super._();

  @override
  SwaggerPetstoreOpenAPI30UserLoginUserHeaders rebuild(
          void Function(SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder toBuilder() =>
      SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30UserLoginUserHeaders &&
        xRateLimit == other.xRateLimit &&
        xExpiresAfter == other.xExpiresAfter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, xRateLimit.hashCode);
    _$hash = $jc(_$hash, xExpiresAfter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30UserLoginUserHeaders')
          ..add('xRateLimit', xRateLimit)
          ..add('xExpiresAfter', xExpiresAfter))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30UserLoginUserHeaders, SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder>,
        SwaggerPetstoreOpenAPI30UserLoginUserHeadersInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders? _$v;

  int? _xRateLimit;
  int? get xRateLimit => _$this._xRateLimit;
  set xRateLimit(covariant int? xRateLimit) => _$this._xRateLimit = xRateLimit;

  String? _xExpiresAfter;
  String? get xExpiresAfter => _$this._xExpiresAfter;
  set xExpiresAfter(covariant String? xExpiresAfter) => _$this._xExpiresAfter = xExpiresAfter;

  SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder();

  SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _xRateLimit = $v.xRateLimit;
      _xExpiresAfter = $v.xExpiresAfter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30UserLoginUserHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30UserLoginUserHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30UserLoginUserHeaders build() => _build();

  _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders _build() {
    final _$result =
        _$v ?? _$SwaggerPetstoreOpenAPI30UserLoginUserHeaders._(xRateLimit: xRateLimit, xExpiresAfter: xExpiresAfter);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30AddressInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30AddressInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30AddressInterfaceBuilder) updates);
  String? get street;
  set street(String? street);

  String? get city;
  set city(String? city);

  String? get state;
  set state(String? state);

  String? get zip;
  set zip(String? zip);
}

class _$SwaggerPetstoreOpenAPI30Address extends SwaggerPetstoreOpenAPI30Address {
  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? zip;

  factory _$SwaggerPetstoreOpenAPI30Address([void Function(SwaggerPetstoreOpenAPI30AddressBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30AddressBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30Address._({this.street, this.city, this.state, this.zip}) : super._();

  @override
  SwaggerPetstoreOpenAPI30Address rebuild(void Function(SwaggerPetstoreOpenAPI30AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30AddressBuilder toBuilder() => SwaggerPetstoreOpenAPI30AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30Address &&
        street == other.street &&
        city == other.city &&
        state == other.state &&
        zip == other.zip;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, street.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, zip.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30Address')
          ..add('street', street)
          ..add('city', city)
          ..add('state', state)
          ..add('zip', zip))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30AddressBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30Address, SwaggerPetstoreOpenAPI30AddressBuilder>,
        SwaggerPetstoreOpenAPI30AddressInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30Address? _$v;

  String? _street;
  String? get street => _$this._street;
  set street(covariant String? street) => _$this._street = street;

  String? _city;
  String? get city => _$this._city;
  set city(covariant String? city) => _$this._city = city;

  String? _state;
  String? get state => _$this._state;
  set state(covariant String? state) => _$this._state = state;

  String? _zip;
  String? get zip => _$this._zip;
  set zip(covariant String? zip) => _$this._zip = zip;

  SwaggerPetstoreOpenAPI30AddressBuilder();

  SwaggerPetstoreOpenAPI30AddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _street = $v.street;
      _city = $v.city;
      _state = $v.state;
      _zip = $v.zip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30Address other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30Address;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30AddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30Address build() => _build();

  _$SwaggerPetstoreOpenAPI30Address _build() {
    final _$result = _$v ?? _$SwaggerPetstoreOpenAPI30Address._(street: street, city: city, state: state, zip: zip);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SwaggerPetstoreOpenAPI30CustomerInterfaceBuilder {
  void replace(SwaggerPetstoreOpenAPI30CustomerInterface other);
  void update(void Function(SwaggerPetstoreOpenAPI30CustomerInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get username;
  set username(String? username);

  ListBuilder<SwaggerPetstoreOpenAPI30Address> get address;
  set address(ListBuilder<SwaggerPetstoreOpenAPI30Address>? address);
}

class _$SwaggerPetstoreOpenAPI30Customer extends SwaggerPetstoreOpenAPI30Customer {
  @override
  final int? id;
  @override
  final String? username;
  @override
  final BuiltList<SwaggerPetstoreOpenAPI30Address>? address;

  factory _$SwaggerPetstoreOpenAPI30Customer([void Function(SwaggerPetstoreOpenAPI30CustomerBuilder)? updates]) =>
      (SwaggerPetstoreOpenAPI30CustomerBuilder()..update(updates))._build();

  _$SwaggerPetstoreOpenAPI30Customer._({this.id, this.username, this.address}) : super._();

  @override
  SwaggerPetstoreOpenAPI30Customer rebuild(void Function(SwaggerPetstoreOpenAPI30CustomerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwaggerPetstoreOpenAPI30CustomerBuilder toBuilder() => SwaggerPetstoreOpenAPI30CustomerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwaggerPetstoreOpenAPI30Customer &&
        id == other.id &&
        username == other.username &&
        address == other.address;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SwaggerPetstoreOpenAPI30Customer')
          ..add('id', id)
          ..add('username', username)
          ..add('address', address))
        .toString();
  }
}

class SwaggerPetstoreOpenAPI30CustomerBuilder
    implements
        Builder<SwaggerPetstoreOpenAPI30Customer, SwaggerPetstoreOpenAPI30CustomerBuilder>,
        SwaggerPetstoreOpenAPI30CustomerInterfaceBuilder {
  _$SwaggerPetstoreOpenAPI30Customer? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(covariant String? username) => _$this._username = username;

  ListBuilder<SwaggerPetstoreOpenAPI30Address>? _address;
  ListBuilder<SwaggerPetstoreOpenAPI30Address> get address =>
      _$this._address ??= ListBuilder<SwaggerPetstoreOpenAPI30Address>();
  set address(covariant ListBuilder<SwaggerPetstoreOpenAPI30Address>? address) => _$this._address = address;

  SwaggerPetstoreOpenAPI30CustomerBuilder();

  SwaggerPetstoreOpenAPI30CustomerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _address = $v.address?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SwaggerPetstoreOpenAPI30Customer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SwaggerPetstoreOpenAPI30Customer;
  }

  @override
  void update(void Function(SwaggerPetstoreOpenAPI30CustomerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwaggerPetstoreOpenAPI30Customer build() => _build();

  _$SwaggerPetstoreOpenAPI30Customer _build() {
    _$SwaggerPetstoreOpenAPI30Customer _$result;
    try {
      _$result = _$v ?? _$SwaggerPetstoreOpenAPI30Customer._(id: id, username: username, address: _address?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        _address?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SwaggerPetstoreOpenAPI30Customer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
