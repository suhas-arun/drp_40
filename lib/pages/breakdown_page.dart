import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';
import '../components/time_chart.dart';
import '../data/dummy_data.dart';

class BreakdownPage extends StatefulWidget {
  const BreakdownPage({super.key, required this.curUser});

  final String curUser;

  @override
  State<BreakdownPage> createState() => _BreakdownPageState();
}

class _BreakdownPageState extends State<BreakdownPage> {
  // Which action we are currently looking at
  int? selectedIndex = 0;

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
          const Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: Divider(
                thickness: 3.0,
              )),
          TimeGraph(data: AppData.dummyShowerData),
          paddedDivider(),
          householdShowerComparison(),
          paddedDivider(),
          coldShowerBreakdown(),
          const Padding(
              padding: EdgeInsets.only(top: 45),
              child: Divider(
                thickness: 3.0,
              )),
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
        padding: EdgeInsets.symmetric(vertical: 45),
        child: Divider(thickness: 3.0));
  }

  // Title for the page
  Widget titleSection(context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: const Text(
          "Hi Alex, here is your personal breakdown",
          style: APPText.largeGreenText,
          textAlign: TextAlign.start,
        ));
  }

  // To select which breakdown to view
  _actions() {
    return Container(
        height: 50,
        width: APPSize.WIDTH(context),
        alignment: Alignment.center,
        child: CupertinoSlidingSegmentedControl<int>(
            groupValue: selectedIndex,
            onValueChanged: (groupValue) {
              setState(() {
                selectedIndex = groupValue;
              });
            },
            children: {
              0: buildSegment('Shower'),
              1: buildSegment('Laundry'),
              2: buildSegment('Heating')
            }));
  }

  Widget buildSegment(String label) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)));
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

  // Breakdown of user compared to house average
  Widget householdShowerComparison() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(style: APPText.mediumGreenText, children: [
                TextSpan(text: "On average this month, you have spent "),
                TextSpan(
                    text: "2 minutes longer", style: APPText.badMediumText),
                TextSpan(
                    text:
                        " in the shower per day than the rest of your house."),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(style: APPText.mediumGreenText, children: [
                  TextSpan(text: "This can cost an extra "),
                  TextSpan(text: "£17", style: APPText.badMediumText),
                  TextSpan(text: " per month."),
                ])),
          )
        ]));
  }

  Widget showerOverTimeGraph() {
    return Container();
  }
}
