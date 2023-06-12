import 'package:flutter/material.dart';
import 'colour.dart';

class APPText {
  static const LARGE_TEXT = TextStyle(
      color: APPColour.green, fontSize: 25, fontWeight: FontWeight.w700);

  static const MEDIUM_TEXT = TextStyle(
      color: APPColour.green, fontSize: 18, fontWeight: FontWeight.w700);

  static const LARGE_WHITE_TEXT =
      TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);

  static const SMALL_BLACK_TEXT = TextStyle(color: Colors.black, fontSize: 12);

  // Text for indicating improvements
  static const GOOD_TEXT = TextStyle(color: Colors.green);
  static const OK_TEXT = TextStyle(color: Colors.orange);
  static const BAD_TEXT = TextStyle(color: Colors.red);
  static const GOOD_MEDIUM_TEXT = TextStyle(color: Colors.green, fontSize: 18);
  static const OK_MEDIUM_TEXT = TextStyle(color: Colors.orange, fontSize: 18);
  static const BAD_MEDIUM_TEXT = TextStyle(color: Colors.red, fontSize: 18);

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
