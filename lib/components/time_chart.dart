import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saveshare/constants/text.dart';

import '../constants/size.dart';
import '../model/data.dart';

class TimeGraph extends StatefulWidget {
  const TimeGraph({super.key, required this.data, required this.dataType});

  final List<Data> data;

  // 0 - Shower, 1 - Laundry, 2 - Heating, 3 - Energy
  final int dataType;

  @override
  State<StatefulWidget> createState() => TimeGraphState();
}

class TimeGraphState extends State<TimeGraph> {
  @override
  Widget build(BuildContext context) {
    final double width;
    if (widget.dataType < 2) {
      width = APPSize.WIDTH(context) * 0.9 / 17;
    } else if (widget.data == 2) {
      width = APPSize.WIDTH(context) * 0.9 / 11;
    } else {
      width = APPSize.WIDTH(context) * 0.9 / 15;
    }

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
        colourCode(youGrad, youColour, houseGrad, houseColour),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        SizedBox(
          width: APPSize.WIDTH(context) * 0.9,
          height: APPSize.WIDTH(context) * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BarChart(
              BarChartData(
                  alignment: BarChartAlignment.center,
                  groupsSpace: width,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (a, b, rod, d) {
                            String toolTip;
                            if (widget.dataType == 0) {
                              double value = rod.toY;
                              toolTip = "$value mins";
                            } else if (widget.dataType == 1) {
                              int value = rod.toY.toInt();
                              toolTip = "$value";
                            } else if (widget.dataType == 2) {
                              int value = rod.toY.toInt();
                              toolTip = "$value\u00B0C";
                            } else {
                              double value = rod.toY;
                              toolTip = "$value kWH";
                            }
                            return BarTooltipItem(
                                toolTip, APPText.smallText(Colors.white));
                          },
                          tooltipBgColor: Colors.grey,
                          tooltipPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5))),
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
                      bottomTitles: AxisTitles(
                          sideTitles: bottomTitles(
                              widget.data.map((d) => d.name).toList())),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      )),
                  barGroups: rods(width, youGrad, houseGrad)),
              swapAnimationDuration: const Duration(seconds: 1),
            ),
          ),
        ),
      ],
    );
  }

  SideTitles bottomTitles(List<String> monthList) {
    return SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) => Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(monthList[value.toInt()]),
            ));
  }

  List<BarChartGroupData> rods(width, youGrad, houseGrad) {
    if (widget.dataType < 2) {
      return widget.data
          .map((data) => BarChartGroupData(x: data.id, barRods: [
                BarChartRodData(
                    toY: data.y,
                    width: width,
                    gradient: youGrad,
                    borderRadius: BorderRadius.circular(5)),
                BarChartRodData(
                    toY: data.avg,
                    width: width,
                    gradient: houseGrad,
                    borderRadius: BorderRadius.circular(5))
              ]))
          .toList();
    } else {
      return widget.data
          .map((data) => BarChartGroupData(x: data.id, barRods: [
                BarChartRodData(
                    toY: data.avg,
                    width: width,
                    gradient: houseGrad,
                    borderRadius: BorderRadius.circular(5))
              ]))
          .toList();
    }
  }

  Widget colourCode(youGrad, youColour, houseGrad, houseColour) {
    if (widget.dataType < 2) {
      return Container(
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
                  Text("You", style: APPText.smallText(youColour)),
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
                  Text("House average", style: APPText.smallText(houseColour)),
                ],
              )
            ],
          ));
    } else {
      return Container(
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
                          gradient: houseGrad,
                          borderRadius: BorderRadius.circular(50))),
                  const Padding(padding: EdgeInsets.only(right: 20)),
                  Text("House average", style: APPText.smallText(houseColour)),
                ],
              )
            ],
          ));
    }
  }
}
