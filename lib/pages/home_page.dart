import 'package:flutter/material.dart';
import 'package:try_this/data/classes/activity_class.dart';
import 'package:try_this/data/fetch/get_activity.dart';
import 'package:try_this/widgets/activity_widget.dart';
import 'package:try_this/widgets/theme_toggle_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Activity>> futureActivites;
  @override
  void initState() {
    super.initState();
    futureActivites = fetchActivites();
  }

  Future<void> _refreshActivities() async {
    // Fetch new data from the API
    List<Activity> newActivities = await fetchActivites();
    // Update the state with the new data
    setState(() {
      futureActivites = Future.value(newActivities);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activites"),
        actions: [ThemeToggleWidget()],
      ),
      body: FutureBuilder(
        future: futureActivites,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              snapshot.error.toString(),
            ));
          } else if (snapshot.hasData) {
            final activities = snapshot.data ?? [];
            return RefreshIndicator(
              onRefresh: _refreshActivities,
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ActivityWidget(activity: activities[index]);
                },
              ),
            );
          } else {
            return Center(child: Text('No activities found.'));
          }
        },
      ),
    );
  }
}
