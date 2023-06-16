import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';

import '../components/time_chart.dart';
import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../components/top_bar.dart';
import '../constants/text.dart';
import '../model/consumption_request.dart';
import '../model/data.dart';
import '../services/energy_service.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({super.key});

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  Future<List<Data>> getEnergyValues() async {
    ConsumptionRequest consumptionRequest = await EnergyService().getData();

    List<Value> values = consumptionRequest.devices[0].values;
    List<Data> data = [];

    for (int i = 0; i < values.length; i++) {
      if (i % 8 == 0) {
        String hours = "${values[i].timestamp.substring(11, 13)}:00";
        double consumption = values[i].primaryValue;

        data.add(Data(avg: consumption, y: 0, id: (i ~/ 8), name: hours));
      }
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TopBar(),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.only(bottom: 20, top: 30),
                child: const Text(
                    "This is your real-time readings from your smart meter over the last 24 hours:",
                    style: APPText.mediumGreenText),
              ),
              FutureBuilder(
                  future: getEnergyValues(),
                  builder: (context, AsyncSnapshot<List<Data>> snapshot) {
                    if (snapshot.hasData) {
                      return TimeGraph(data: snapshot.data!, dataType: 3);
                    } else {
                      return const LinearProgressIndicator();
                    }
                  }),
              paddedDivider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.only(bottom: 20, top: 30),
                child: const Text(
                    "Lets see how your house members compare to each other in terms of showering minutes",
                    style: APPText.mediumGreenText),
              ),
              const PieChartWidget(),
              const Padding(padding: EdgeInsets.only(bottom: 30))
            ]),
          ),
          const BottomBar(),
        ],
      ),
    );
  }

  // Divides the list view sections
  Widget paddedDivider() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 45),
        child: Divider(thickness: 3.0));
  }
}
