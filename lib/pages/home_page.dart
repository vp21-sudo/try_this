import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to Try This! Discover Activities Personalised Just for You",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Image.asset(
                    "assets/images/onboard1.webp",
                    fit: BoxFit.cover,
                    height: 390.h,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Tell us a little about yourself, and we'll suggest activities you'll love.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(
                        double.infinity, 50.h), // Full width, responsive height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.r), // Less rounded corners
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed("/topics");
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
