import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';

class BreakdownPage extends StatefulWidget {
  const BreakdownPage({super.key, required this.curUser});

  final String curUser;

  @override
  State<BreakdownPage> createState() => _BreakdownPageState();
}

class _BreakdownPageState extends State<BreakdownPage> {
  @override
  Widget build(BuildContext context) {
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
            Padding(
                padding: EdgeInsets.symmetric(vertical: 80, horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shower:", style: APPText.BREAKDOWN_TEXT(7.0)),
                    Text("40 minutes this month"),
                    Text("Average of 4 minutes per day"),
                    Text("About 10% better than household")
                  ],
                )),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
