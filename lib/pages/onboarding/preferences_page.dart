import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  // State variables for selections
  String soloGroup = "Solo";
  String indoorOutdoor = "Indoors";
  String intensity = "Relaxing";
  String timeCommitment = "Short (Under 1 hour)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Activity Preferences",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What Kind of Activities Do You Prefer?",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Help us fine-tune your recommendations by telling us your preferred activity style.",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
              ),
              SizedBox(height: 20.h),

              // Solo/Group Preference
              _buildPreferenceSection(
                title:
                    "Do you prefer solo activities or doing things with others?",
                options: ["Solo", "Small Group", "Large Group"],
                selectedValue: soloGroup,
                onChanged: (value) {
                  setState(() {
                    soloGroup = value!;
                  });
                },
              ),

              // Indoor/Outdoor Preference
              _buildPreferenceSection(
                title: "Where do you like to spend your time?",
                options: ["Indoors", "Outdoors", "Both"],
                selectedValue: indoorOutdoor,
                onChanged: (value) {
                  setState(() {
                    indoorOutdoor = value!;
                  });
                },
              ),

              // Intensity Preference
              _buildPreferenceSection(
                title: "How active do you want to be?",
                options: ["Relaxing", "Moderate", "Energetic"],
                selectedValue: intensity,
                onChanged: (value) {
                  setState(() {
                    intensity = value!;
                  });
                },
              ),

              // Time Commitment Preference
              _buildPreferenceSection(
                title:
                    "How much time are you willing to dedicate to activities?",
                options: [
                  "Short (Under 1 hour)",
                  "Medium (1-3 hours)",
                  "Long (3+ hours)"
                ],
                selectedValue: timeCommitment,
                onChanged: (value) {
                  setState(() {
                    timeCommitment = value!;
                  });
                },
              ),

              SizedBox(height: 30.h),

              // Next Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    // Process selections and navigate
                    print("Preferences Selected: ");
                    print("Solo/Group: $soloGroup");
                    print("Indoor/Outdoor: $indoorOutdoor");
                    print("Intensity: $intensity");
                    print("Time Commitment: $timeCommitment");
                    Get.offAllNamed("/activities");
                  },
                  child: Text(
                    "Next",
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
      ),
    );
  }

  /// Build a preference section with radio buttons
  Widget _buildPreferenceSection({
    required String title,
    required List<String> options,
    required String selectedValue,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 10.w,
            children: options.map((option) {
              return ChoiceChip(
                label: Text(option),
                selected: selectedValue == option,
                onSelected: (bool selected) {
                  if (selected) {
                    onChanged(option);
                  }
                },
                selectedColor: Colors.blue.shade100,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
