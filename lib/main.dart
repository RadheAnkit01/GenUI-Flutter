import 'package:flutter/material.dart';
import 'package:gen_ui/Data/App/app_theme.dart';
import 'package:gen_ui/Provider/genUI_provider.dart';
import 'package:gen_ui/Provider/theme_provider.dart';
import 'package:gen_ui/Screen/home_screen.dart';
import 'package:provider/provider.dart';

//flutter run --dart-define=GEMINI_API_KEY=YOUR_ACTUAL_API_KEY_HERE
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GenUiProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
