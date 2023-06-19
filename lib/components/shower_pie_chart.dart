import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../constants/size.dart';
import '../user/user.dart';

class ShowerPieChart extends StatefulWidget {
  const ShowerPieChart({super.key});

  @override
  State<ShowerPieChart> createState() => _ShowerPieChartState();
}

class _ShowerPieChartState extends State<ShowerPieChart> {
  //will neeed to be a future but for now just test data

  @override
  Widget build(BuildContext context) {
    Map<String, double> getData = {};
    return FutureBuilder(
        future: User_.getShowerDurations(),
        builder: (context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            List<User_> users = [];
            snapshot.data!.forEach((name, duration) {
              users.add(User_(
                  name: name,
                  energyPercentage:
                      ((duration / User_.householdShowerDuration) * 100.0),
                  profilePicture: User_.getProfilePic(name)));
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
                  Color.fromARGB(255, 4, 72, 12),
                  Color.fromARGB(255, 18, 105, 28),
                  Color.fromARGB(255, 35, 147, 48),
                  Color.fromARGB(255, 56, 174, 70),
                  Color.fromARGB(255, 102, 215, 115),
                  Color.fromARGB(255, 186, 215, 190),
                ],
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        });
  }
}
