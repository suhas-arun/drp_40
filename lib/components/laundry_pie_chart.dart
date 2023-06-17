import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../constants/size.dart';
import '../user/user.dart';

class LaundryPieChart extends StatefulWidget {
  const LaundryPieChart({super.key});

  @override
  State<LaundryPieChart> createState() => _LaundryPieChartState();
}

class _LaundryPieChartState extends State<LaundryPieChart> {
  // TODO - Currently uses shower data, add laundry data
  @override
  Widget build(BuildContext context) {
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
              height: APPSize.WIDTH(context) * 0.55,
              width: APPSize.WIDTH(context) * 0.55,
              child: PieChart(
                dataMap: getData,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
                colorList: const [
                  Color.fromARGB(255, 6, 25, 81),
                  Color.fromARGB(255, 26, 57, 150),
                  Color.fromARGB(255, 73, 107, 208),
                  Color.fromARGB(255, 126, 150, 220),
                  Color.fromARGB(255, 51, 137, 174),
                  Color.fromARGB(255, 152, 217, 227),
                ],
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        });
  }
}
