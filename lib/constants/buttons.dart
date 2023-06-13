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

  static ButtonStyle backButtonStyle(colour) {
    return ElevatedButton.styleFrom(
        backgroundColor: colour,
        elevation: 5.0,
        splashFactory: NoSplash.splashFactory,
        shape: const CircleBorder());
  }

  static Widget backButton(colour, context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: backButtonStyle(colour),
          child: const Icon(Icons.arrow_back_ios_new_outlined)),
    );
  }
}
