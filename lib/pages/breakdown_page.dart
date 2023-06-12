import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:saveshare/constants/actions.dart';
import 'package:saveshare/constants/buttons.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/constants/size.dart';
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
            Expanded(child: Container(child: actionBreakdown(context))),
            const BottomBar(),
          ],
        ));
  }

  Widget actionBreakdown(context) {
    if (selectedIndex == 0) {
      return Column(children: [showerStats(), coldShowerBreakdown()]);
    } else if (selectedIndex == 1) {
      return Column(children: []);
    } else {
      return Column(children: []);
    }
  }

  Widget titleSection(context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Title(
            color: APPColour.green,
            child: const Text("Your breakdown", style: APPText.LARGE_TEXT)));
  }

  _actions() {
    return Container(
      decoration: const BoxDecoration(
          color: APPColour.grey,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      width: double.infinity,
      height: 26,
      margin: const EdgeInsets.all(10),
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

  Widget showerStats() {
    return Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Text("This week", style: APPText.MEDIUM_TEXT),
              Expanded(child: Container())
            ]),
            Row(children: [
              const Text("Your daily average"),
              Expanded(child: Container()),
              const Text("4 minutes")
            ]),
            Row(children: [
              const Text("House daily average"),
              Expanded(child: Container()),
              const Text("6 minutes")
            ]),
            Row(children: [
              const Text("Compared to house average"),
              Expanded(child: Container()),
              const Text("2 minutes less", style: APPText.GOOD_TEXT)
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(children: [
                const Text("This Month", style: APPText.MEDIUM_TEXT),
                Expanded(child: Container()),
              ]),
            ),
            Row(children: [
              const Text("Your daily average"),
              Expanded(child: Container()),
              const Text("6")
            ]),
            Row(children: [
              const Text("House daily average"),
              Expanded(child: Container()),
              const Text("5")
            ]),
            Row(children: [
              const Text("Compared to house average"),
              Expanded(child: Container()),
              const Text("1 minute longer", style: APPText.OK_TEXT)
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(children: [
                const Text("Your Average", style: APPText.MEDIUM_TEXT),
                Expanded(child: Container()),
              ]),
            ),
            Row(children: [
              const Text("Your daily average"),
              Expanded(child: Container()),
              const Text("5 minutes")
            ]),
            Row(children: [
              const Text("House daily average"),
              Expanded(child: Container()),
              const Text("5 minutes")
            ]),
            Row(children: [
              const Text("Compared to house average"),
              Expanded(child: Container()),
              const Text("0 minutes longer", style: APPText.OK_TEXT)
            ])
          ],
        ));
  }

  Widget coldShowerBreakdown() {
    return SizedBox(
        child: Column(children: [coldShowerTitle, coldShowerChart]));
  }

  Widget coldShowerTitle = Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 25),
      child: const Text("Cold Showers", style: APPText.MEDIUM_TEXT));

  Widget coldShowerChart = Container(
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
