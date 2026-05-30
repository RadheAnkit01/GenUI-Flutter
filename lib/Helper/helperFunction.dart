import 'package:flutter/material.dart';

Widget imageDetailsScreen(BuildContext context, Map<String, dynamic> props) {
  return Scaffold(
    appBar: AppBar(
      // foregroundColor: Colors.black,
      backgroundColor: const Color.fromARGB(179, 255, 166, 0),
      title: Text("Full Screen", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    body: Center(
      child: Hero(
        transitionOnUserGestures: false,
        tag: 'image',
        child: Image.network(
          props['url'],
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget showHeroImage(BuildContext context, Map<String, dynamic> props) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => imageDetailsScreen(context, props),
        ),
      );
    },
    child: Hero(
      tag: 'image',
      child: Image.network(
        props['url'],
        height: props['height'].toDouble() ?? 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Color parseColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");

  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }

  return Color(int.parse(hexColor, radix: 16));
}
