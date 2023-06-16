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
    double titlesize = 50;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 1),
            Container(
              color: APPColour.green,
              height: titlesize,
              child: const Align(
                  alignment: Alignment.center,
                  child: Text("History",
                      style: TextStyle(fontSize: 30, color: Colors.white))),
            ),
            SizedBox(
                height: APPSize.REM_HEIGHT(context) - titlesize - 1,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) =>
                      HistoryTile(activity: activities[index]),
                )),
            const BottomBar(),
          ],
        ));
  }
}
