import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/pages/breakdown_page.dart';
import 'package:saveshare/pages/history_page.dart';

import '../constants/size.dart';
import '../constants/text.dart';
import '../data/drawer_items.dart';
import '../pages/login_page.dart';
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
                  leading: User_.getProfilePic(User_.curUser),
                  title: Text("Hi ${User_.curUser}",
                      style: APPText.mediumText(Colors.white)),
                )),
            buildDrawerItems(context)
          ],
        ));
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
        children: DrawerItems.allDrawerItems
            .map(
              (item) => ListTile(
                leading: item.icon,
                title: Text(item.title),
                onTap: () {
                  if (item.title == "History") {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryPage()));
                  } else if (item.title == "Personal Breakdown") {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BreakdownPage(curUser: User_.curUser)),
                    );
                  } else if (item.title == "Log Out") {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }
                },
              ),
            )
            .toList());
  }
}
