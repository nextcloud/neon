/// Configuration for using `package:build`-compatible build systems.
///
/// See:
/// * [build_runner](https://pub.dev/packages/build_runner)
///
/// This library is **not** intended to be imported by typical end-users unless
/// you are creating a custom compilation pipeline. See documentation for
/// details, and `build.yaml` for how these builders are configured by default.
library dynamite;

import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:dynamite/src/json_schema_builder.dart' show JsonSchemaBuilder;
import 'package:dynamite/src/openapi_builder.dart' show OpenAPIBuilder;

Builder openAPIBuilder(BuilderOptions options) => OpenAPIBuilder(options);

Builder jsonSchemaBuilder(BuilderOptions options) => JsonSchemaBuilder(options);
