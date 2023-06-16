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
        future: User.getShowerDurations(),
        builder: (context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            List<User> users = [];
            snapshot.data!.forEach((name, duration) {
              users.add(User(
                  name: name,
                  energyPercentage:
                      ((duration / User.householdShowerDuration) * 100.0)));
            });
            for (var user in users) {
              getData[user.name] = user.energyPercentage.roundToDouble();
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
