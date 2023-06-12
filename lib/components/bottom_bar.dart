import 'package:saveshare/constants/size.dart';
import 'package:saveshare/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../pages/chart_page.dart';
import '../pages/log_page.dart';

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
        height: APPSize.BOTTOM_BAR_HEIGHT(context),
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.lightbulb_outline),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogPage()),
                );
              },
            ),
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.bar_chart_outlined),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChartPage()),
                );
              },
            ),
          ],
        ));
  }
}
