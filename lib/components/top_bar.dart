import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../constants/size.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  TopBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() => _TopBarState();
}

class _TopBarState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: APPColour.green,
        leading: IconButton(
          alignment: Alignment.centerLeft,
          iconSize: APPSize.APP_ICON_SIZE,
          color: Colors.white,
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {},
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
