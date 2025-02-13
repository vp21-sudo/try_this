import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_this/data/classes/activity_class.dart';
import 'package:http/http.dart' as http;

Future<List<Activity>> fetchActivities() async {
  // Load user preferences from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? selectedTopics =
      prefs.getString("selectedTopics"); // Topics stored as JSON string
  String soloGroup = prefs.getString("soloGroup") ?? "Solo";
  String indoorOutdoor = prefs.getString("indoorOutdoor") ?? "Both";
  String intensity = prefs.getString("intensity") ?? "Relaxing";
  String timeCommitment =
      prefs.getString("timeCommitment") ?? "Short (Under 1 hour)";

  // Convert selected topics JSON string to a List
  List<String> topicsList = selectedTopics != null
      ? List<String>.from(jsonDecode(selectedTopics))
      : [];

  // Convert List to comma-separated string (e.g., "sports,fitness,music")
  String topicsQuery = topicsList.join(",");

  // Construct API URL with query parameters
  // Uri uri =
  //     Uri.parse('http://10.0.2.2:12000/api/no_auth/activity/gemini').replace(
  //   queryParameters: {
  //     "topics": topicsQuery, // Pass selected topics
  //     "soloGroup": soloGroup,
  //     "indoorOutdoor": indoorOutdoor,
  //     "intensity": intensity,
  //     "timeCommitment": timeCommitment,
  //   },
  // );
  Uri uri =
      Uri.parse('https://portfolio.spendings.in/api/no_auth/activity/gemini')
          .replace(
    queryParameters: {
      "topics": topicsQuery, // Pass selected topics
      "soloGroup": soloGroup,
      "indoorOutdoor": indoorOutdoor,
      "intensity": intensity,
      "timeCommitment": timeCommitment,
    },
  );

  // Send HTTP GET request
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> data = jsonResponse['activities'];
    return data.map((json) => Activity.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load activities');
  }
}
