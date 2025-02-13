import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_this/data/notifiers.dart';
import 'package:try_this/pages/activities_page.dart';
import 'package:try_this/pages/home_page.dart';
import 'package:try_this/pages/onboarding/preferences_page.dart';
import 'package:try_this/pages/onboarding/topics_page.dart';
import 'package:try_this/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadThemePreference();
  String initialRoute = await getInitialRoute();
  print(initialRoute);
  runApp(MyApp(initialRoute: initialRoute));
}

/// Determine the initial route based on whether topics are selected
Future<String> getInitialRoute() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedSelections = prefs.getString("selectedTopics");

  if (storedSelections != null && jsonDecode(storedSelections).isNotEmpty) {
    return "/activities"; // User has selected topics, go to activities
  } else {
    return "/"; // User hasn't selected topics, start from onboarding
  }
}

class MyApp extends StatefulWidget {
  final String initialRoute;
  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard phone size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDarkMode, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.lightBlue,
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                ),
                useMaterial3: true,
              ),
              initialRoute: widget.initialRoute, // Initial route
              getPages: [
                GetPage(
                  name: '/',
                  page: () => HomePage(),
                  transition: Transition.cupertino, // iOS-style transition
                  transitionDuration:
                      Duration(milliseconds: 400), // Set transition duration
                ), // Home Page
                GetPage(
                  name: '/topics',
                  page: () => TopicsPage(),
                  transition: Transition.cupertino,
                  transitionDuration: Duration(milliseconds: 400),
                ),
                GetPage(
                  name: '/preferences',
                  page: () => PreferencesPage(),
                  transition: Transition.cupertino,
                  transitionDuration: Duration(milliseconds: 400),
                ),
                GetPage(
                  name: '/activities',
                  page: () => ActivitiesPage(),
                  transition: Transition.cupertino,
                  transitionDuration: Duration(milliseconds: 400),
                ),
                GetPage(
                  name: '/settings',
                  page: () => SettingsPage(),
                  transition: Transition.cupertino,
                  transitionDuration: Duration(milliseconds: 400),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
