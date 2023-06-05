import 'package:flutter/material.dart';

class APPSize {
  static const barHeight = 0.08;
  static const APP_ICON_SIZE = 35.0;
  static const PROFILE_PIC_SIZE = 40.0;
  static double BAR_HEIGHT(context) {
    return MediaQuery.of(context).size.height * barHeight;
  }

  static double REM_HEIGHT(context) {
    return MediaQuery.of(context).size.height * (1 - 2 * barHeight);
  }
}
