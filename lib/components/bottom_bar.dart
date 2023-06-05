import 'package:drp40/constants/size.dart';
import 'package:drp40/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../pages/chart_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: APPColour.green,
        height: APPSize.BAR_HEIGHT(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.lightbulb_outline),
              onPressed: () {},
            ),
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.bar_chart_outlined),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartPage()),
                );
              },
            ),
          ],
        ));
  }
}
