import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';

import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../components/top_bar.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
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
