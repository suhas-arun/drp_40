import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';
import '../components/time_chart.dart';
import '../data/dummy_data.dart';
import '../model/data.dart';
import '../user/user.dart';

class BreakdownPage extends StatefulWidget {
  const BreakdownPage({super.key, required this.curUser});

  final String curUser;

  @override
  State<BreakdownPage> createState() => _BreakdownPageState();
}

class _BreakdownPageState extends State<BreakdownPage> {
  // Which action we are currently looking at
  int? selectedIndex = 0;

  final List<String> _months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

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
          FutureBuilder(
              future: getShowerData(),
              builder: (context, AsyncSnapshot<List<Data>> snapshot) {
                if (snapshot.hasData) {
                  return TimeGraph(data: snapshot.data!, dataType: 0);
                } else {
                  return const LinearProgressIndicator();
                }
              }),
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
        FutureBuilder(
            future: getLaundryData(),
            builder: (context, AsyncSnapshot<List<Data>> snapshot) {
              if (snapshot.hasData) {
                return TimeGraph(data: snapshot.data!, dataType: 1);
              } else {
                return const LinearProgressIndicator();
              }
            }),
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
        FutureBuilder(
            future: getHeatingData(),
            builder: (context, AsyncSnapshot<List<Data>> snapshot) {
              if (snapshot.hasData) {
                return TimeGraph(data: snapshot.data!, dataType: 2);
              } else {
                return const LinearProgressIndicator();
              }
            }),
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

  // Get breakdown of last 5 months for given action
  Future<List<Data>> get5MonthBreakdown(String action) async {
    List<Data> actionData = [];
    if (action != "shower" && action != "laundry") return actionData;

    const months = 5;
    var now = DateTime.now();
    QuerySnapshot<Map> userSnapshot =
        await FirebaseFirestore.instance.collection("user").get();
    num numUsers = userSnapshot.docs.length;

    for (var i = 0; i < months; i++) {
      num userTotal = 0, userCount = 0, householdTotal = 0, householdCount = 0;
      DateTime startDate = DateTime(now.year, now.month - i);
      DateTime endDate = DateTime(now.year, now.month - i + 1);

      for (var userDoc in userSnapshot.docs) {
        if (userDoc.exists) {
          var userData = userDoc.data() as Map<String, dynamic>;
          String name = userData["name"];
          QuerySnapshot<Map> actionSnapshot;
          actionSnapshot = await FirebaseFirestore.instance
              .collection("user/${userDoc.id}/$action")
              .where("date", isLessThan: endDate)
              .where("date", isGreaterThanOrEqualTo: startDate)
              .get();
          for (var actionDoc in actionSnapshot.docs) {
            if (actionDoc.exists) {
              var actionData = actionDoc.data() as Map<String, dynamic>;

              if (action == "shower") {
                var duration = actionData["duration"];
                householdCount++;
                householdTotal += duration;
                if (name == User.curUser) {
                  userTotal += duration;
                  userCount++;
                }
              } else if (action == "laundry") {
                bool airDry = actionData["airDry"];
                // Add tumble dry usage
                if (!airDry) {
                  if (name == User.curUser) {
                    userCount++;
                  }
                  householdCount++;
                }
                // Add washing machine usage
                if (name == User.curUser) {
                  userCount++;
                }
                householdCount++;
              }
            }
          }
        }
      }

      if (action == "shower") {
        actionData.add(Data(
            id: months - i - 1,
            name: _months[now.month - i - 1],
            y: (userCount == 0) ? 0 : (userTotal / userCount).roundToDouble(),
            avg: (householdCount == 0)
                ? 0
                : (householdTotal / householdCount).roundToDouble()));
      } else {
        actionData.add(Data(
            id: months - i - 1,
            name: _months[now.month - i - 1],
            y: userCount.toDouble(),
            avg: householdCount / numUsers));
      }
    }
    actionData.sort((a, b) => a.id.compareTo(b.id));
    return actionData;
  }

  Future<List<Data>> getShowerData() async {
    return await get5MonthBreakdown("shower");
  }

  Future<List<Data>> getLaundryData() async {
    return await get5MonthBreakdown("laundry");
  }

  Future<List<Data>> getHeatingData() async {
    List<Data> finalHeatingData = [];

    const months = 5;
    var now = DateTime.now();

    for (var i = 0; i < months; i++) {
      DateTime startDate = DateTime(now.year, now.month - i);
      DateTime endDate = DateTime(now.year, now.month - i + 1);
      QuerySnapshot<Map> heatingSnapshot = await FirebaseFirestore.instance
          .collection("heating")
          .where("date", isLessThan: endDate)
          .where("date", isGreaterThanOrEqualTo: startDate)
          .get();
      num tempTotal = 0;
      num tempCount = 0;
      for (var heatingDoc in heatingSnapshot.docs) {
        if (heatingDoc.exists) {
          var heatingData = heatingDoc.data() as Map<String, dynamic>;
          num temp = heatingData["temp"];
          tempTotal += temp;
          tempCount++;
        }
      }
      finalHeatingData.add(Data(
          id: months - i - 1,
          name: _months[now.month - i - 1],
          y: 0,
          avg: (tempCount == 0) ? 0 : (tempTotal / tempCount).toDouble()));
    }
    finalHeatingData.sort((a, b) => a.id.compareTo(b.id));
    return finalHeatingData;
  }
}
