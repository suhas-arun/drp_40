import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saveshare/constants/text.dart';

import '../constants/size.dart';
import '../data/dummy_data.dart';
import '../model/data.dart';

class ShowerTimeGraph extends StatefulWidget {
  const ShowerTimeGraph({super.key});

  @override
  State<StatefulWidget> createState() => ShowerTimeGraphState();
}

class ShowerTimeGraphState extends State<ShowerTimeGraph> {
  late List<ShowerData> showerData = AppData.dummyData;

  @override
  Widget build(BuildContext context) {
    final double width = APPSize.WIDTH(context) * (0.9 / 17);
    const Color youColour = Colors.indigo;
    const Color houseColour = Color.fromARGB(255, 143, 28, 20);

    const Gradient youGrad = LinearGradient(
      colors: [
        youColour,
        Colors.teal,
      ],
    );

    const Gradient houseGrad = LinearGradient(
      colors: [
        houseColour,
        Color.fromARGB(255, 174, 9, 176),
      ],
    );

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.only(bottom: 20),
          child: const Text(
              "Lets see how your daily showering minutes have changed over time:",
              style: APPText.mediumGreenText),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            gradient: youGrad,
                            borderRadius: BorderRadius.circular(50))),
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    Text("Your average", style: APPText.smallText(youColour)),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                Row(
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            gradient: houseGrad,
                            borderRadius: BorderRadius.circular(50))),
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    Text("House average",
                        style: APPText.smallText(houseColour)),
                  ],
                )
              ],
            )),
        SizedBox(
          width: APPSize.WIDTH(context) * 0.9,
          height: APPSize.WIDTH(context) * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BarChart(
              BarChartData(
                  alignment: BarChartAlignment.center,
                  //maxY: 20,
                  groupsSpace: width,
                  barTouchData: BarTouchData(),
                  borderData: FlBorderData(border: const Border()),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(sideTitles: bottomTitles()),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      )),
                  barGroups: showerData
                      .map((data) => BarChartGroupData(x: data.id, barRods: [
                            BarChartRodData(
                                toY: data.y,
                                width: width,
                                gradient: youGrad,
                                //color: APPColour.showerBlue,
                                borderRadius: BorderRadius.circular(5)),
                            BarChartRodData(
                                toY: data.avg,
                                width: width,
                                gradient: houseGrad,
                                borderRadius: BorderRadius.circular(5))
                          ]))
                      .toList()),
              swapAnimationDuration: const Duration(seconds: 1),
            ),
          ),
        ),
      ],
    );
  }

  BarTooltipItem generateToolTip(BarChartRodData group) {
    final double value = group.toY;
    return BarTooltipItem("$value mins", const TextStyle());
  }

  SideTitles bottomTitles() {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May'];
    return SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) => Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(titles[value.toInt()]),
            ));
  }
}