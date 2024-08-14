import 'package:account_repository/src/models/models.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:meta/meta.dart';

/// The serializer for the account repository models.
@internal
final Serializers serializers = (Serializers().toBuilder()
      ..add(Credentials.serializer)
      ..addPlugin(StandardJsonPlugin()))
    .build();
