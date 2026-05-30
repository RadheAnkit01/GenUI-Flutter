import 'package:flutter/material.dart';
import 'package:gen_ui/Gen%20UI%20Functions/builders.dart';
import 'package:gen_ui/Gen%20UI%20Functions/schemas.dart';
import 'package:gen_ui/Gen%20UI%20Functions/validateProp.dart';

Widget renderWidget(BuildContext context, Map<String, dynamic> data) {
  try {
    final widgetType = data['widget'];

    final props = data['props'] ?? {};

    // FIND SCHEMA
    final schema = schemas[widgetType];

    if (schema == null) {
      return Text("No schema found for $widgetType");
    }

    // VALIDATE
    final isValid = validateProps(props, schema);

    if (!isValid) {
      return Text("Validation Failed for $widgetType");
    }

    // FIND BUILDER
    final builder = builders[widgetType];

    if (builder == null) {
      return Text("No builder found for $widgetType");
    }

    // RENDER
    return builder(
      context,
      props,
      (childData) => renderWidget(context, childData),
    );
  } catch (e) {
    return Text("Render Error: $e");
  }
}
