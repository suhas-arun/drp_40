import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';

import '../components/time_chart.dart';
import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../components/top_bar.dart';
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
      if (i % 4 == 0) {
        String hours = values[i].timestamp.substring(11, 13);
        double consumption = values[i].primaryValue;

        data.add(Data(avg: consumption, y: 0, id: (i ~/ 4), name: hours));
        print(hours);
        print(consumption);
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
            Expanded(child: Container()),
            FutureBuilder(
                future: getEnergyValues(),
                builder: (context, AsyncSnapshot<List<Data>> snapshot) {
                  if (snapshot.hasData) {
                    return TimeGraph(data: snapshot.data!, dataType: 3);
                  } else {
                    return Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator()));
                  }
                }),
            Expanded(child: Container()),
            const PieChartWidget(),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
