import 'package:flutter/material.dart';
import 'package:saveshare/components/history_tile.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/constants/size.dart';
import 'package:saveshare/models/activity.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    //test activities
    List<Activity> activities = Activity.getTestActivities();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TopBar(),
            SizedBox(
                height: APPSize.REM_HEIGHT(context),
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) =>
                      HistoryTile(activity: activities[index]),
                )),
            BottomBar(),
          ],
        ));
  }
}
