import 'package:flutter/material.dart';
import '../model/drawer_item.dart';

class DrawerItems {
  static const personalBreakdown =
      DrawerItem(title: 'Personal Breakdown', icon: Icon(Icons.bar_chart));
  static const history =
      DrawerItem(title: 'History', icon: Icon(Icons.history));
  static const logOut = DrawerItem(title: 'Log Out', icon: Icon(Icons.logout));

  static final List<DrawerItem> allDrawerItems = [
    personalBreakdown,
    // history,
    logOut
  ];
}
