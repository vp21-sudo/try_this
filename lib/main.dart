import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:try_this/data/notifiers.dart';
import 'package:try_this/pages/activities_page.dart';
import 'package:try_this/pages/home_page.dart';
import 'package:try_this/pages/onboarding/preferences_page.dart';
import 'package:try_this/pages/onboarding/topics_page.dart';

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
              initialRoute: '/', // Initial route
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
              ],
            );
          },
        );
      },
    );
  }
}
