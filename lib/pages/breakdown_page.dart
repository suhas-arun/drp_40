import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../user/user.dart';

class BreakdownPage extends StatefulWidget {
  const BreakdownPage({super.key, required this.curUser});

  final String curUser;

  @override
  State<BreakdownPage> createState() => _BreakdownPageState();
}

class _BreakdownPageState extends State<BreakdownPage> {
  @override
  Widget build(BuildContext context) {
    num personalExpenditure = User.demoShowerDurations[User.curUser]!;
    double averageExpenditure =
        User.demoShowerDurations.values.reduce((x, y) => x + y) /
            User.demoShowerDurations.values.length;
    num diff = averageExpenditure - personalExpenditure;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const TopBar(),
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Title(
                    color: APPColour.green,
                    child: const Text("User breakdown",
                        style: APPText.LARGE_TEXT))),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0),
                            child: Text(
                              "Shower",
                              style: APPText.MEDIUM_TEXT,
                            )),
                        Text("Stats:",
                            style: APPText.BREAKDOWN_TEXT(diff, 18.0)),
                        Text(
                            "${personalExpenditure} minutes this week"),
                        Text("Average of ${(personalExpenditure / 7).roundToDouble()} minutes per day"),
                        Text("${diff}% better than household"),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Row(
                          children: [
                            Text("Week Progress:",
                                style: APPText.IMPROVEMENT_TEXT(-1.0, 18.0)),
                            Padding(padding: EdgeInsets.only(right: 58)),
                            Text("Down 1%",
                                style: APPText.IMPROVEMENT_TEXT(-1.0, 18.0))
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Row(
                          children: [
                            Text("Month Progress:",
                                style: APPText.IMPROVEMENT_TEXT(2.0, 18.0)),
                            Padding(padding: EdgeInsets.only(right: 50)),
                            Text("Up 2%",
                                style: APPText.IMPROVEMENT_TEXT(2.0, 18.0))
                          ],
                        )
                      ])
                ])),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
