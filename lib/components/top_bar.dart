import 'package:drp40/constants/size.dart';
import 'package:flutter/material.dart';

import '../constants/colour.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: APPColour.green,
        height: APPSize.BAR_HEIGHT(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.menu_outlined),
              onPressed: () {},
            ),
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.energy_savings_leaf_outlined),
              onPressed: () {},
            ),
            IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: APPColour.green,
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {},
            ),
          ],
        ));
  }
}
