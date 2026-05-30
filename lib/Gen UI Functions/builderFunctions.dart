import 'package:flutter/material.dart';
import 'package:gen_ui/Helper/helperFunction.dart';
import 'package:gen_ui/Widgets/mcqsWidget.dart';

Widget buildTextCard(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        props['text'],
        style: TextStyle(fontSize: props['fontSize'].toDouble() ?? 18),
      ),
    ),
  );
}

Widget buildButtonCard(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return SizedBox(
    width: (props['width'] ?? 150).toDouble(),
    height: (props['height'] ?? 50).toDouble(),
    child: ElevatedButton(
      onPressed: props['disabled'] == true
          ? null
          : () {
              print(props['action']);
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: parseColor(props['backgroundColor'] ?? '#FF0000'),
        foregroundColor: parseColor(props['textColor'] ?? '#FFFFFF'),
      ),
      child: Text(props['title']),
    ),
  );
}

Widget buildProductCard(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(props['image'], height: 120),

          const SizedBox(height: 10),

          Text(
            props['title'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Text("\$${props['price']}", style: const TextStyle(fontSize: 18)),
        ],
      ),
    ),
  );
}

Widget buildProfileCard(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return Card(
    elevation: 5,
    margin: const EdgeInsets.symmetric(vertical: 10),

    child: Padding(
      padding: const EdgeInsets.all(16),

      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(props['image']),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  props['name'],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  props['email'],
                  style: TextStyle(color: Colors.grey.shade700),
                ),

                const SizedBox(height: 8),

                Text(
                  props['bio'] ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildImageCard(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return showHeroImage(context, props);
}

Widget buildColumn(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: (props['children'] as List)
        .map<Widget>((child) => renderWidget(child))
        .toList(),
  );
}

Widget buildRow(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return Row(
    children: (props['children'] as List)
        .map<Widget>((child) => Expanded(child: renderWidget(child)))
        .toList(),
  );
}

Widget buildContainer(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.all(10),
    color: Colors.blue.shade100,
    child: renderWidget(props['child']),
  );
}

Widget buildMcqsQuestion(
  BuildContext context,
  Map<String, dynamic> props,
  Widget Function(Map<String, dynamic>) renderWidget,
) {
  return McqQuestionCard(mcqData: props);
}
