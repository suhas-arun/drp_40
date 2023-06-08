import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../user/user.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  //will neeed to be a future but for now just test data

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.4;
    Map<String, double> getData = {};
    return FutureBuilder(
        future: User.getTestUsers(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            for (var user in snapshot.data!) {
              getData[user.name] = user.energyPercentage;
            }
            return SizedBox(
              height: size,
              width: size,
              child: PieChart(
                dataMap: getData,
                colorList: const [
                  Color.fromARGB(255, 13, 78, 21),
                  Color.fromARGB(255, 6, 124, 61),
                  Colors.green
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
