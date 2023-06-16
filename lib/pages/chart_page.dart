import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';

import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../components/top_bar.dart';

class EnergyPage extends StatefulWidget {
  const EnergyPage({super.key});

  @override
  State<EnergyPage> createState() => _EnergyPageState();
}

class _EnergyPageState extends State<EnergyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const TopBar(),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Expanded(child: Container()),
            const PieChartWidget(),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
