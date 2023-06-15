import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../constants/size.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _TopBarState();
}

class _TopBarState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: APPColour.green,
        leading: IconButton(
          alignment: Alignment.centerLeft,
          iconSize: APPSize.APP_ICON_SIZE,
          color: Colors.white,
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: IconButton(
          iconSize: APPSize.APP_ICON_SIZE,
          color: Colors.white,
          icon: const Icon(Icons.energy_savings_leaf_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            iconSize: APPSize.APP_ICON_SIZE,
            color: Colors.white,
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          )
        ]);
  }
}
