import 'package:flutter/material.dart';
import 'package:try_this/data/notifiers.dart';

class ThemeToggleWidget extends StatefulWidget {
  const ThemeToggleWidget({super.key});

  @override
  State<ThemeToggleWidget> createState() => _ThemeToggleWidgetState();
}

class _ThemeToggleWidgetState extends State<ThemeToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isDarkModeNotifier.value = !isDarkModeNotifier.value;
          });
        },
        icon: isDarkModeNotifier.value
            ? Icon(Icons.dark_mode)
            : Icon(Icons.light_mode));
  }
}
