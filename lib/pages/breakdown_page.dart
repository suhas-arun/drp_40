import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import 'package:saveshare/constants/text.dart';
import 'package:saveshare/constants/actions.dart';
import 'package:saveshare/constants/buttons.dart';
import 'package:saveshare/constants/colour.dart';

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

  // Tailored breakdowns for each action
  Widget actionBreakdown(context) {
    if (selectedIndex == 0) {
      return Expanded(
        child: ListView(children: [
          minutesComparisonCharts(),
          paddedDivider(),
          householdComparison(),
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

  // Divides the list view sections
  Widget paddedDivider() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 25), child: Divider());
  }

  // Title for the page
  Widget titleSection(context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Title(
            color: APPColour.green,
            child: const Text("Hi Alex, here is your personal breakdown",
                style: APPText.largeGreenText)));
  }

  // To select which breakdown to view
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
                  child: Text(action, style: APPText.smallBlackText),
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

  // Cold shower text and chart
  Widget coldShowerBreakdown() {
    return Column(children: [coldShowerTitle(), coldShowerChart()]);
  }

  // Title of cold shower stats
  Widget coldShowerTitle() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.only(bottom: 25),
        child: const Text("You have had 1 cold shower this month:",
            style: APPText.mediumGreenText));
  }

  // Pie chart of cold showers
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

  // Charts to compare the time spent in the shower over time
  Widget minutesComparisonCharts() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text(
                "This is your average time spent in the shower per day in the last:",
                style: APPText.mediumGreenText),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            timeInShowerBar(5.3, "Week"),
            timeInShowerBar(7.4, "Month"),
            timeInShowerBar(6.8, "6 Months"),
            timeInShowerBar(7.5, "Year"),
          ])
        ]));
  }

  Widget timeInShowerBar(minutes, footer) {
    return Expanded(
      child: VerticalBarIndicator(
        percent: minutes / 10,
        header: "$minutes mins",
        animationDuration: const Duration(seconds: 1),
        height: APPSize.REM_HEIGHT(context) / 3 - 80,
        width: 30,
        color: const [
          Colors.indigo,
          Colors.teal,
        ],
        footer: footer,
      ),
    );
  }

  // Breakdown of user compared to house average
  Widget householdComparison() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          RichText(
              text: const TextSpan(style: APPText.mediumGreenText, children: [
            TextSpan(text: "On average this month, you have spent "),
            TextSpan(text: "2 minutes longer", style: APPText.badMediumText),
            TextSpan(
                text: " in the shower per day than the household average."),
          ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
                text: const TextSpan(style: APPText.mediumGreenText, children: [
              TextSpan(text: "This can cost an extra "),
              TextSpan(text: "£17", style: APPText.badMediumText),
              TextSpan(text: " per month."),
            ])),
          )
        ]));
  }
}
