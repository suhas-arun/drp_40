import 'package:flutter/material.dart';
import 'package:saveshare/constants/buttons.dart';
import 'package:saveshare/constants/colour.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';

class LogPage extends StatefulWidget {
  final String actionName;

  const LogPage({super.key, required this.actionName});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const TopBar(),
            topSection(widget.actionName),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }

  Widget topSection(String actionName) {
    return SizedBox(
        width: APPSize.WIDTH(context),
        height: APPSize.REM_HEIGHT(context) * 0.4,
        child: Stack(children: [
          Positioned(
              top: 20,
              left: 10,
              child: APPButtons.backButton(
                  APPColour.actionColour(actionName), context))
        ]));
  }
}
