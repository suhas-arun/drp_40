import 'package:safeshare/components/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../components/bottom_bar.dart';
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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TopBar(),
            Expanded(child: Container()),
            PieChartWidget(),
            Expanded(child: Container()),
            BottomBar(),
          ],
        ));
  }
}
