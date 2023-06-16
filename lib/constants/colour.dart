import 'dart:ui';

class APPColour {
  static const green = Color.fromARGB(255, 6, 77, 20);

  static const grey = Color.fromARGB(255, 226, 225, 225);

  static const orange = Color.fromRGBO(255, 193, 77, 0.786);

  static actionColour(actionName) {
    if (actionName == "shower") {
      return showerBlue;
    } else if (actionName == "laundry") {
      return laundryGreen;
    } else {
      return heatingRed;
    }
  }

  static const showerBlue = Color.fromRGBO(64, 123, 255, 1);
  static const heatingRed = Color.fromRGBO(255, 114, 94, 1);
  static const laundryGreen = Color.fromRGBO(85, 205, 119, 1);
}
