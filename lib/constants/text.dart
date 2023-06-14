import 'package:flutter/material.dart';
import 'colour.dart';

class APPText {
  static mediumText(colour) {
    return TextStyle(color: colour, fontSize: 18, fontWeight: FontWeight.w700);
  }

  static smallText(colour) {
    return TextStyle(color: colour, fontSize: 14, fontWeight: FontWeight.w600);
  }

  static const largeGreenText = TextStyle(
      color: APPColour.green, fontSize: 25, fontWeight: FontWeight.w700);

  static const mediumGreenText = TextStyle(
      color: APPColour.green, fontSize: 18, fontWeight: FontWeight.w700);

  static const largeWhiteText =
      TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);

  static const smallBlackText = TextStyle(color: Colors.black, fontSize: 12);

  // Text for indicating improvements
  static const goodText = TextStyle(color: Colors.green);
  static const okText = TextStyle(color: Colors.orange);
  static const badText = TextStyle(color: Colors.red);
  static const goodMediumText = TextStyle(color: Colors.green, fontSize: 18);
  static const okMediumText = TextStyle(color: Colors.orange, fontSize: 18);
  static const badMediumText = TextStyle(color: Colors.red, fontSize: 18);
}
