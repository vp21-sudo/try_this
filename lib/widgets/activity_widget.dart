import 'package:flutter/material.dart';
import 'package:try_this/data/classes/activity_class.dart';
import 'package:try_this/data/constant_data.dart';
import 'package:try_this/widgets/activity_icon.dart';

class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.activity,
              style: KTextStyle.titleText,
            ),
            Text(
              activity.description,
              style: KTextStyle.descriptionText,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(getActivityIcon(activity.type)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      activity.type,
                      style: KTextStyle.bodyText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    activity.participants > 1
                        ? Icon(Icons.people)
                        : Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      activity.participants.toString(),
                      style: KTextStyle.bodyText,
                    ),
                  ],
                ),
              ],
            ),
            if (activity.link.isNotEmpty)
              TextButton(
                onPressed: () {
                  // Handle link navigation
                },
                child: const Text('Learn More'),
              ),
          ],
        ),
      ),
    );
  }
}
