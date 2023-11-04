Provides a [Dart Build System](https://github.com/dart-lang/build) builder for generating clients from an [OpenAPI specifications](https://swagger.io/specification/).

The builder generates code if it find files with an `.openapi.json` or `.openapi.yaml` extension in the lib directory.

# Build configuration

You can configure code generation by setting values in the `build.yaml`.

```yaml
targets:
  $default:
    builders:
      dynamite:
        options:
          # Options configure how source code is generated.
          #
          # The following are sensible default values that ignores the schemas for the coverage.
          pageWidth: 120
          analyzer_ignores:
            - camel_case_types
            - discarded_futures
            - public_member_api_docs
            - unreachable_switch_case
          coverage_ignores:
            - 'const .*\._\(\);'
            - 'factory .*\.fromJson\(Map<String, dynamic> json\) => _jsonSerializers\.deserializeWith\(serializer, json\)!;'
            - 'Map<String, dynamic> toJson\(\) => _jsonSerializers\.serializeWith\(serializer, this\)! as Map<String, dynamic>;'
            - 'static BuiltSet<.*> get values => _\$.*Values;'

```
