import 'package:flutter/material.dart';
import 'package:try_this/data/classes/activity_class.dart';
import 'package:try_this/data/constant_data.dart';
import 'package:try_this/widgets/activity_icon.dart';

class ActivityWidget extends StatefulWidget {
  final Activity activity;
  const ActivityWidget({Key? key, required this.activity}) : super(key: key);

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  bool isBookMarked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    widget.activity.activity,
                    style: KTextStyle.titleText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookMarked = !isBookMarked;
                    });
                  },
                  child: isBookMarked
                      ? Icon(Icons.bookmark_add_rounded)
                      : Icon(Icons.bookmark_add_outlined),
                ),
              ],
            ),
            Text(
              widget.activity.description,
              style: KTextStyle.descriptionText,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(getActivityIcon(widget.activity.type)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.activity.type,
                      style: KTextStyle.bodyText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    widget.activity.participants > 1
                        ? Icon(Icons.people)
                        : Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.activity.participants.toString(),
                      style: KTextStyle.bodyText,
                    ),
                  ],
                ),
              ],
            ),
            if (widget.activity.link.isNotEmpty)
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
