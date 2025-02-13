import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesPage extends StatefulWidget {
  final String type;
  const PreferencesPage({
    super.key,
    this.type = "Submit",
  });

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  // State variables for selections
  String soloGroup = "Solo";
  String indoorOutdoor = "Both";
  String intensity = "Relaxing";
  String timeCommitment = "Short (Under 1 hour)";

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      soloGroup = prefs.getString("soloGroup") ?? "Solo";
      indoorOutdoor = prefs.getString("indoorOutdoor") ?? "Both";
      intensity = prefs.getString("intensity") ?? "Relaxing";
      timeCommitment =
          prefs.getString("timeCommitment") ?? "Short (Under 1 hour)";
    });
  }

  Future<void> _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("soloGroup", soloGroup);
    prefs.setString("indoorOutdoor", indoorOutdoor);
    prefs.setString("intensity", intensity);
    prefs.setString("timeCommitment", timeCommitment);
  }

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
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[500]),
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
                    _savePreferences();
                    if (widget.type == "Submit") {
                      Get.offAllNamed("/activities");
                    } else {
                      Get.back();
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
