import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  //will neeed to be a future but for now just test data
  Map<String, double> getData = {
    "Marcus": 34,
    "Alex": 25,
    "Ella": 17,
    "Ines": 24,
  };

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.4;
    return SizedBox(
      height: size,
      width: size,
      child: PieChart(
        dataMap: getData,
        colorList: [
          Color.fromARGB(255, 13, 78, 21),
          Color.fromARGB(255, 6, 124, 61),
          Colors.green
        ],
      ),
    );
  }
}
