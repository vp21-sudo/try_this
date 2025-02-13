import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsOptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const SettingsOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 28),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          // trailing: Icon(Icons.arrow_forward_ios, size: 18),
          onTap: onTap,
        ),
        Divider(
          height: 5.h,
          thickness: 0.3,
          color: Colors.grey,
        ), // Divider for clean separation
      ],
    );
  }
}
