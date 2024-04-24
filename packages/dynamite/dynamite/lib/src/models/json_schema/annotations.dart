import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:dynamite/src/helpers/default_value.dart';
import 'package:dynamite/src/helpers/docs.dart';

/// https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9
mixin JsonSchemaAnnotations {
  /// https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.1
  String? get title;

  /// https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.1
  String? get description;

  /// https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.2
  @BuiltValueField(wireName: 'default')
  JsonObject? get rawDefault;

  /// The default value encoded to be written to the generated output.
  @memoized
  String? get $default => encodeDefault(rawDefault);

  /// The default value encoded for doc comments.
  @memoized
  String? get defaultDescription => encodeDefault(rawDefault, constant: false);

  /// Whether applications SHOULD refrain from usage of the declared property.
  /// It MAY mean the property is going to be removed in the future.
  ///
  /// Defaults to `false`.
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.3
  bool get deprecated;

  /// Indicates that the value of the instance is managed exclusively by the owning authority,
  /// and attempts by an application to modify the value of this property are expected to be ignored or rejected by that owning authority.
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.4
  bool get readOnly;

  /// Indicates that the value is never present when the instance is retrieved from the owning authority.
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.4
  bool get writeOnly;

  /// Provides sample JSON values associated with this schema.
  ///
  /// It is RECOMMENDED that these values be valid against the associated schema.
  /// Falls back to the value of [$default] if not present.
  ///
  /// See:
  ///   * https://json-schema.org/draft/2020-12/draft-bhutton-json-schema-validation-01#section-9.5
  BuiltList<JsonObject>? get examples;

  /// Formats the description for this schema.
  ///
  /// If [attribute] is true further attribute and validation specific information will be included.
  String? formattedDescription({bool attribute = false}) {
    final buffer = StringBuffer();
    final title = formatDescription(this.title);
    if (title != null) {
      buffer
        ..writeln(title)
        ..write('\n');
    }

    final description = formatDescription(this.description);
    if (description != null) {
      buffer
        ..write(description)
        ..write('\n');
    }

    if (!attribute) {
      return buffer.toString();
    }

    final $default = defaultDescription;
    if ($default != null) {
      buffer
        ..write('Defaults to `${$default}`.')
        ..write('\n');
    }

    if (readOnly) {
      buffer
        ..write('''
This value is read only and exclusively managed by the owning authority.
Any attempts by an application to modify the this property are expected to be ignored or rejected by that owning authority.
            ''')
        ..write('\n');
    }

    if (writeOnly) {
      buffer
        ..write(
          'This value is write only. It is never present when the instance is retrieved from the owning authority.',
        )
        ..write('\n');
    }

    return buffer.toString();
  }
}
