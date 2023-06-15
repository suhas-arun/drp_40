import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';

import '../data/drawer_items.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(color: APPColour.green),
            child: Text("Hi Alex")),
        buildDrawerItems()
      ],
    ));
  }

  Widget buildDrawerItems() {
    return Column(
        children: DrawerItems.allDrawerItems
            .map(
                (item) => ListTile(leading: item.icon, title: Text(item.title)))
            .toList());
  }
}
