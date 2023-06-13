import 'package:flutter/material.dart';

import '../components/top_bar.dart';

class APPSize {
  static const bottomBarHeight = 0.08;
  static const MINI_ICON_SIZE = 15.0;
  static const APP_ICON_SIZE = 35.0;
  static const PROFILE_PIC_SIZE = 40.0;
  static const LARGE_ICON_SIZE = 100.0;
  static const LARGE_ICON_SPLASH = (0.7 * LARGE_ICON_SIZE);

  static double STATUS_BAR_HEIGHT(context) {
    return MediaQuery.of(context).padding.top;
  }

  static double BOTTOM_BAR_HEIGHT(context) {
    return MediaQuery.of(context).size.height * bottomBarHeight;
  }

  static double TOP_BAR_HEIGHT(context) {
    return const TopBar().preferredSize.height;
  }

  static double REM_HEIGHT(context) {
    return MediaQuery.of(context).size.height -
        BOTTOM_BAR_HEIGHT(context) -
        TOP_BAR_HEIGHT(context) -
        STATUS_BAR_HEIGHT(context);
  }
}
