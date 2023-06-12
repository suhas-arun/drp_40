import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';

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
            const TopBar(),
            Expanded(child: Container()),
            const PieChartWidget(),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
