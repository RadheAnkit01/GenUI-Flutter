bool validateProps(Map<String, dynamic> props, Map<String, dynamic> schema) {
  // Required fields
  final requiredFields = schema['required'] ?? [];

  for (final field in requiredFields) {
    if (!props.containsKey(field)) {
      print("Missing required field: $field");

      return false;
    }
  }

  // Properties
  final properties = schema['properties'];

  for (final key in properties.keys) {
    final expectedType = properties[key]['type'];

    final value = props[key];

    // Skip null optional fields
    if (value == null) {
      continue;
    }

    // STRING
    if (expectedType == 'string' && value is! String) {
      print("$key should be string");

      return false;
    }

    // NUMBER
    if (expectedType == 'number' && value is! num) {
      print("$key should be number");

      return false;
    }

    // BOOLEAN
    if (expectedType == 'boolean' && value is! bool) {
      print("$key should be boolean");

      return false;
    }

    // ARRAY
    if (expectedType == 'array' && value is! List) {
      print("$key should be array");

      return false;
    }

    // OBJECT
    if (expectedType == 'object' && value is! Map<String, dynamic>) {
      print("$key should be object");

      return false;
    }
  }

  return true;
}
