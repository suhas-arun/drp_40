import 'package:saveshare/constants/size.dart';
import 'package:saveshare/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../pages/chart_page.dart';
import '../pages/select_action_page.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
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
                const Expanded(
                    child: Text("Home", style: TextStyle(color: Colors.white)))
              ],
            ),
            Column(
              children: [
                IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  iconSize: APPSize.APP_ICON_SIZE,
                  color: Colors.white,
                  icon: const Icon(Icons.lightbulb_outline),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectActionPage()),
                    );
                  },
                ),
                const Expanded(
                    child: Text("Log Action",
                        style: TextStyle(color: Colors.white)))
              ],
            ),
            Column(
              children: [
                IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  iconSize: APPSize.APP_ICON_SIZE,
                  color: Colors.white,
                  icon: const Icon(Icons.bar_chart_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnergyPage()),
                    );
                  },
                ),
                const Expanded(
                    child: Text("Breakdown",
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ],
        ));
  }
}
