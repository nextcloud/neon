import 'package:built_collection/built_collection.dart';

/// https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-8
mixin Validator {
  /// https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-7
  String? get format;
}

/// Validates a [num].
///
/// ### Multiples
/// {@template NumberValidator.multiples}
/// Numbers can be restricted to a multiple of a given number, using the [multipleOf] keyword.
///
/// It may be set to any positive number.
/// The multiple can be a floating point number.
/// {@endtemplate}
///
/// ### Range
/// {@template NumberValidator.range}
/// Ranges of numbers are specified using a combination of the [minimum] and [maximum] keywords,
/// (or [exclusiveMinimum] and [exclusiveMaximum] for expressing exclusive range).
///
/// If x is the value being validated, the following must hold true:
/// ```md
/// x ≥ minimum
/// x > exclusiveMinimum
/// x ≤ maximum
/// x < exclusiveMaximum
/// ```
/// While you can specify both of [minimum] and [exclusiveMinimum] or both of [maximum] and
/// [exclusiveMaximum], it doesn't really make sense to do so.
/// {@endtemplate}
///
/// See:
///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.2
///   * https://json-schema.org/understanding-json-schema/reference/numeric
mixin NumberValidator implements Validator {
  /// {@macro NumberValidator.multiples}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.2.1
  ///   * https://json-schema.org/understanding-json-schema/reference/numeric#multiples
  num? get multipleOf;

  /// {@macro NumberValidator.range}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.2.2
  ///   * https://json-schema.org/understanding-json-schema/reference/numeric#range
  num? get maximum;

  /// {@macro NumberValidator.range}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.2.3
  ///   * https://json-schema.org/understanding-json-schema/reference/numeric#range
  num? get exclusiveMaximum;

  /// {@macro NumberValidator.range}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.2.4
  ///   * https://json-schema.org/understanding-json-schema/reference/numeric#range
  num? get minimum;

  /// {@macro NumberValidator.range}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.2.5
  ///   * https://json-schema.org/understanding-json-schema/reference/numeric#range
  num? get exclusiveMinimum;
}

/// Validates a [String].
///
/// ### Length
/// {@template StringValidator.length}
/// The length of a string can be constrained using the [minLength] and [maxLength] keywords.
/// For both keywords, the value must be a non-negative number.
/// {@endtemplate}
///
/// ### Regular Expressions
/// {@template StringValidator.regularExpressions}
/// The [pattern] keyword is used to restrict a string to a particular regular expression.
/// The regular expression syntax is the one defined in JavaScript ([ECMA 262](https://www.ecma-international.org/publications-and-standards/standards/ecma-262/) specifically) with Unicode support.
/// See [Regular Expressions](https://json-schema.org/understanding-json-schema/reference/regular_expressions) for more information.
/// ```md
/// When defining the regular expressions, it's important to note that the string is considered valid if the expression matches anywhere within the string.
/// For example, the regular expression `"p"` will match any string with a `p` in it, such as `"apple"` not just a string that is simply `"p"`.
/// Therefore, it is usually less confusing, as a matter of course, to surround the regular expression in `^...$`, for example, `"^p$"`, unless there is a good reason not to do so.
/// ```
/// {@endtemplate}
///
/// See:
///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.3
///   * https://json-schema.org/understanding-json-schema/reference/string
mixin StringValidator implements Validator {
  /// {@macro StringValidator.length}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.3.1
  ///   * https://json-schema.org/understanding-json-schema/reference/string#length
  int? get maxLength;

  /// {@macro StringValidator.length}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.3.2
  ///   * https://json-schema.org/understanding-json-schema/reference/string#length
  int? get minLength;

  /// {@macro StringValidator.regularExpressions}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.3.3
  ///   * https://json-schema.org/understanding-json-schema/reference/string#regexp
  RegExp? get pattern;
}

/// Validates an [Iterable].
///
/// ### Items
/// {@template ArrayValidator.length}
/// The length of the array can be specified using the [minItems] and [maxItems] keywords.
/// The value of each keyword must be a non-negative number.
/// These keywords work whether doing list validation or tuple-validation.
/// {@endtemplate}
///
/// ### Uniqueness
/// {@template ArrayValidator.uniqueItems}
/// A schema can ensure that each of the items in an array is unique. Simply set the [uniqueItems] keyword to `true`.
/// {@endtemplate}
///
/// ### minContains / maxContains
/// {@template ArrayValidator.contains}
/// [minContains] and [maxContains] can be used with contains to further specify how many times a schema matches a contains constraint.
/// These keywords can be any non-negative number including zero.
/// {@endtemplate}
///
/// See:
///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.4
///   * https://json-schema.org/understanding-json-schema/reference/array
mixin ArrayValidator implements Validator {
  /// {@macro ArrayValidator.length}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.4.1
  ///   * https://json-schema.org/understanding-json-schema/reference/array#length
  int? get maxItems;

  /// {@macro ArrayValidator.length}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.4.2
  ///   * https://json-schema.org/understanding-json-schema/reference/array#length
  int? get minItems;

  /// {@macro ArrayValidator.uniqueItems}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.4.3
  ///   * https://json-schema.org/understanding-json-schema/reference/array#uniqueItems
  bool get uniqueItems;

  /// {@macro ArrayValidator.contains}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.4.4
  ///   * https://json-schema.org/understanding-json-schema/reference/array#mincontains-maxcontains
  int? get maxContains;

  /// {@macro ArrayValidator.contains}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.4.5
  ///   * https://json-schema.org/understanding-json-schema/reference/array#mincontains-maxcontains
  int? get minContains;
}

/// Validates an [Object].
///
/// ### Required
/// {@template ObjectValidator.required}
/// By default, the properties defined by the `properties` keyword are not required. However,
/// one can provide a list of required properties using the [required] keyword.
///
/// The [required] keyword takes an array of zero or more strings. Each of these strings must be unique.
/// {@endtemplate}
///
/// ### Size
/// {@template ObjectValidator.size}
/// The number of properties on an object can be restricted using the [minProperties] and [maxProperties] keywords.
/// Each of these must be a non-negative integer.
/// {@endtemplate}
///
/// See:
///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.5
///   * https://json-schema.org/understanding-json-schema/reference/object
mixin ObjectValidator implements Validator {
  /// {@macro ObjectValidator.size}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.5.1
  ///   * https://json-schema.org/understanding-json-schema/reference/object#size
  int? get maxProperties;

  /// {@macro ObjectValidator.size}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.5.2
  ///   * https://json-schema.org/understanding-json-schema/reference/object#size
  int? get minProperties;

  /// {@macro ObjectValidator.required}
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.5.3
  ///   * https://json-schema.org/understanding-json-schema/reference/object#required
  BuiltSet<String> get required;

  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-6.5.4
  Map<String, BuiltSet<String>>? get dependentRequired;
}
