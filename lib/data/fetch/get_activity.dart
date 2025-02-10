import 'dart:convert';

import 'package:try_this/data/classes/activity_class.dart';
import 'package:http/http.dart' as http;

Future<List<Activity>> fetchActivites() async {
  final response = await http.get(
    // Uri.parse('http://10.0.2.2:12000/api/no_auth/activity/gemini'), // local dev
    Uri.parse(
        'https://portfolio.spendings.in/api/no_auth/activity/gemini'), // local dev
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> data = jsonResponse['activities'];
    return data.map((json) => Activity.fromJson(json)).toList();
  } else {
    print(response);
    throw Exception('failed to load activities');
  }
}
