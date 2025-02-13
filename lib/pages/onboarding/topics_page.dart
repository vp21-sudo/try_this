import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopicsPage extends StatefulWidget {
  final String type;
  const TopicsPage({
    super.key,
    this.type = "Continue",
  });

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  List<String> options = [
    "recreational",
    "social",
    "education",
    "relaxation",
    "charity",
    "cooking",
    "diy",
    "music",
    "sports",
    "travel",
    "health",
    "fitness",
    "technology",
    "arts",
    "games",
    "reading",
    "writing",
    "meditation",
  ];
  List<String> selectedOptions = []; // Store selected options

  // save selected topics
  Future<void> _saveSelectedTopics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectedTopics", jsonEncode(selectedOptions));
  }

  Future<void> _loadSelectedTopics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedTopics = prefs.getString("selectedTopics");

    if (storedTopics != null) {
      List<String> loadedTopics = List<String>.from(jsonDecode(storedTopics));

      setState(() {
        selectedOptions = loadedTopics;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSelectedTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What are You Interested In?"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the topics that excite you. The more you choose, the better our recommendations will be.",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Tap to select multiple interests.",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h), // Add spacing
            Expanded(
              // Prevents overflow
              child: Wrap(
                spacing: 8.w, // Horizontal spacing
                runSpacing: 5.h, // Vertical spacing
                children: options.map((option) {
                  return ChoiceChip(
                    label: Text(option),
                    selected: selectedOptions.contains(option),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedOptions.add(option);
                        } else {
                          selectedOptions.remove(option);
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(double.infinity, 50.h), // Full width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  if (selectedOptions.length < 3) {
                    if (!Get.isSnackbarOpen) {
                      Get.snackbar(
                        "Selection Required", // Title
                        "Please select at least three topics",
                        titleText: Text(
                          "Selection Required",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        messageText: Text(
                          "Please select at least three topics",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        icon: Icon(Icons.error, size: 24.sp), // Add icon
                        snackPosition: SnackPosition.TOP,
                        margin: EdgeInsets.only(
                            bottom: 20.h, left: 16.w, right: 16.w),
                        snackStyle: SnackStyle.FLOATING,
                        isDismissible: false,
                        duration: Duration(milliseconds: 1500),
                      );
                    }
                  } else {
                    _saveSelectedTopics();
                    if (widget.type == "Continue") {
                      Get.toNamed("/preferences");
                    } else {
                      Get.back();
                    }
                  }
                },
                child: Text(
                  widget.type,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
