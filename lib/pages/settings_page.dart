import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_this/pages/onboarding/preferences_page.dart';
import 'package:try_this/pages/onboarding/topics_page.dart';
import 'package:try_this/widgets/settings_option_widget.dart';
import 'package:try_this/widgets/theme_toggle_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  /// Clears stored data and logs out the user
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear stored data
    Get.offAllNamed("/"); // Navigate to home (restart onboarding)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        actions: [
          ThemeToggleWidget(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SettingsOptionWidget(
                      title: "Update Topics",
                      icon: Icons.category_rounded,
                      onTap: () => Get.to(() => TopicsPage(type: "Update"),
                          transition: Transition.cupertino,
                          duration: Duration(milliseconds: 400)),
                    ),
                    SettingsOptionWidget(
                      title: "Update Preferences",
                      icon: Icons.data_usage_sharp,
                      onTap: () => Get.to(() => PreferencesPage(type: "Update"),
                          transition: Transition.cupertino,
                          duration: Duration(milliseconds: 400)),
                    ),
                    SettingsOptionWidget(
                      title: "About",
                      icon: Icons.info_outline,
                      onTap: () => Get.snackbar("App Info", "Try This v1.0.2",
                          snackPosition: SnackPosition.TOP),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    children: [
                      SettingsOptionWidget(
                        title: "Logout",
                        icon: Icons.exit_to_app,
                        onTap: () async {
                          bool confirm = await _showLogoutDialog(context);
                          if (confirm) _logout();
                        },
                      ),
                      Text(
                        "App Version: v1.0.2",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Show a logout confirmation dialog
  Future<bool> _showLogoutDialog(BuildContext context) async {
    return await Get.defaultDialog(
      title: "Confirm Logout",
      middleText: "Are you sure you want to log out?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () => Get.back(result: true),
      onCancel: () => Get.back(result: false),
      barrierDismissible: false,
    );
  }
}
