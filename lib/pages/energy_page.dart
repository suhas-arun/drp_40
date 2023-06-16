import 'package:flutter/material.dart';
import 'package:saveshare/model/consumption_request.dart';
import 'package:saveshare/services/energy_service.dart';

import '../components/drawer.dart';
import '../components/top_bar.dart';
import '../model/data.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({super.key});

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  late ConsumptionRequest energyValues;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getEnergyValues();
  }

  getEnergyValues() async {
    energyValues = await EnergyService().getData();

    setState(() {
      isLoaded = true;
    });
  }

  List<Data> convertConsToData(ConsumptionRequest consumptionRequest) {
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
        body: ListView.builder(itemBuilder: (contex, index) {
          convertConsToData(energyValues);
          return null;
          // String time = energyValues![index].name;
          // double val = energyValues![index].y;
          // return Container(child: Text("$time$val"));
        }));
  }
}
