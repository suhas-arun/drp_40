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
        height: APPSize.REM_HEIGHT(context) * 0.5,
        child: Stack(children: [
          Positioned(
              top: 20,
              left: 10,
              child: APPButtons.backButton(
                  APPColour.actionColour(actionName), context)),
          Positioned(
            top: APPSize.REM_HEIGHT(context) * 0.05,
            left: APPSize.WIDTH(context) * 0.15,
            child: Card(
                elevation: 0,
                color: Colors.transparent,
                //shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                    height: APPSize.WIDTH(context) * 0.7,
                    width: APPSize.WIDTH(context) * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/$actionName.png'))))),
          ),
        ]));
  }
}
