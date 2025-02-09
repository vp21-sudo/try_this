import 'package:flutter/material.dart';
import 'package:try_this/data/classes/activity_class.dart';
import 'package:try_this/widgets/activity_widget.dart';
import 'package:try_this/widgets/theme_toggle_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Activity> defaultActivities = [
    Activity(
      activity: "Read a science fiction novel",
      description:
          "Immerse yourself in futuristic worlds and imaginative narratives by reading a captivating science fiction novel.",
      type: "recreational",
      participants: 1,
      link: "",
      key: "1234567",
    ),
    Activity(
      activity: "Take a cooking class",
      description:
          "Enhance your culinary skills by enrolling in a cooking class that teaches new recipes and techniques.",
      type: "education",
      participants: 1,
      link: "",
      key: "2345678",
    ),
    Activity(
      activity: "Go for a hike in a nearby park",
      description:
          "Enjoy the beauty of nature and get some exercise by hiking through local park trails.",
      type: "recreational",
      participants: 1,
      link: "",
      key: "3456789",
    ),
    Activity(
      activity: "Learn the basics of photography",
      description:
          "Discover the art of capturing moments by learning fundamental photography skills.",
      type: "education",
      participants: 1,
      link: "",
      key: "4567890",
    ),
    Activity(
      activity: "Visit a local museum",
      description:
          "Explore exhibits and gain knowledge about art, history, or science at a nearby museum.",
      type: "recreational",
      participants: 1,
      link: "",
      key: "5678901",
    ),
    Activity(
      activity: "Participate in a group art class",
      description:
          "Collaborate with others to create art pieces, fostering creativity and teamwork.",
      type: "recreational",
      participants: 4,
      link: "",
      key: "6789012",
    ),
    Activity(
      activity: "Join a team-building scavenger hunt",
      description:
          "Work together to find items or complete challenges in a fun and engaging scavenger hunt.",
      type: "recreational",
      participants: 5,
      link: "",
      key: "7890123",
    ),
    Activity(
      activity: "Attend a group dance workshop",
      description:
          "Learn new dance moves and routines in a lively group setting, promoting physical activity and social interaction.",
      type: "recreational",
      participants: 10,
      link: "",
      key: "8901234",
    ),
    Activity(
      activity: "Organize a team sports game",
      description:
          "Gather friends or colleagues for a friendly game of soccer, basketball, or another team sport.",
      type: "recreational",
      participants: 10,
      link: "",
      key: "9012345",
    ),
    Activity(
      activity: "Participate in a group cooking challenge",
      description:
          "Form teams to cook dishes based on specific themes or ingredients, encouraging creativity and collaboration.",
      type: "education",
      participants: 6,
      link: "",
      key: "0123456",
    ),
  ];

  @override
  void initState() {
    defaultActivities.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activites"),
        actions: [ThemeToggleWidget()],
      ),
      body: ListView.builder(
        itemCount: defaultActivities.length,
        itemBuilder: (context, index) {
          return ActivityWidget(activity: defaultActivities[index]);
        },
      ),
    );
  }
}
