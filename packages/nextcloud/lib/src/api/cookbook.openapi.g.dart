// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookbook.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GetImageSize _$getImageSizeFull = GetImageSize._('full');
const GetImageSize _$getImageSizeThumb = GetImageSize._('thumb');
const GetImageSize _$getImageSizeThumb16 = GetImageSize._('thumb16');

GetImageSize _$valueOfGetImageSize(String name) {
  switch (name) {
    case 'full':
      return _$getImageSizeFull;
    case 'thumb':
      return _$getImageSizeThumb;
    case 'thumb16':
      return _$getImageSizeThumb16;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<GetImageSize> _$getImageSizeValues = BuiltSet<GetImageSize>(const <GetImageSize>[
  _$getImageSizeFull,
  _$getImageSizeThumb,
  _$getImageSizeThumb16,
]);

Serializer<CategoryInformation> _$categoryInformationSerializer = _$CategoryInformationSerializer();
Serializer<Category> _$categorySerializer = _$CategorySerializer();
Serializer<RecipeStubInformation> _$recipeStubInformationSerializer = _$RecipeStubInformationSerializer();
Serializer<RecipeStub> _$recipeStubSerializer = _$RecipeStubSerializer();
Serializer<RenameCategoryRequestApplicationJson> _$renameCategoryRequestApplicationJsonSerializer =
    _$RenameCategoryRequestApplicationJsonSerializer();
Serializer<APIVersion> _$aPIVersionSerializer = _$APIVersionSerializer();
Serializer<Version> _$versionSerializer = _$VersionSerializer();
Serializer<VisibleInfoBlocks> _$visibleInfoBlocksSerializer = _$VisibleInfoBlocksSerializer();
Serializer<Config> _$configSerializer = _$ConfigSerializer();
Serializer<Url> _$urlSerializer = _$UrlSerializer();
Serializer<Nutrition> _$nutritionSerializer = _$NutritionSerializer();
Serializer<Recipe> _$recipeSerializer = _$RecipeSerializer();
Serializer<Keyword> _$keywordSerializer = _$KeywordSerializer();
Serializer<Error> _$errorSerializer = _$ErrorSerializer();

class _$CategoryInformationSerializer implements StructuredSerializer<CategoryInformation> {
  @override
  final Iterable<Type> types = const [CategoryInformation, _$CategoryInformation];
  @override
  final String wireName = 'CategoryInformation';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoryInformation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'recipe_count',
      serializers.serialize(object.recipeCount, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  CategoryInformation deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CategoryInformationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'recipe_count':
          result.recipeCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CategorySerializer implements StructuredSerializer<Category> {
  @override
  final Iterable<Type> types = const [Category, _$Category];
  @override
  final String wireName = 'Category';

  @override
  Iterable<Object?> serialize(Serializers serializers, Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'recipe_count',
      serializers.serialize(object.recipeCount, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Category deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'recipe_count':
          result.recipeCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$RecipeStubInformationSerializer implements StructuredSerializer<RecipeStubInformation> {
  @override
  final Iterable<Type> types = const [RecipeStubInformation, _$RecipeStubInformation];
  @override
  final String wireName = 'RecipeStubInformation';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipeStubInformation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'keywords',
      serializers.serialize(object.keywords, specifiedType: const FullType(String)),
      'dateCreated',
      serializers.serialize(object.dateCreated, specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl, specifiedType: const FullType(String)),
      'imagePlaceholderUrl',
      serializers.serialize(object.imagePlaceholderUrl, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.dateModified;
    if (value != null) {
      result
        ..add('dateModified')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RecipeStubInformation deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecipeStubInformationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'keywords':
          result.keywords = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'dateModified':
          result.dateModified = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'imagePlaceholderUrl':
          result.imagePlaceholderUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RecipeStubSerializer implements StructuredSerializer<RecipeStub> {
  @override
  final Iterable<Type> types = const [RecipeStub, _$RecipeStub];
  @override
  final String wireName = 'RecipeStub';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipeStub object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'recipe_id',
      serializers.serialize(object.recipeId, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'keywords',
      serializers.serialize(object.keywords, specifiedType: const FullType(String)),
      'dateCreated',
      serializers.serialize(object.dateCreated, specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl, specifiedType: const FullType(String)),
      'imagePlaceholderUrl',
      serializers.serialize(object.imagePlaceholderUrl, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.dateModified;
    if (value != null) {
      result
        ..add('dateModified')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RecipeStub deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecipeStubBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'recipe_id':
          result.recipeId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'keywords':
          result.keywords = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'dateModified':
          result.dateModified = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'imagePlaceholderUrl':
          result.imagePlaceholderUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RenameCategoryRequestApplicationJsonSerializer
    implements StructuredSerializer<RenameCategoryRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [RenameCategoryRequestApplicationJson, _$RenameCategoryRequestApplicationJson];
  @override
  final String wireName = 'RenameCategoryRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, RenameCategoryRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RenameCategoryRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RenameCategoryRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$APIVersionSerializer implements StructuredSerializer<APIVersion> {
  @override
  final Iterable<Type> types = const [APIVersion, _$APIVersion];
  @override
  final String wireName = 'APIVersion';

  @override
  Iterable<Object?> serialize(Serializers serializers, APIVersion object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'epoch',
      serializers.serialize(object.epoch, specifiedType: const FullType(int)),
      'major',
      serializers.serialize(object.major, specifiedType: const FullType(int)),
      'minor',
      serializers.serialize(object.minor, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  APIVersion deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIVersionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'epoch':
          result.epoch = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'major':
          result.major = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'minor':
          result.minor = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$VersionSerializer implements StructuredSerializer<Version> {
  @override
  final Iterable<Type> types = const [Version, _$Version];
  @override
  final String wireName = 'Version';

  @override
  Iterable<Object?> serialize(Serializers serializers, Version object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cookbookVersion;
    if (value != null) {
      result
        ..add('cookbook_version')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('api_version')
        ..add(serializers.serialize(value, specifiedType: const FullType(APIVersion)));
    }
    return result;
  }

  @override
  Version deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VersionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cookbook_version':
          result.cookbookVersion.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'api_version':
          result.apiVersion
              .replace(serializers.deserialize(value, specifiedType: const FullType(APIVersion))! as APIVersion);
          break;
      }
    }

    return result.build();
  }
}

class _$VisibleInfoBlocksSerializer implements StructuredSerializer<VisibleInfoBlocks> {
  @override
  final Iterable<Type> types = const [VisibleInfoBlocks, _$VisibleInfoBlocks];
  @override
  final String wireName = 'VisibleInfoBlocks';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisibleInfoBlocks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.preparationTime;
    if (value != null) {
      result
        ..add('preparation-time')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cookingTime;
    if (value != null) {
      result
        ..add('cooking-time')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.totalTime;
    if (value != null) {
      result
        ..add('total-time')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.nutritionInformation;
    if (value != null) {
      result
        ..add('nutrition-information')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tools;
    if (value != null) {
      result
        ..add('tools')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  VisibleInfoBlocks deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VisibleInfoBlocksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'preparation-time':
          result.preparationTime = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cooking-time':
          result.cookingTime = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'total-time':
          result.totalTime = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'nutrition-information':
          result.nutritionInformation = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tools':
          result.tools = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigSerializer implements StructuredSerializer<Config> {
  @override
  final Iterable<Type> types = const [Config, _$Config];
  @override
  final String wireName = 'Config';

  @override
  Iterable<Object?> serialize(Serializers serializers, Config object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.folder;
    if (value != null) {
      result
        ..add('folder')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.updateInterval;
    if (value != null) {
      result
        ..add('update_interval')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.printImage;
    if (value != null) {
      result
        ..add('print_image')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.visibleInfoBlocks;
    if (value != null) {
      result
        ..add('visibleInfoBlocks')
        ..add(serializers.serialize(value, specifiedType: const FullType(VisibleInfoBlocks)));
    }
    return result;
  }

  @override
  Config deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folder':
          result.folder = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'update_interval':
          result.updateInterval = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'print_image':
          result.printImage = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'visibleInfoBlocks':
          result.visibleInfoBlocks.replace(
              serializers.deserialize(value, specifiedType: const FullType(VisibleInfoBlocks))! as VisibleInfoBlocks);
          break;
      }
    }

    return result.build();
  }
}

class _$UrlSerializer implements StructuredSerializer<Url> {
  @override
  final Iterable<Type> types = const [Url, _$Url];
  @override
  final String wireName = 'Url';

  @override
  Iterable<Object?> serialize(Serializers serializers, Url object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Url deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UrlBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NutritionSerializer implements StructuredSerializer<Nutrition> {
  @override
  final Iterable<Type> types = const [Nutrition, _$Nutrition];
  @override
  final String wireName = 'Nutrition';

  @override
  Iterable<Object?> serialize(Serializers serializers, Nutrition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '@type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.calories;
    if (value != null) {
      result
        ..add('calories')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.carbohydrateContent;
    if (value != null) {
      result
        ..add('carbohydrateContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.cholesterolContent;
    if (value != null) {
      result
        ..add('cholesterolContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.fatContent;
    if (value != null) {
      result
        ..add('fatContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.fiberContent;
    if (value != null) {
      result
        ..add('fiberContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.proteinContent;
    if (value != null) {
      result
        ..add('proteinContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.saturatedFatContent;
    if (value != null) {
      result
        ..add('saturatedFatContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.servingSize;
    if (value != null) {
      result
        ..add('servingSize')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.sodiumContent;
    if (value != null) {
      result
        ..add('sodiumContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.sugarContent;
    if (value != null) {
      result
        ..add('sugarContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.transFatContent;
    if (value != null) {
      result
        ..add('transFatContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.unsaturatedFatContent;
    if (value != null) {
      result
        ..add('unsaturatedFatContent')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Nutrition deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NutritionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '@type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'calories':
          result.calories = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'carbohydrateContent':
          result.carbohydrateContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'cholesterolContent':
          result.cholesterolContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'fatContent':
          result.fatContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'fiberContent':
          result.fiberContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'proteinContent':
          result.proteinContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'saturatedFatContent':
          result.saturatedFatContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'servingSize':
          result.servingSize = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'sodiumContent':
          result.sodiumContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'sugarContent':
          result.sugarContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'transFatContent':
          result.transFatContent = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'unsaturatedFatContent':
          result.unsaturatedFatContent =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$RecipeSerializer implements StructuredSerializer<Recipe> {
  @override
  final Iterable<Type> types = const [Recipe, _$Recipe];
  @override
  final String wireName = 'Recipe';

  @override
  Iterable<Object?> serialize(Serializers serializers, Recipe object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '@type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image, specifiedType: const FullType(String)),
      'recipeYield',
      serializers.serialize(object.recipeYield, specifiedType: const FullType(int)),
      'recipeCategory',
      serializers.serialize(object.recipeCategory, specifiedType: const FullType(String)),
      'tool',
      serializers.serialize(object.tool, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'recipeIngredient',
      serializers.serialize(object.recipeIngredient, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'recipeInstructions',
      serializers.serialize(object.recipeInstructions, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'nutrition',
      serializers.serialize(object.nutrition, specifiedType: const FullType(Nutrition)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'keywords',
      serializers.serialize(object.keywords, specifiedType: const FullType(String)),
      'dateCreated',
      serializers.serialize(object.dateCreated, specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl, specifiedType: const FullType(String)),
      'imagePlaceholderUrl',
      serializers.serialize(object.imagePlaceholderUrl, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.prepTime;
    if (value != null) {
      result
        ..add('prepTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.cookTime;
    if (value != null) {
      result
        ..add('cookTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.totalTime;
    if (value != null) {
      result
        ..add('totalTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.dateModified;
    if (value != null) {
      result
        ..add('dateModified')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Recipe deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecipeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '@type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'prepTime':
          result.prepTime = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'cookTime':
          result.cookTime = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'totalTime':
          result.totalTime = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'recipeYield':
          result.recipeYield = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'recipeCategory':
          result.recipeCategory = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'tool':
          result.tool.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'recipeIngredient':
          result.recipeIngredient.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'recipeInstructions':
          result.recipeInstructions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'nutrition':
          result.nutrition
              .replace(serializers.deserialize(value, specifiedType: const FullType(Nutrition))! as Nutrition);
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'keywords':
          result.keywords = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'dateModified':
          result.dateModified = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'imagePlaceholderUrl':
          result.imagePlaceholderUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$KeywordSerializer implements StructuredSerializer<Keyword> {
  @override
  final Iterable<Type> types = const [Keyword, _$Keyword];
  @override
  final String wireName = 'Keyword';

  @override
  Iterable<Object?> serialize(Serializers serializers, Keyword object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'recipe_count',
      serializers.serialize(object.recipeCount, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Keyword deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = KeywordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'recipe_count':
          result.recipeCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorSerializer implements StructuredSerializer<Error> {
  @override
  final Iterable<Type> types = const [Error, _$Error];
  @override
  final String wireName = 'Error';

  @override
  Iterable<Object?> serialize(Serializers serializers, Error object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.msg;
    if (value != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.file;
    if (value != null) {
      result
        ..add('file')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.line;
    if (value != null) {
      result
        ..add('line')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Error deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'msg':
          result.msg = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'file':
          result.file = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'line':
          result.line = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $CategoryInformationInterfaceBuilder {
  void replace($CategoryInformationInterface other);
  void update(void Function($CategoryInformationInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  int? get recipeCount;
  set recipeCount(int? recipeCount);
}

class _$CategoryInformation extends CategoryInformation {
  @override
  final String name;
  @override
  final int recipeCount;

  factory _$CategoryInformation([void Function(CategoryInformationBuilder)? updates]) =>
      (CategoryInformationBuilder()..update(updates))._build();

  _$CategoryInformation._({required this.name, required this.recipeCount}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CategoryInformation', 'name');
    BuiltValueNullFieldError.checkNotNull(recipeCount, r'CategoryInformation', 'recipeCount');
  }

  @override
  CategoryInformation rebuild(void Function(CategoryInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryInformationBuilder toBuilder() => CategoryInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryInformation && name == other.name && recipeCount == other.recipeCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, recipeCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryInformation')
          ..add('name', name)
          ..add('recipeCount', recipeCount))
        .toString();
  }
}

class CategoryInformationBuilder
    implements Builder<CategoryInformation, CategoryInformationBuilder>, $CategoryInformationInterfaceBuilder {
  _$CategoryInformation? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  int? _recipeCount;
  int? get recipeCount => _$this._recipeCount;
  set recipeCount(covariant int? recipeCount) => _$this._recipeCount = recipeCount;

  CategoryInformationBuilder() {
    CategoryInformation._defaults(this);
  }

  CategoryInformationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _recipeCount = $v.recipeCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CategoryInformation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryInformation;
  }

  @override
  void update(void Function(CategoryInformationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryInformation build() => _build();

  _$CategoryInformation _build() {
    CategoryInformation._validate(this);
    final _$result = _$v ??
        _$CategoryInformation._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'CategoryInformation', 'name'),
            recipeCount: BuiltValueNullFieldError.checkNotNull(recipeCount, r'CategoryInformation', 'recipeCount'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $CategoryInterfaceBuilder implements $CategoryInformationInterfaceBuilder {
  void replace(covariant $CategoryInterface other);
  void update(void Function($CategoryInterfaceBuilder) updates);
  String? get name;
  set name(covariant String? name);

  int? get recipeCount;
  set recipeCount(covariant int? recipeCount);
}

class _$Category extends Category {
  @override
  final String name;
  @override
  final int recipeCount;

  factory _$Category([void Function(CategoryBuilder)? updates]) => (CategoryBuilder()..update(updates))._build();

  _$Category._({required this.name, required this.recipeCount}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Category', 'name');
    BuiltValueNullFieldError.checkNotNull(recipeCount, r'Category', 'recipeCount');
  }

  @override
  Category rebuild(void Function(CategoryBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category && name == other.name && recipeCount == other.recipeCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, recipeCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Category')
          ..add('name', name)
          ..add('recipeCount', recipeCount))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder>, $CategoryInterfaceBuilder {
  _$Category? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  int? _recipeCount;
  int? get recipeCount => _$this._recipeCount;
  set recipeCount(covariant int? recipeCount) => _$this._recipeCount = recipeCount;

  CategoryBuilder() {
    Category._defaults(this);
  }

  CategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _recipeCount = $v.recipeCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Category;
  }

  @override
  void update(void Function(CategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Category build() => _build();

  _$Category _build() {
    Category._validate(this);
    final _$result = _$v ??
        _$Category._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'Category', 'name'),
            recipeCount: BuiltValueNullFieldError.checkNotNull(recipeCount, r'Category', 'recipeCount'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $RecipeStubInformationInterfaceBuilder {
  void replace($RecipeStubInformationInterface other);
  void update(void Function($RecipeStubInformationInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get keywords;
  set keywords(String? keywords);

  String? get dateCreated;
  set dateCreated(String? dateCreated);

  String? get dateModified;
  set dateModified(String? dateModified);

  String? get imageUrl;
  set imageUrl(String? imageUrl);

  String? get imagePlaceholderUrl;
  set imagePlaceholderUrl(String? imagePlaceholderUrl);
}

class _$RecipeStubInformation extends RecipeStubInformation {
  @override
  final String name;
  @override
  final String keywords;
  @override
  final String dateCreated;
  @override
  final String? dateModified;
  @override
  final String imageUrl;
  @override
  final String imagePlaceholderUrl;

  factory _$RecipeStubInformation([void Function(RecipeStubInformationBuilder)? updates]) =>
      (RecipeStubInformationBuilder()..update(updates))._build();

  _$RecipeStubInformation._(
      {required this.name,
      required this.keywords,
      required this.dateCreated,
      this.dateModified,
      required this.imageUrl,
      required this.imagePlaceholderUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'RecipeStubInformation', 'name');
    BuiltValueNullFieldError.checkNotNull(keywords, r'RecipeStubInformation', 'keywords');
    BuiltValueNullFieldError.checkNotNull(dateCreated, r'RecipeStubInformation', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(imageUrl, r'RecipeStubInformation', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(imagePlaceholderUrl, r'RecipeStubInformation', 'imagePlaceholderUrl');
  }

  @override
  RecipeStubInformation rebuild(void Function(RecipeStubInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeStubInformationBuilder toBuilder() => RecipeStubInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeStubInformation &&
        name == other.name &&
        keywords == other.keywords &&
        dateCreated == other.dateCreated &&
        dateModified == other.dateModified &&
        imageUrl == other.imageUrl &&
        imagePlaceholderUrl == other.imagePlaceholderUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, dateModified.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, imagePlaceholderUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeStubInformation')
          ..add('name', name)
          ..add('keywords', keywords)
          ..add('dateCreated', dateCreated)
          ..add('dateModified', dateModified)
          ..add('imageUrl', imageUrl)
          ..add('imagePlaceholderUrl', imagePlaceholderUrl))
        .toString();
  }
}

class RecipeStubInformationBuilder
    implements Builder<RecipeStubInformation, RecipeStubInformationBuilder>, $RecipeStubInformationInterfaceBuilder {
  _$RecipeStubInformation? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _keywords;
  String? get keywords => _$this._keywords;
  set keywords(covariant String? keywords) => _$this._keywords = keywords;

  String? _dateCreated;
  String? get dateCreated => _$this._dateCreated;
  set dateCreated(covariant String? dateCreated) => _$this._dateCreated = dateCreated;

  String? _dateModified;
  String? get dateModified => _$this._dateModified;
  set dateModified(covariant String? dateModified) => _$this._dateModified = dateModified;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(covariant String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _imagePlaceholderUrl;
  String? get imagePlaceholderUrl => _$this._imagePlaceholderUrl;
  set imagePlaceholderUrl(covariant String? imagePlaceholderUrl) => _$this._imagePlaceholderUrl = imagePlaceholderUrl;

  RecipeStubInformationBuilder() {
    RecipeStubInformation._defaults(this);
  }

  RecipeStubInformationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _keywords = $v.keywords;
      _dateCreated = $v.dateCreated;
      _dateModified = $v.dateModified;
      _imageUrl = $v.imageUrl;
      _imagePlaceholderUrl = $v.imagePlaceholderUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant RecipeStubInformation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeStubInformation;
  }

  @override
  void update(void Function(RecipeStubInformationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeStubInformation build() => _build();

  _$RecipeStubInformation _build() {
    RecipeStubInformation._validate(this);
    final _$result = _$v ??
        _$RecipeStubInformation._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'RecipeStubInformation', 'name'),
            keywords: BuiltValueNullFieldError.checkNotNull(keywords, r'RecipeStubInformation', 'keywords'),
            dateCreated: BuiltValueNullFieldError.checkNotNull(dateCreated, r'RecipeStubInformation', 'dateCreated'),
            dateModified: dateModified,
            imageUrl: BuiltValueNullFieldError.checkNotNull(imageUrl, r'RecipeStubInformation', 'imageUrl'),
            imagePlaceholderUrl: BuiltValueNullFieldError.checkNotNull(
                imagePlaceholderUrl, r'RecipeStubInformation', 'imagePlaceholderUrl'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $RecipeStubInterfaceBuilder implements $RecipeStubInformationInterfaceBuilder {
  void replace(covariant $RecipeStubInterface other);
  void update(void Function($RecipeStubInterfaceBuilder) updates);
  int? get recipeId;
  set recipeId(covariant int? recipeId);

  String? get id;
  set id(covariant String? id);

  String? get name;
  set name(covariant String? name);

  String? get keywords;
  set keywords(covariant String? keywords);

  String? get dateCreated;
  set dateCreated(covariant String? dateCreated);

  String? get dateModified;
  set dateModified(covariant String? dateModified);

  String? get imageUrl;
  set imageUrl(covariant String? imageUrl);

  String? get imagePlaceholderUrl;
  set imagePlaceholderUrl(covariant String? imagePlaceholderUrl);
}

class _$RecipeStub extends RecipeStub {
  @override
  final int recipeId;
  @override
  final String id;
  @override
  final String name;
  @override
  final String keywords;
  @override
  final String dateCreated;
  @override
  final String? dateModified;
  @override
  final String imageUrl;
  @override
  final String imagePlaceholderUrl;

  factory _$RecipeStub([void Function(RecipeStubBuilder)? updates]) => (RecipeStubBuilder()..update(updates))._build();

  _$RecipeStub._(
      {required this.recipeId,
      required this.id,
      required this.name,
      required this.keywords,
      required this.dateCreated,
      this.dateModified,
      required this.imageUrl,
      required this.imagePlaceholderUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(recipeId, r'RecipeStub', 'recipeId');
    BuiltValueNullFieldError.checkNotNull(id, r'RecipeStub', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'RecipeStub', 'name');
    BuiltValueNullFieldError.checkNotNull(keywords, r'RecipeStub', 'keywords');
    BuiltValueNullFieldError.checkNotNull(dateCreated, r'RecipeStub', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(imageUrl, r'RecipeStub', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(imagePlaceholderUrl, r'RecipeStub', 'imagePlaceholderUrl');
  }

  @override
  RecipeStub rebuild(void Function(RecipeStubBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  RecipeStubBuilder toBuilder() => RecipeStubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeStub &&
        recipeId == other.recipeId &&
        id == other.id &&
        name == other.name &&
        keywords == other.keywords &&
        dateCreated == other.dateCreated &&
        dateModified == other.dateModified &&
        imageUrl == other.imageUrl &&
        imagePlaceholderUrl == other.imagePlaceholderUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, dateModified.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, imagePlaceholderUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeStub')
          ..add('recipeId', recipeId)
          ..add('id', id)
          ..add('name', name)
          ..add('keywords', keywords)
          ..add('dateCreated', dateCreated)
          ..add('dateModified', dateModified)
          ..add('imageUrl', imageUrl)
          ..add('imagePlaceholderUrl', imagePlaceholderUrl))
        .toString();
  }
}

class RecipeStubBuilder implements Builder<RecipeStub, RecipeStubBuilder>, $RecipeStubInterfaceBuilder {
  _$RecipeStub? _$v;

  int? _recipeId;
  int? get recipeId => _$this._recipeId;
  set recipeId(covariant int? recipeId) => _$this._recipeId = recipeId;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _keywords;
  String? get keywords => _$this._keywords;
  set keywords(covariant String? keywords) => _$this._keywords = keywords;

  String? _dateCreated;
  String? get dateCreated => _$this._dateCreated;
  set dateCreated(covariant String? dateCreated) => _$this._dateCreated = dateCreated;

  String? _dateModified;
  String? get dateModified => _$this._dateModified;
  set dateModified(covariant String? dateModified) => _$this._dateModified = dateModified;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(covariant String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _imagePlaceholderUrl;
  String? get imagePlaceholderUrl => _$this._imagePlaceholderUrl;
  set imagePlaceholderUrl(covariant String? imagePlaceholderUrl) => _$this._imagePlaceholderUrl = imagePlaceholderUrl;

  RecipeStubBuilder() {
    RecipeStub._defaults(this);
  }

  RecipeStubBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeId = $v.recipeId;
      _id = $v.id;
      _name = $v.name;
      _keywords = $v.keywords;
      _dateCreated = $v.dateCreated;
      _dateModified = $v.dateModified;
      _imageUrl = $v.imageUrl;
      _imagePlaceholderUrl = $v.imagePlaceholderUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant RecipeStub other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeStub;
  }

  @override
  void update(void Function(RecipeStubBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeStub build() => _build();

  _$RecipeStub _build() {
    RecipeStub._validate(this);
    final _$result = _$v ??
        _$RecipeStub._(
            recipeId: BuiltValueNullFieldError.checkNotNull(recipeId, r'RecipeStub', 'recipeId'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'RecipeStub', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'RecipeStub', 'name'),
            keywords: BuiltValueNullFieldError.checkNotNull(keywords, r'RecipeStub', 'keywords'),
            dateCreated: BuiltValueNullFieldError.checkNotNull(dateCreated, r'RecipeStub', 'dateCreated'),
            dateModified: dateModified,
            imageUrl: BuiltValueNullFieldError.checkNotNull(imageUrl, r'RecipeStub', 'imageUrl'),
            imagePlaceholderUrl:
                BuiltValueNullFieldError.checkNotNull(imagePlaceholderUrl, r'RecipeStub', 'imagePlaceholderUrl'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $RenameCategoryRequestApplicationJsonInterfaceBuilder {
  void replace($RenameCategoryRequestApplicationJsonInterface other);
  void update(void Function($RenameCategoryRequestApplicationJsonInterfaceBuilder) updates);
  String? get name;
  set name(String? name);
}

class _$RenameCategoryRequestApplicationJson extends RenameCategoryRequestApplicationJson {
  @override
  final String name;

  factory _$RenameCategoryRequestApplicationJson(
          [void Function(RenameCategoryRequestApplicationJsonBuilder)? updates]) =>
      (RenameCategoryRequestApplicationJsonBuilder()..update(updates))._build();

  _$RenameCategoryRequestApplicationJson._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'RenameCategoryRequestApplicationJson', 'name');
  }

  @override
  RenameCategoryRequestApplicationJson rebuild(void Function(RenameCategoryRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RenameCategoryRequestApplicationJsonBuilder toBuilder() =>
      RenameCategoryRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RenameCategoryRequestApplicationJson && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RenameCategoryRequestApplicationJson')..add('name', name)).toString();
  }
}

class RenameCategoryRequestApplicationJsonBuilder
    implements
        Builder<RenameCategoryRequestApplicationJson, RenameCategoryRequestApplicationJsonBuilder>,
        $RenameCategoryRequestApplicationJsonInterfaceBuilder {
  _$RenameCategoryRequestApplicationJson? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  RenameCategoryRequestApplicationJsonBuilder() {
    RenameCategoryRequestApplicationJson._defaults(this);
  }

  RenameCategoryRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant RenameCategoryRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RenameCategoryRequestApplicationJson;
  }

  @override
  void update(void Function(RenameCategoryRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RenameCategoryRequestApplicationJson build() => _build();

  _$RenameCategoryRequestApplicationJson _build() {
    RenameCategoryRequestApplicationJson._validate(this);
    final _$result = _$v ??
        _$RenameCategoryRequestApplicationJson._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'RenameCategoryRequestApplicationJson', 'name'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $APIVersionInterfaceBuilder {
  void replace($APIVersionInterface other);
  void update(void Function($APIVersionInterfaceBuilder) updates);
  int? get epoch;
  set epoch(int? epoch);

  int? get major;
  set major(int? major);

  int? get minor;
  set minor(int? minor);
}

class _$APIVersion extends APIVersion {
  @override
  final int epoch;
  @override
  final int major;
  @override
  final int minor;

  factory _$APIVersion([void Function(APIVersionBuilder)? updates]) => (APIVersionBuilder()..update(updates))._build();

  _$APIVersion._({required this.epoch, required this.major, required this.minor}) : super._() {
    BuiltValueNullFieldError.checkNotNull(epoch, r'APIVersion', 'epoch');
    BuiltValueNullFieldError.checkNotNull(major, r'APIVersion', 'major');
    BuiltValueNullFieldError.checkNotNull(minor, r'APIVersion', 'minor');
  }

  @override
  APIVersion rebuild(void Function(APIVersionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  APIVersionBuilder toBuilder() => APIVersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIVersion && epoch == other.epoch && major == other.major && minor == other.minor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, epoch.hashCode);
    _$hash = $jc(_$hash, major.hashCode);
    _$hash = $jc(_$hash, minor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'APIVersion')
          ..add('epoch', epoch)
          ..add('major', major)
          ..add('minor', minor))
        .toString();
  }
}

class APIVersionBuilder implements Builder<APIVersion, APIVersionBuilder>, $APIVersionInterfaceBuilder {
  _$APIVersion? _$v;

  int? _epoch;
  int? get epoch => _$this._epoch;
  set epoch(covariant int? epoch) => _$this._epoch = epoch;

  int? _major;
  int? get major => _$this._major;
  set major(covariant int? major) => _$this._major = major;

  int? _minor;
  int? get minor => _$this._minor;
  set minor(covariant int? minor) => _$this._minor = minor;

  APIVersionBuilder() {
    APIVersion._defaults(this);
  }

  APIVersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _epoch = $v.epoch;
      _major = $v.major;
      _minor = $v.minor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant APIVersion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIVersion;
  }

  @override
  void update(void Function(APIVersionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  APIVersion build() => _build();

  _$APIVersion _build() {
    APIVersion._validate(this);
    final _$result = _$v ??
        _$APIVersion._(
            epoch: BuiltValueNullFieldError.checkNotNull(epoch, r'APIVersion', 'epoch'),
            major: BuiltValueNullFieldError.checkNotNull(major, r'APIVersion', 'major'),
            minor: BuiltValueNullFieldError.checkNotNull(minor, r'APIVersion', 'minor'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $VersionInterfaceBuilder {
  void replace($VersionInterface other);
  void update(void Function($VersionInterfaceBuilder) updates);
  ListBuilder<JsonObject> get cookbookVersion;
  set cookbookVersion(ListBuilder<JsonObject>? cookbookVersion);

  APIVersionBuilder get apiVersion;
  set apiVersion(APIVersionBuilder? apiVersion);
}

class _$Version extends Version {
  @override
  final BuiltList<JsonObject>? cookbookVersion;
  @override
  final APIVersion? apiVersion;

  factory _$Version([void Function(VersionBuilder)? updates]) => (VersionBuilder()..update(updates))._build();

  _$Version._({this.cookbookVersion, this.apiVersion}) : super._();

  @override
  Version rebuild(void Function(VersionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  VersionBuilder toBuilder() => VersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Version && cookbookVersion == other.cookbookVersion && apiVersion == other.apiVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cookbookVersion.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Version')
          ..add('cookbookVersion', cookbookVersion)
          ..add('apiVersion', apiVersion))
        .toString();
  }
}

class VersionBuilder implements Builder<Version, VersionBuilder>, $VersionInterfaceBuilder {
  _$Version? _$v;

  ListBuilder<JsonObject>? _cookbookVersion;
  ListBuilder<JsonObject> get cookbookVersion => _$this._cookbookVersion ??= ListBuilder<JsonObject>();
  set cookbookVersion(covariant ListBuilder<JsonObject>? cookbookVersion) => _$this._cookbookVersion = cookbookVersion;

  APIVersionBuilder? _apiVersion;
  APIVersionBuilder get apiVersion => _$this._apiVersion ??= APIVersionBuilder();
  set apiVersion(covariant APIVersionBuilder? apiVersion) => _$this._apiVersion = apiVersion;

  VersionBuilder() {
    Version._defaults(this);
  }

  VersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cookbookVersion = $v.cookbookVersion?.toBuilder();
      _apiVersion = $v.apiVersion?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Version other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Version;
  }

  @override
  void update(void Function(VersionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Version build() => _build();

  _$Version _build() {
    Version._validate(this);
    _$Version _$result;
    try {
      _$result = _$v ?? _$Version._(cookbookVersion: _cookbookVersion?.build(), apiVersion: _apiVersion?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cookbookVersion';
        _cookbookVersion?.build();
        _$failedField = 'apiVersion';
        _apiVersion?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Version', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $VisibleInfoBlocksInterfaceBuilder {
  void replace($VisibleInfoBlocksInterface other);
  void update(void Function($VisibleInfoBlocksInterfaceBuilder) updates);
  bool? get preparationTime;
  set preparationTime(bool? preparationTime);

  bool? get cookingTime;
  set cookingTime(bool? cookingTime);

  bool? get totalTime;
  set totalTime(bool? totalTime);

  bool? get nutritionInformation;
  set nutritionInformation(bool? nutritionInformation);

  bool? get tools;
  set tools(bool? tools);
}

class _$VisibleInfoBlocks extends VisibleInfoBlocks {
  @override
  final bool? preparationTime;
  @override
  final bool? cookingTime;
  @override
  final bool? totalTime;
  @override
  final bool? nutritionInformation;
  @override
  final bool? tools;

  factory _$VisibleInfoBlocks([void Function(VisibleInfoBlocksBuilder)? updates]) =>
      (VisibleInfoBlocksBuilder()..update(updates))._build();

  _$VisibleInfoBlocks._({this.preparationTime, this.cookingTime, this.totalTime, this.nutritionInformation, this.tools})
      : super._();

  @override
  VisibleInfoBlocks rebuild(void Function(VisibleInfoBlocksBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  VisibleInfoBlocksBuilder toBuilder() => VisibleInfoBlocksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisibleInfoBlocks &&
        preparationTime == other.preparationTime &&
        cookingTime == other.cookingTime &&
        totalTime == other.totalTime &&
        nutritionInformation == other.nutritionInformation &&
        tools == other.tools;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, preparationTime.hashCode);
    _$hash = $jc(_$hash, cookingTime.hashCode);
    _$hash = $jc(_$hash, totalTime.hashCode);
    _$hash = $jc(_$hash, nutritionInformation.hashCode);
    _$hash = $jc(_$hash, tools.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisibleInfoBlocks')
          ..add('preparationTime', preparationTime)
          ..add('cookingTime', cookingTime)
          ..add('totalTime', totalTime)
          ..add('nutritionInformation', nutritionInformation)
          ..add('tools', tools))
        .toString();
  }
}

class VisibleInfoBlocksBuilder
    implements Builder<VisibleInfoBlocks, VisibleInfoBlocksBuilder>, $VisibleInfoBlocksInterfaceBuilder {
  _$VisibleInfoBlocks? _$v;

  bool? _preparationTime;
  bool? get preparationTime => _$this._preparationTime;
  set preparationTime(covariant bool? preparationTime) => _$this._preparationTime = preparationTime;

  bool? _cookingTime;
  bool? get cookingTime => _$this._cookingTime;
  set cookingTime(covariant bool? cookingTime) => _$this._cookingTime = cookingTime;

  bool? _totalTime;
  bool? get totalTime => _$this._totalTime;
  set totalTime(covariant bool? totalTime) => _$this._totalTime = totalTime;

  bool? _nutritionInformation;
  bool? get nutritionInformation => _$this._nutritionInformation;
  set nutritionInformation(covariant bool? nutritionInformation) => _$this._nutritionInformation = nutritionInformation;

  bool? _tools;
  bool? get tools => _$this._tools;
  set tools(covariant bool? tools) => _$this._tools = tools;

  VisibleInfoBlocksBuilder() {
    VisibleInfoBlocks._defaults(this);
  }

  VisibleInfoBlocksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _preparationTime = $v.preparationTime;
      _cookingTime = $v.cookingTime;
      _totalTime = $v.totalTime;
      _nutritionInformation = $v.nutritionInformation;
      _tools = $v.tools;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant VisibleInfoBlocks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisibleInfoBlocks;
  }

  @override
  void update(void Function(VisibleInfoBlocksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisibleInfoBlocks build() => _build();

  _$VisibleInfoBlocks _build() {
    VisibleInfoBlocks._validate(this);
    final _$result = _$v ??
        _$VisibleInfoBlocks._(
            preparationTime: preparationTime,
            cookingTime: cookingTime,
            totalTime: totalTime,
            nutritionInformation: nutritionInformation,
            tools: tools);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigInterfaceBuilder {
  void replace($ConfigInterface other);
  void update(void Function($ConfigInterfaceBuilder) updates);
  String? get folder;
  set folder(String? folder);

  int? get updateInterval;
  set updateInterval(int? updateInterval);

  bool? get printImage;
  set printImage(bool? printImage);

  VisibleInfoBlocksBuilder get visibleInfoBlocks;
  set visibleInfoBlocks(VisibleInfoBlocksBuilder? visibleInfoBlocks);
}

class _$Config extends Config {
  @override
  final String? folder;
  @override
  final int? updateInterval;
  @override
  final bool? printImage;
  @override
  final VisibleInfoBlocks? visibleInfoBlocks;

  factory _$Config([void Function(ConfigBuilder)? updates]) => (ConfigBuilder()..update(updates))._build();

  _$Config._({this.folder, this.updateInterval, this.printImage, this.visibleInfoBlocks}) : super._();

  @override
  Config rebuild(void Function(ConfigBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ConfigBuilder toBuilder() => ConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Config &&
        folder == other.folder &&
        updateInterval == other.updateInterval &&
        printImage == other.printImage &&
        visibleInfoBlocks == other.visibleInfoBlocks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folder.hashCode);
    _$hash = $jc(_$hash, updateInterval.hashCode);
    _$hash = $jc(_$hash, printImage.hashCode);
    _$hash = $jc(_$hash, visibleInfoBlocks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Config')
          ..add('folder', folder)
          ..add('updateInterval', updateInterval)
          ..add('printImage', printImage)
          ..add('visibleInfoBlocks', visibleInfoBlocks))
        .toString();
  }
}

class ConfigBuilder implements Builder<Config, ConfigBuilder>, $ConfigInterfaceBuilder {
  _$Config? _$v;

  String? _folder;
  String? get folder => _$this._folder;
  set folder(covariant String? folder) => _$this._folder = folder;

  int? _updateInterval;
  int? get updateInterval => _$this._updateInterval;
  set updateInterval(covariant int? updateInterval) => _$this._updateInterval = updateInterval;

  bool? _printImage;
  bool? get printImage => _$this._printImage;
  set printImage(covariant bool? printImage) => _$this._printImage = printImage;

  VisibleInfoBlocksBuilder? _visibleInfoBlocks;
  VisibleInfoBlocksBuilder get visibleInfoBlocks => _$this._visibleInfoBlocks ??= VisibleInfoBlocksBuilder();
  set visibleInfoBlocks(covariant VisibleInfoBlocksBuilder? visibleInfoBlocks) =>
      _$this._visibleInfoBlocks = visibleInfoBlocks;

  ConfigBuilder() {
    Config._defaults(this);
  }

  ConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folder = $v.folder;
      _updateInterval = $v.updateInterval;
      _printImage = $v.printImage;
      _visibleInfoBlocks = $v.visibleInfoBlocks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Config other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Config;
  }

  @override
  void update(void Function(ConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Config build() => _build();

  _$Config _build() {
    Config._validate(this);
    _$Config _$result;
    try {
      _$result = _$v ??
          _$Config._(
              folder: folder,
              updateInterval: updateInterval,
              printImage: printImage,
              visibleInfoBlocks: _visibleInfoBlocks?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'visibleInfoBlocks';
        _visibleInfoBlocks?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Config', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $UrlInterfaceBuilder {
  void replace($UrlInterface other);
  void update(void Function($UrlInterfaceBuilder) updates);
  String? get url;
  set url(String? url);
}

class _$Url extends Url {
  @override
  final String url;

  factory _$Url([void Function(UrlBuilder)? updates]) => (UrlBuilder()..update(updates))._build();

  _$Url._({required this.url}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'Url', 'url');
  }

  @override
  Url rebuild(void Function(UrlBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UrlBuilder toBuilder() => UrlBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Url && url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Url')..add('url', url)).toString();
  }
}

class UrlBuilder implements Builder<Url, UrlBuilder>, $UrlInterfaceBuilder {
  _$Url? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  UrlBuilder() {
    Url._defaults(this);
  }

  UrlBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Url other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Url;
  }

  @override
  void update(void Function(UrlBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Url build() => _build();

  _$Url _build() {
    Url._validate(this);
    final _$result = _$v ?? _$Url._(url: BuiltValueNullFieldError.checkNotNull(url, r'Url', 'url'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $NutritionInterfaceBuilder {
  void replace($NutritionInterface other);
  void update(void Function($NutritionInterfaceBuilder) updates);
  String? get type;
  set type(String? type);

  String? get calories;
  set calories(String? calories);

  String? get carbohydrateContent;
  set carbohydrateContent(String? carbohydrateContent);

  String? get cholesterolContent;
  set cholesterolContent(String? cholesterolContent);

  String? get fatContent;
  set fatContent(String? fatContent);

  String? get fiberContent;
  set fiberContent(String? fiberContent);

  String? get proteinContent;
  set proteinContent(String? proteinContent);

  String? get saturatedFatContent;
  set saturatedFatContent(String? saturatedFatContent);

  String? get servingSize;
  set servingSize(String? servingSize);

  String? get sodiumContent;
  set sodiumContent(String? sodiumContent);

  String? get sugarContent;
  set sugarContent(String? sugarContent);

  String? get transFatContent;
  set transFatContent(String? transFatContent);

  String? get unsaturatedFatContent;
  set unsaturatedFatContent(String? unsaturatedFatContent);
}

class _$Nutrition extends Nutrition {
  @override
  final String type;
  @override
  final String? calories;
  @override
  final String? carbohydrateContent;
  @override
  final String? cholesterolContent;
  @override
  final String? fatContent;
  @override
  final String? fiberContent;
  @override
  final String? proteinContent;
  @override
  final String? saturatedFatContent;
  @override
  final String? servingSize;
  @override
  final String? sodiumContent;
  @override
  final String? sugarContent;
  @override
  final String? transFatContent;
  @override
  final String? unsaturatedFatContent;

  factory _$Nutrition([void Function(NutritionBuilder)? updates]) => (NutritionBuilder()..update(updates))._build();

  _$Nutrition._(
      {required this.type,
      this.calories,
      this.carbohydrateContent,
      this.cholesterolContent,
      this.fatContent,
      this.fiberContent,
      this.proteinContent,
      this.saturatedFatContent,
      this.servingSize,
      this.sodiumContent,
      this.sugarContent,
      this.transFatContent,
      this.unsaturatedFatContent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'Nutrition', 'type');
  }

  @override
  Nutrition rebuild(void Function(NutritionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NutritionBuilder toBuilder() => NutritionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Nutrition &&
        type == other.type &&
        calories == other.calories &&
        carbohydrateContent == other.carbohydrateContent &&
        cholesterolContent == other.cholesterolContent &&
        fatContent == other.fatContent &&
        fiberContent == other.fiberContent &&
        proteinContent == other.proteinContent &&
        saturatedFatContent == other.saturatedFatContent &&
        servingSize == other.servingSize &&
        sodiumContent == other.sodiumContent &&
        sugarContent == other.sugarContent &&
        transFatContent == other.transFatContent &&
        unsaturatedFatContent == other.unsaturatedFatContent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, calories.hashCode);
    _$hash = $jc(_$hash, carbohydrateContent.hashCode);
    _$hash = $jc(_$hash, cholesterolContent.hashCode);
    _$hash = $jc(_$hash, fatContent.hashCode);
    _$hash = $jc(_$hash, fiberContent.hashCode);
    _$hash = $jc(_$hash, proteinContent.hashCode);
    _$hash = $jc(_$hash, saturatedFatContent.hashCode);
    _$hash = $jc(_$hash, servingSize.hashCode);
    _$hash = $jc(_$hash, sodiumContent.hashCode);
    _$hash = $jc(_$hash, sugarContent.hashCode);
    _$hash = $jc(_$hash, transFatContent.hashCode);
    _$hash = $jc(_$hash, unsaturatedFatContent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Nutrition')
          ..add('type', type)
          ..add('calories', calories)
          ..add('carbohydrateContent', carbohydrateContent)
          ..add('cholesterolContent', cholesterolContent)
          ..add('fatContent', fatContent)
          ..add('fiberContent', fiberContent)
          ..add('proteinContent', proteinContent)
          ..add('saturatedFatContent', saturatedFatContent)
          ..add('servingSize', servingSize)
          ..add('sodiumContent', sodiumContent)
          ..add('sugarContent', sugarContent)
          ..add('transFatContent', transFatContent)
          ..add('unsaturatedFatContent', unsaturatedFatContent))
        .toString();
  }
}

class NutritionBuilder implements Builder<Nutrition, NutritionBuilder>, $NutritionInterfaceBuilder {
  _$Nutrition? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _calories;
  String? get calories => _$this._calories;
  set calories(covariant String? calories) => _$this._calories = calories;

  String? _carbohydrateContent;
  String? get carbohydrateContent => _$this._carbohydrateContent;
  set carbohydrateContent(covariant String? carbohydrateContent) => _$this._carbohydrateContent = carbohydrateContent;

  String? _cholesterolContent;
  String? get cholesterolContent => _$this._cholesterolContent;
  set cholesterolContent(covariant String? cholesterolContent) => _$this._cholesterolContent = cholesterolContent;

  String? _fatContent;
  String? get fatContent => _$this._fatContent;
  set fatContent(covariant String? fatContent) => _$this._fatContent = fatContent;

  String? _fiberContent;
  String? get fiberContent => _$this._fiberContent;
  set fiberContent(covariant String? fiberContent) => _$this._fiberContent = fiberContent;

  String? _proteinContent;
  String? get proteinContent => _$this._proteinContent;
  set proteinContent(covariant String? proteinContent) => _$this._proteinContent = proteinContent;

  String? _saturatedFatContent;
  String? get saturatedFatContent => _$this._saturatedFatContent;
  set saturatedFatContent(covariant String? saturatedFatContent) => _$this._saturatedFatContent = saturatedFatContent;

  String? _servingSize;
  String? get servingSize => _$this._servingSize;
  set servingSize(covariant String? servingSize) => _$this._servingSize = servingSize;

  String? _sodiumContent;
  String? get sodiumContent => _$this._sodiumContent;
  set sodiumContent(covariant String? sodiumContent) => _$this._sodiumContent = sodiumContent;

  String? _sugarContent;
  String? get sugarContent => _$this._sugarContent;
  set sugarContent(covariant String? sugarContent) => _$this._sugarContent = sugarContent;

  String? _transFatContent;
  String? get transFatContent => _$this._transFatContent;
  set transFatContent(covariant String? transFatContent) => _$this._transFatContent = transFatContent;

  String? _unsaturatedFatContent;
  String? get unsaturatedFatContent => _$this._unsaturatedFatContent;
  set unsaturatedFatContent(covariant String? unsaturatedFatContent) =>
      _$this._unsaturatedFatContent = unsaturatedFatContent;

  NutritionBuilder() {
    Nutrition._defaults(this);
  }

  NutritionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _calories = $v.calories;
      _carbohydrateContent = $v.carbohydrateContent;
      _cholesterolContent = $v.cholesterolContent;
      _fatContent = $v.fatContent;
      _fiberContent = $v.fiberContent;
      _proteinContent = $v.proteinContent;
      _saturatedFatContent = $v.saturatedFatContent;
      _servingSize = $v.servingSize;
      _sodiumContent = $v.sodiumContent;
      _sugarContent = $v.sugarContent;
      _transFatContent = $v.transFatContent;
      _unsaturatedFatContent = $v.unsaturatedFatContent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Nutrition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Nutrition;
  }

  @override
  void update(void Function(NutritionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Nutrition build() => _build();

  _$Nutrition _build() {
    Nutrition._validate(this);
    final _$result = _$v ??
        _$Nutrition._(
            type: BuiltValueNullFieldError.checkNotNull(type, r'Nutrition', 'type'),
            calories: calories,
            carbohydrateContent: carbohydrateContent,
            cholesterolContent: cholesterolContent,
            fatContent: fatContent,
            fiberContent: fiberContent,
            proteinContent: proteinContent,
            saturatedFatContent: saturatedFatContent,
            servingSize: servingSize,
            sodiumContent: sodiumContent,
            sugarContent: sugarContent,
            transFatContent: transFatContent,
            unsaturatedFatContent: unsaturatedFatContent);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $RecipeInterfaceBuilder implements $RecipeStubInformationInterfaceBuilder {
  void replace(covariant $RecipeInterface other);
  void update(void Function($RecipeInterfaceBuilder) updates);
  String? get type;
  set type(covariant String? type);

  String? get id;
  set id(covariant String? id);

  String? get prepTime;
  set prepTime(covariant String? prepTime);

  String? get cookTime;
  set cookTime(covariant String? cookTime);

  String? get totalTime;
  set totalTime(covariant String? totalTime);

  String? get description;
  set description(covariant String? description);

  String? get url;
  set url(covariant String? url);

  String? get image;
  set image(covariant String? image);

  int? get recipeYield;
  set recipeYield(covariant int? recipeYield);

  String? get recipeCategory;
  set recipeCategory(covariant String? recipeCategory);

  ListBuilder<String> get tool;
  set tool(covariant ListBuilder<String>? tool);

  ListBuilder<String> get recipeIngredient;
  set recipeIngredient(covariant ListBuilder<String>? recipeIngredient);

  ListBuilder<String> get recipeInstructions;
  set recipeInstructions(covariant ListBuilder<String>? recipeInstructions);

  NutritionBuilder get nutrition;
  set nutrition(covariant NutritionBuilder? nutrition);

  String? get name;
  set name(covariant String? name);

  String? get keywords;
  set keywords(covariant String? keywords);

  String? get dateCreated;
  set dateCreated(covariant String? dateCreated);

  String? get dateModified;
  set dateModified(covariant String? dateModified);

  String? get imageUrl;
  set imageUrl(covariant String? imageUrl);

  String? get imagePlaceholderUrl;
  set imagePlaceholderUrl(covariant String? imagePlaceholderUrl);
}

class _$Recipe extends Recipe {
  @override
  final String type;
  @override
  final String? id;
  @override
  final String? prepTime;
  @override
  final String? cookTime;
  @override
  final String? totalTime;
  @override
  final String description;
  @override
  final String url;
  @override
  final String image;
  @override
  final int recipeYield;
  @override
  final String recipeCategory;
  @override
  final BuiltList<String> tool;
  @override
  final BuiltList<String> recipeIngredient;
  @override
  final BuiltList<String> recipeInstructions;
  @override
  final Nutrition nutrition;
  @override
  final String name;
  @override
  final String keywords;
  @override
  final String dateCreated;
  @override
  final String? dateModified;
  @override
  final String imageUrl;
  @override
  final String imagePlaceholderUrl;

  factory _$Recipe([void Function(RecipeBuilder)? updates]) => (RecipeBuilder()..update(updates))._build();

  _$Recipe._(
      {required this.type,
      this.id,
      this.prepTime,
      this.cookTime,
      this.totalTime,
      required this.description,
      required this.url,
      required this.image,
      required this.recipeYield,
      required this.recipeCategory,
      required this.tool,
      required this.recipeIngredient,
      required this.recipeInstructions,
      required this.nutrition,
      required this.name,
      required this.keywords,
      required this.dateCreated,
      this.dateModified,
      required this.imageUrl,
      required this.imagePlaceholderUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'Recipe', 'type');
    BuiltValueNullFieldError.checkNotNull(description, r'Recipe', 'description');
    BuiltValueNullFieldError.checkNotNull(url, r'Recipe', 'url');
    BuiltValueNullFieldError.checkNotNull(image, r'Recipe', 'image');
    BuiltValueNullFieldError.checkNotNull(recipeYield, r'Recipe', 'recipeYield');
    BuiltValueNullFieldError.checkNotNull(recipeCategory, r'Recipe', 'recipeCategory');
    BuiltValueNullFieldError.checkNotNull(tool, r'Recipe', 'tool');
    BuiltValueNullFieldError.checkNotNull(recipeIngredient, r'Recipe', 'recipeIngredient');
    BuiltValueNullFieldError.checkNotNull(recipeInstructions, r'Recipe', 'recipeInstructions');
    BuiltValueNullFieldError.checkNotNull(nutrition, r'Recipe', 'nutrition');
    BuiltValueNullFieldError.checkNotNull(name, r'Recipe', 'name');
    BuiltValueNullFieldError.checkNotNull(keywords, r'Recipe', 'keywords');
    BuiltValueNullFieldError.checkNotNull(dateCreated, r'Recipe', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(imageUrl, r'Recipe', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(imagePlaceholderUrl, r'Recipe', 'imagePlaceholderUrl');
  }

  @override
  Recipe rebuild(void Function(RecipeBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  RecipeBuilder toBuilder() => RecipeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Recipe &&
        type == other.type &&
        id == other.id &&
        prepTime == other.prepTime &&
        cookTime == other.cookTime &&
        totalTime == other.totalTime &&
        description == other.description &&
        url == other.url &&
        image == other.image &&
        recipeYield == other.recipeYield &&
        recipeCategory == other.recipeCategory &&
        tool == other.tool &&
        recipeIngredient == other.recipeIngredient &&
        recipeInstructions == other.recipeInstructions &&
        nutrition == other.nutrition &&
        name == other.name &&
        keywords == other.keywords &&
        dateCreated == other.dateCreated &&
        dateModified == other.dateModified &&
        imageUrl == other.imageUrl &&
        imagePlaceholderUrl == other.imagePlaceholderUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, prepTime.hashCode);
    _$hash = $jc(_$hash, cookTime.hashCode);
    _$hash = $jc(_$hash, totalTime.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, recipeYield.hashCode);
    _$hash = $jc(_$hash, recipeCategory.hashCode);
    _$hash = $jc(_$hash, tool.hashCode);
    _$hash = $jc(_$hash, recipeIngredient.hashCode);
    _$hash = $jc(_$hash, recipeInstructions.hashCode);
    _$hash = $jc(_$hash, nutrition.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, dateModified.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, imagePlaceholderUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Recipe')
          ..add('type', type)
          ..add('id', id)
          ..add('prepTime', prepTime)
          ..add('cookTime', cookTime)
          ..add('totalTime', totalTime)
          ..add('description', description)
          ..add('url', url)
          ..add('image', image)
          ..add('recipeYield', recipeYield)
          ..add('recipeCategory', recipeCategory)
          ..add('tool', tool)
          ..add('recipeIngredient', recipeIngredient)
          ..add('recipeInstructions', recipeInstructions)
          ..add('nutrition', nutrition)
          ..add('name', name)
          ..add('keywords', keywords)
          ..add('dateCreated', dateCreated)
          ..add('dateModified', dateModified)
          ..add('imageUrl', imageUrl)
          ..add('imagePlaceholderUrl', imagePlaceholderUrl))
        .toString();
  }
}

class RecipeBuilder implements Builder<Recipe, RecipeBuilder>, $RecipeInterfaceBuilder {
  _$Recipe? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _prepTime;
  String? get prepTime => _$this._prepTime;
  set prepTime(covariant String? prepTime) => _$this._prepTime = prepTime;

  String? _cookTime;
  String? get cookTime => _$this._cookTime;
  set cookTime(covariant String? cookTime) => _$this._cookTime = cookTime;

  String? _totalTime;
  String? get totalTime => _$this._totalTime;
  set totalTime(covariant String? totalTime) => _$this._totalTime = totalTime;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _image;
  String? get image => _$this._image;
  set image(covariant String? image) => _$this._image = image;

  int? _recipeYield;
  int? get recipeYield => _$this._recipeYield;
  set recipeYield(covariant int? recipeYield) => _$this._recipeYield = recipeYield;

  String? _recipeCategory;
  String? get recipeCategory => _$this._recipeCategory;
  set recipeCategory(covariant String? recipeCategory) => _$this._recipeCategory = recipeCategory;

  ListBuilder<String>? _tool;
  ListBuilder<String> get tool => _$this._tool ??= ListBuilder<String>();
  set tool(covariant ListBuilder<String>? tool) => _$this._tool = tool;

  ListBuilder<String>? _recipeIngredient;
  ListBuilder<String> get recipeIngredient => _$this._recipeIngredient ??= ListBuilder<String>();
  set recipeIngredient(covariant ListBuilder<String>? recipeIngredient) => _$this._recipeIngredient = recipeIngredient;

  ListBuilder<String>? _recipeInstructions;
  ListBuilder<String> get recipeInstructions => _$this._recipeInstructions ??= ListBuilder<String>();
  set recipeInstructions(covariant ListBuilder<String>? recipeInstructions) =>
      _$this._recipeInstructions = recipeInstructions;

  NutritionBuilder? _nutrition;
  NutritionBuilder get nutrition => _$this._nutrition ??= NutritionBuilder();
  set nutrition(covariant NutritionBuilder? nutrition) => _$this._nutrition = nutrition;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _keywords;
  String? get keywords => _$this._keywords;
  set keywords(covariant String? keywords) => _$this._keywords = keywords;

  String? _dateCreated;
  String? get dateCreated => _$this._dateCreated;
  set dateCreated(covariant String? dateCreated) => _$this._dateCreated = dateCreated;

  String? _dateModified;
  String? get dateModified => _$this._dateModified;
  set dateModified(covariant String? dateModified) => _$this._dateModified = dateModified;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(covariant String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _imagePlaceholderUrl;
  String? get imagePlaceholderUrl => _$this._imagePlaceholderUrl;
  set imagePlaceholderUrl(covariant String? imagePlaceholderUrl) => _$this._imagePlaceholderUrl = imagePlaceholderUrl;

  RecipeBuilder() {
    Recipe._defaults(this);
  }

  RecipeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _prepTime = $v.prepTime;
      _cookTime = $v.cookTime;
      _totalTime = $v.totalTime;
      _description = $v.description;
      _url = $v.url;
      _image = $v.image;
      _recipeYield = $v.recipeYield;
      _recipeCategory = $v.recipeCategory;
      _tool = $v.tool.toBuilder();
      _recipeIngredient = $v.recipeIngredient.toBuilder();
      _recipeInstructions = $v.recipeInstructions.toBuilder();
      _nutrition = $v.nutrition.toBuilder();
      _name = $v.name;
      _keywords = $v.keywords;
      _dateCreated = $v.dateCreated;
      _dateModified = $v.dateModified;
      _imageUrl = $v.imageUrl;
      _imagePlaceholderUrl = $v.imagePlaceholderUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Recipe other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Recipe;
  }

  @override
  void update(void Function(RecipeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Recipe build() => _build();

  _$Recipe _build() {
    Recipe._validate(this);
    _$Recipe _$result;
    try {
      _$result = _$v ??
          _$Recipe._(
              type: BuiltValueNullFieldError.checkNotNull(type, r'Recipe', 'type'),
              id: id,
              prepTime: prepTime,
              cookTime: cookTime,
              totalTime: totalTime,
              description: BuiltValueNullFieldError.checkNotNull(description, r'Recipe', 'description'),
              url: BuiltValueNullFieldError.checkNotNull(url, r'Recipe', 'url'),
              image: BuiltValueNullFieldError.checkNotNull(image, r'Recipe', 'image'),
              recipeYield: BuiltValueNullFieldError.checkNotNull(recipeYield, r'Recipe', 'recipeYield'),
              recipeCategory: BuiltValueNullFieldError.checkNotNull(recipeCategory, r'Recipe', 'recipeCategory'),
              tool: tool.build(),
              recipeIngredient: recipeIngredient.build(),
              recipeInstructions: recipeInstructions.build(),
              nutrition: nutrition.build(),
              name: BuiltValueNullFieldError.checkNotNull(name, r'Recipe', 'name'),
              keywords: BuiltValueNullFieldError.checkNotNull(keywords, r'Recipe', 'keywords'),
              dateCreated: BuiltValueNullFieldError.checkNotNull(dateCreated, r'Recipe', 'dateCreated'),
              dateModified: dateModified,
              imageUrl: BuiltValueNullFieldError.checkNotNull(imageUrl, r'Recipe', 'imageUrl'),
              imagePlaceholderUrl:
                  BuiltValueNullFieldError.checkNotNull(imagePlaceholderUrl, r'Recipe', 'imagePlaceholderUrl'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tool';
        tool.build();
        _$failedField = 'recipeIngredient';
        recipeIngredient.build();
        _$failedField = 'recipeInstructions';
        recipeInstructions.build();
        _$failedField = 'nutrition';
        nutrition.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Recipe', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $KeywordInterfaceBuilder implements $CategoryInformationInterfaceBuilder {
  void replace(covariant $KeywordInterface other);
  void update(void Function($KeywordInterfaceBuilder) updates);
  String? get name;
  set name(covariant String? name);

  int? get recipeCount;
  set recipeCount(covariant int? recipeCount);
}

class _$Keyword extends Keyword {
  @override
  final String name;
  @override
  final int recipeCount;

  factory _$Keyword([void Function(KeywordBuilder)? updates]) => (KeywordBuilder()..update(updates))._build();

  _$Keyword._({required this.name, required this.recipeCount}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Keyword', 'name');
    BuiltValueNullFieldError.checkNotNull(recipeCount, r'Keyword', 'recipeCount');
  }

  @override
  Keyword rebuild(void Function(KeywordBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  KeywordBuilder toBuilder() => KeywordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Keyword && name == other.name && recipeCount == other.recipeCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, recipeCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Keyword')
          ..add('name', name)
          ..add('recipeCount', recipeCount))
        .toString();
  }
}

class KeywordBuilder implements Builder<Keyword, KeywordBuilder>, $KeywordInterfaceBuilder {
  _$Keyword? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  int? _recipeCount;
  int? get recipeCount => _$this._recipeCount;
  set recipeCount(covariant int? recipeCount) => _$this._recipeCount = recipeCount;

  KeywordBuilder() {
    Keyword._defaults(this);
  }

  KeywordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _recipeCount = $v.recipeCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Keyword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Keyword;
  }

  @override
  void update(void Function(KeywordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Keyword build() => _build();

  _$Keyword _build() {
    Keyword._validate(this);
    final _$result = _$v ??
        _$Keyword._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'Keyword', 'name'),
            recipeCount: BuiltValueNullFieldError.checkNotNull(recipeCount, r'Keyword', 'recipeCount'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ErrorInterfaceBuilder {
  void replace($ErrorInterface other);
  void update(void Function($ErrorInterfaceBuilder) updates);
  String? get msg;
  set msg(String? msg);

  String? get file;
  set file(String? file);

  int? get line;
  set line(int? line);
}

class _$Error extends Error {
  @override
  final String? msg;
  @override
  final String? file;
  @override
  final int? line;

  factory _$Error([void Function(ErrorBuilder)? updates]) => (ErrorBuilder()..update(updates))._build();

  _$Error._({this.msg, this.file, this.line}) : super._();

  @override
  Error rebuild(void Function(ErrorBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ErrorBuilder toBuilder() => ErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Error && msg == other.msg && file == other.file && line == other.line;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jc(_$hash, line.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Error')
          ..add('msg', msg)
          ..add('file', file)
          ..add('line', line))
        .toString();
  }
}

class ErrorBuilder implements Builder<Error, ErrorBuilder>, $ErrorInterfaceBuilder {
  _$Error? _$v;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(covariant String? msg) => _$this._msg = msg;

  String? _file;
  String? get file => _$this._file;
  set file(covariant String? file) => _$this._file = file;

  int? _line;
  int? get line => _$this._line;
  set line(covariant int? line) => _$this._line = line;

  ErrorBuilder() {
    Error._defaults(this);
  }

  ErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msg = $v.msg;
      _file = $v.file;
      _line = $v.line;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Error other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Error;
  }

  @override
  void update(void Function(ErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Error build() => _build();

  _$Error _build() {
    Error._validate(this);
    final _$result = _$v ?? _$Error._(msg: msg, file: file, line: line);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
