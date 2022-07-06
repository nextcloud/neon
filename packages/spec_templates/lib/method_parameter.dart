// ignore_for_file: public_member_api_docs

class MethodParameter {
  MethodParameter({
    required this.type,
    required this.nullable,
    required this.name,
    required this.defaultValue,
    required this.description,
    required this.controllerName,
    required this.methodName,
  }) {
    if (type == null) {
      if (defaultValue != null && defaultValue != 'null') {
        if (int.tryParse(defaultValue!) != null) {
          type = 'int';
        }
        if (defaultValue == 'true' || defaultValue == 'false') {
          type = 'bool';
        }
        if (defaultValue == "''" || defaultValue == '""') {
          type = 'string';
        }
        if (defaultValue != null) {
          nullable = false;
        }
        if (type == null) {
          print(
            'WARNING: Unknown type for parameter "$name" with default value "$defaultValue" of method "$methodName" in controller "$controllerName"',
          );
        }
      } else {
        print('WARNING: Unknown type for parameter "$name" of method "$methodName" in controller "$controllerName"');
      }
    }
  }

  String? type;
  bool nullable;
  final String name;
  final String? defaultValue;
  final String? description;

  final String controllerName;
  final String methodName;

  String? get openAPIType {
    if (type != null) {
      if (type == 'string') {
        return 'string';
      }
      if (type == 'int') {
        return 'integer';
      }
      if (type == 'bool') {
        return 'boolean';
      }

      print(
        'WARNING: Could not infer OpenAPI type from type "$type" for parameter "$name" of method "$methodName" in controller "$controllerName"',
      );
    }
    return null;
  }

  @override
  String toString() =>
      'MethodParameter(type: $type, nullable: $nullable, name: $name, defaultValue: $defaultValue, description: $description, controllerName: $controllerName, methodName: $methodName)';
}
