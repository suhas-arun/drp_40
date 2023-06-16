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
  ConsumptionRequest? energyValues;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getGasValues();
  }

  getGasValues() async {
    energyValues = await EnergyService().getData();

    if (energyValues != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const TopBar(),
        drawer: const AppDrawer(),
        body: ListView.builder(itemBuilder: (contex, index) {
          // String time = energyValues![index].name;
          // double val = energyValues![index].y;
          // return Container(child: Text("$time$val"));
        }));
  }
}
