import 'package:flutter/material.dart';
import 'package:try_this/data/notifiers.dart';
import 'package:try_this/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
            useMaterial3:
                true, // Set to false if you prefer Material 2 behavior
          ),
          home: HomePage(),
        );
      },
    );
  }
}
