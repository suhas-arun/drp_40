import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';

import '../constants/size.dart';
import '../constants/text.dart';
import '../data/drawer_items.dart';
import '../user/user.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: APPSize.WIDTH(context) * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: APPColour.green),
                child: ListTile(
                  leading: User.curUser.profilePicture,
                  title: Text("Hi ${User.curUser.name}",
                      style: APPText.mediumText(Colors.white)),
                )),
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
