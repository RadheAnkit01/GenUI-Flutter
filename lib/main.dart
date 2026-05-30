import 'package:flutter/material.dart';
import 'package:gen_ui/Provider/genUI_provider.dart';
import 'package:gen_ui/Screen/home_screen.dart';
import 'package:provider/provider.dart';

//flutter run --dart-define=GEMINI_API_KEY=YOUR_ACTUAL_API_KEY_HERE
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GenUiProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
