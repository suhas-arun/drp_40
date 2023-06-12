import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';

class APPButtons {
  static ButtonStyle actionButtonStyle(selected) {
    return TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: selected ? Colors.white : APPColour.grey,
        padding: const EdgeInsets.all(2.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))));
  }
}
