import 'package:flutter/material.dart';
import 'colour.dart';

class APPText {
  static const LARGE_TEXT = TextStyle(
      color: APPColour.green, fontSize: 25, fontWeight: FontWeight.w700);

  static const LARGE_WHITE_TEXT =
      TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);

  static BREAKDOWN_TEXT(score) {
    Color color;
    if (score > 5.0) {
      color = Colors.green;
    } else if (score < 5.0) {
      color = Colors.red;
    } else {
      color = Colors.orange;
    }

    return TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w500);
  }
}
