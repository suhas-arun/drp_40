import 'package:saveshare/components/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TopBar(),
            Expanded(child: Container()),
            Row(children: [
              IconButton(
                padding: const EdgeInsets.all(40.0),
                alignment: Alignment.centerLeft,
                iconSize: APPSize.LARGE_ICON_SIZE,
                color: APPColour.green,
                icon: const Icon(Icons.shower_outlined),
                splashRadius: APPSize.LARGE_ICON_SPLASH,
                onPressed: () {},
              ),
              const Text("Log a Shower",
                  style: TextStyle(
                      fontSize: 25,
                      color: APPColour.green,
                      fontWeight: FontWeight.w600))
            ]),
            Expanded(child: Container()),
            BottomBar(),
          ],
        ));
  }
}
