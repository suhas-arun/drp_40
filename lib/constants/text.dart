import 'package:flutter/material.dart';
import 'colour.dart';

class APPText {
  static const LARGE_TEXT = TextStyle(
      color: APPColour.green, fontSize: 25, fontWeight: FontWeight.w700);

  static const MEDIUM_TEXT = TextStyle(
      color: APPColour.green, fontSize: 18, fontWeight: FontWeight.w700);

  static const LARGE_WHITE_TEXT =
      TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);

  static BREAKDOWN_TEXT(score, size) {
    Color color;
    if (score > 5.0) {
      color = Colors.green;
    } else if (score < -5.0) {
      color = Colors.red;
    } else {
      color = Colors.orange;
    }

    return TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w500);
  }

  static IMPROVEMENT_TEXT(score, size) {
    Color color;
    if (score >= 0.0) {
      color = Colors.green;
    } else if (score < -5.0) {
      color = Colors.red;
    } else {
      color = Colors.orange;
    }

    return TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w500);
  }
}
