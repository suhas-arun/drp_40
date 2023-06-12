import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:saveshare/constants/actions.dart';
import 'package:saveshare/constants/buttons.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';

class BreakdownPage extends StatefulWidget {
  const BreakdownPage({super.key, required this.curUser});

  final String curUser;

  @override
  State<BreakdownPage> createState() => _BreakdownPageState();
}

class _BreakdownPageState extends State<BreakdownPage> {
  // Which action we are currently looking at
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold of page
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const TopBar(),
            titleSection(context),
            _actions(),
            actionBreakdown(context),
            const BottomBar(),
          ],
        ));
  }

  Widget actionBreakdown(context) {
    if (selectedIndex == 0) {
      return Expanded(
        child: ListView(children: [
          minutesComparisonCharts(),
          paddedDivider(),
          householdComparisonCharts(),
          paddedDivider(),
          coldShowerBreakdown()
        ]),
      );
    } else if (selectedIndex == 1) {
      return Expanded(child: ListView());
    } else {
      return Expanded(child: ListView());
    }
  }

  Widget paddedDivider() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 25), child: Divider());
  }

  Widget titleSection(context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Title(
            color: APPColour.green,
            child: const Text("Hi Alex, here is your personal breakdown:",
                style: APPText.LARGE_TEXT)));
  }

  _actions() {
    return Container(
      decoration: const BoxDecoration(
          color: APPColour.grey,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      width: double.infinity,
      height: 26,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: <Widget>[
        for (var action in APPActions.actions)
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(2.0),
              height: 20,
              child: TextButton(
                  style: APPButtons.actionButtonStyle(
                      action == APPActions.actions[selectedIndex]),
                  child: Text(action, style: APPText.SMALL_BLACK_TEXT),
                  onPressed: () {
                    setState(() {
                      selectedIndex = APPActions.actions.indexOf(action);
                    });
                  }),
            ),
          ),
      ]),
    );
  }

  Widget coldShowerBreakdown() {
    return Column(children: [coldShowerTitle(), coldShowerChart()]);
  }

  Widget coldShowerTitle() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.only(bottom: 25),
        child: const Text("You have had 1 cold shower this month:",
            style: APPText.MEDIUM_TEXT));
  }

  Widget coldShowerChart() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: PieChart(
          dataMap: const {"Cold": 1, "Hot": 18},
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
          colorList: const [Colors.blueAccent, Colors.redAccent],
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
          totalValue: 19),
    );
  }

  Widget minutesComparisonCharts() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text(
                "This is your average time spent in the shower per day in the last:",
                style: APPText.MEDIUM_TEXT),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: VerticalBarIndicator(
                percent: 0.7,
                header: "5.3 mins",
                animationDuration: const Duration(seconds: 1),
                height: APPSize.REM_HEIGHT(context) / 3 - 80,
                width: 30,
                color: const [
                  Colors.indigo,
                  Colors.teal,
                ],
                footer: 'Week',
              ),
            ),
            Expanded(
              child: VerticalBarIndicator(
                percent: 0.6,
                header: "4.6 mins",
                animationDuration: const Duration(seconds: 1),
                height: APPSize.REM_HEIGHT(context) / 3 - 80,
                width: 30,
                color: const [
                  Colors.indigo,
                  Colors.teal,
                ],
                footer: 'Month',
              ),
            ),
            Expanded(
              child: VerticalBarIndicator(
                percent: 0.65,
                header: "5.0 mins",
                animationDuration: const Duration(seconds: 1),
                height: APPSize.REM_HEIGHT(context) / 3 - 80,
                width: 30,
                color: const [
                  Colors.indigo,
                  Colors.teal,
                ],
                footer: '6 Months',
              ),
            ),
            Expanded(
              child: VerticalBarIndicator(
                percent: 0.5,
                header: "4.2 mins",
                animationDuration: const Duration(seconds: 1),
                height: APPSize.REM_HEIGHT(context) / 3 - 80,
                width: 30,
                color: const [
                  Colors.indigo,
                  Colors.teal,
                ],
                footer: 'Year',
              ),
            ),
          ])
        ]));
  }

  Widget householdComparisonCharts() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: RichText(
            text: const TextSpan(style: APPText.MEDIUM_TEXT, children: [
          TextSpan(text: "On average this month, you have spent "),
          TextSpan(text: "2 minutes longer", style: APPText.BAD_MEDIUM_TEXT),
          TextSpan(text: " in the shower per day than the household average.")
        ])));
  }
}
