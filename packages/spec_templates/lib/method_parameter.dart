// ignore_for_file: public_member_api_docs

class MethodParameter {
  MethodParameter({
    required this.type,
    required this.nullable,
    required this.name,
    required final String? defaultValue,
    required this.description,
    required this.controllerName,
    required this.methodName,
  }) {
    if (defaultValue == 'null') {
      nullable = true;
    }
    if (type == null && defaultValue != null && defaultValue != 'null') {
      nullable = false;
      if (int.tryParse(defaultValue) != null) {
        type = 'int';
      }
      if (defaultValue == 'true' || defaultValue == 'false') {
        type = 'bool';
      }
      if (defaultValue == "''" || defaultValue == '""') {
        type = 'string';
      }
      if (defaultValue == '[]') {
        type = 'array';
      }
    }
    if (type == null) {
      throw Exception(
        'Unknown type for parameter "$name" with default value "$defaultValue" of method "$methodName" in controller "$controllerName"',
      );
    }
    if (defaultValue != null && defaultValue != 'null') {
      switch (type) {
        case 'int':
          this.defaultValue = int.tryParse(defaultValue);
          break;
        case 'bool':
          this.defaultValue = defaultValue == 'true';
          break;
        case 'string':
          this.defaultValue = defaultValue.substring(1, defaultValue.length - 1);
          break;
        case 'array':
          break;
        default:
          throw Exception('Unknown way to parse default value for type "$type"');
      }
    }
  }

  String? type;
  bool nullable;
  final String name;
  dynamic defaultValue;
  final String? description;

  final String controllerName;
  final String methodName;

  String? get openAPIType {
    if (type != null) {
      if (type == 'string') {
        return 'string';
      }
      if (type == 'int' || type == 'integer') {
        return 'integer';
      }
      if (type == 'bool' || type == 'boolean') {
        return 'boolean';
      }
      if (type == 'array') {
        return 'array';
      }

      throw Exception(
        'Could not infer OpenAPI type from type "$type" for parameter "$name" of method "$methodName" in controller "$controllerName"',
      );
    }
    return null;
  }

  @override
  String toString() =>
      'MethodParameter(type: $type, nullable: $nullable, name: $name, defaultValue: $defaultValue, description: $description, controllerName: $controllerName, methodName: $methodName)';
}
