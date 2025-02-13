import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);

Future<void> loadThemePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool("isDarkMode") ?? false;
  isDarkModeNotifier.value = isDarkMode;
}

Future<void> saveThemePreference(bool isDarkMode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("isDarkMode", isDarkMode);
}
