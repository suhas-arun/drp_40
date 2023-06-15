import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/drawer.dart';
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
        appBar: const TopBar(),
        drawer: const AppDrawer(),
        body: Column(
          children: [
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
              padding: EdgeInsets.only(bottom: 20),
              child: Divider(
                thickness: 3.0,
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.only(bottom: 20),
            child: const Text(
                "Lets see how your daily showering minutes have changed over time:",
                style: APPText.mediumGreenText),
          ),
          TimeGraph(
            data: AppData.dummyShowerData,
            dataType: 0,
          ),
          paddedDivider(),
          householdShowerComparison(),
          paddedDivider(),
          coldShowerBreakdown(),
          const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Divider(
                thickness: 3.0,
              )),
        ]),
      );
    } else if (selectedIndex == 1) {
      return Expanded(
          child: ListView(children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Divider(
              thickness: 3.0,
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(bottom: 20),
          child: const Text(
              "This how many times you have used the washing machine and tumble dryer over the past 5 months:",
              style: APPText.mediumGreenText),
        ),
        TimeGraph(data: AppData.dummyLaundryData, dataType: 1),
        paddedDivider(),
        householdLaundryComparison(),
        paddedDivider(),
        ecoWashBreakdown(),
        paddedDivider(),
        airDryBreakdown(),
        const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Divider(
              thickness: 3.0,
            )),
      ]));
    } else {
      return Expanded(
          child: ListView(children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Divider(
              thickness: 3.0,
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(bottom: 20),
          child: const Text(
              "As a house, this is how your average thermostat temperature has changed over time:",
              style: APPText.mediumGreenText),
        ),
        TimeGraph(data: AppData.dummyTempData, dataType: 2),
        paddedDivider(),
        heatingComparison(),
        const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Divider(
              thickness: 3.0,
            )),
      ]));
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
        height: 40,
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)));
  }

  // Cold shower text and chart
  Widget coldShowerBreakdown() {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(bottom: 25),
          child: const Text("You have had 1 cold shower this month:",
              style: APPText.mediumGreenText)),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: PieChart(
            chartRadius: APPSize.WIDTH(context) * 0.4,
            dataMap: const {"Cold": 1, "Hot": 18},
            chartType: ChartType.ring,
            baseChartColor: Colors.grey[50]!.withOpacity(0.15),
            colorList: const [
              Color.fromRGBO(137, 171, 227, 1),
              Color.fromRGBO(234, 115, 141, 1)
            ],
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
            ),
            totalValue: 19),
      )
    ]);
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
                  TextSpan(text: " this month."),
                ])),
          )
        ]));
  }

  // Breakdown of user laundry compared to house average
  Widget householdLaundryComparison() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(style: APPText.mediumGreenText, children: [
                TextSpan(
                    text: "This month, you have used the washing machine "),
                TextSpan(text: "1 more time", style: APPText.okMediumText),
                TextSpan(text: " and the tumble dryer "),
                TextSpan(text: "2 less times", style: APPText.goodMediumText),
                TextSpan(text: " than the rest of your house."),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(style: APPText.mediumGreenText, children: [
                  TextSpan(text: "This can save an extra "),
                  TextSpan(text: "£4", style: APPText.goodMediumText),
                  TextSpan(text: " this month."),
                ])),
          )
        ]));
  }

  // Pie chart of eco - washes
  Widget ecoWashBreakdown() {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(bottom: 25),
          child: const Text("You have done 4 eco-setting washes:",
              style: APPText.mediumGreenText)),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: PieChart(
            chartRadius: APPSize.WIDTH(context) * 0.4,
            dataMap: const {"Eco": 4, "Other": 8},
            chartType: ChartType.ring,
            baseChartColor: Colors.grey[50]!.withOpacity(0.15),
            colorList: const [
              Color.fromRGBO(44, 95, 45, 1),
              Color.fromRGBO(151, 188, 98, 1)
            ],
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
            ),
            totalValue: 12),
      )
    ]);
  }

  // Pie chart of eco - washes
  Widget airDryBreakdown() {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(bottom: 25),
          child: const Text("You have air-dried your clothes 6 times:",
              style: APPText.mediumGreenText)),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(left: 20),
        child: PieChart(
            chartLegendSpacing: 30,
            chartRadius: APPSize.WIDTH(context) * 0.4,
            dataMap: const {"Air-Dry": 6, "Tumble Dry": 6},
            chartType: ChartType.ring,
            baseChartColor: Colors.grey[50]!.withOpacity(0.15),
            colorList: const [
              Color.fromRGBO(0, 83, 156, 1),
              Color.fromRGBO(238, 164, 127, 1)
            ],
            chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true,
            ),
            totalValue: 12),
      )
    ]);
  }

  Widget heatingComparison() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(style: APPText.mediumGreenText, children: [
                TextSpan(text: "On average this month, your house is about "),
                TextSpan(
                    text: "5 \u00B0C higher", style: APPText.badMediumText),
                TextSpan(text: " than the recommended temperature in the UK."),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(style: APPText.mediumGreenText, children: [
                  TextSpan(text: "This can cost an extra "),
                  TextSpan(text: "£30", style: APPText.badMediumText),
                  TextSpan(text: " this month."),
                ])),
          )
        ]));
  }
}
