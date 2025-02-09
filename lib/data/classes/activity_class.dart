class Activity {
  final String activity;
  final String description;
  final String type;
  final int participants;
  final String link;
  final String key;

  Activity({
    required this.activity,
    required this.description,
    required this.type,
    required this.participants,
    required this.link,
    required this.key,
  });

  // Factory method to create an Activity from JSON
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
      description: json['description'],
      type: json['type'],
      participants: json['participants'],
      link: json['link'] ?? '',
      key: json['key'],
    );
  }

  // Method to convert an Activity to JSON
  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'description': description,
      'type': type,
      'participants': participants,
      'link': link,
      'key': key,
    };
  }
}

// Sample default data
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
];
