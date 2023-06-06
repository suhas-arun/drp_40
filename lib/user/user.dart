import 'dart:ffi';

import 'package:safeshare/constants/size.dart';
import 'package:flutter/material.dart';

//will have to implement comparable probably
class User {
  User({
    required this.name,
    required this.energyPercentage,
    //will be required
    this.profilePicture = const Icon(
      Icons.person_outline_outlined,
      size: APPSize.PROFILE_PIC_SIZE,
    ),
  });

  String name;

  double energyPercentage;

  //will have to change this to a picture
  Icon profilePicture;

  static List<User> getTestUsers() {
    return List.of([
      User(name: "Marcus!", energyPercentage: (34)),
      User(name: "Alex", energyPercentage: (25)),
      User(name: "Ella", energyPercentage: (17)),
      User(name: "Ines", energyPercentage: (24)),
    ]);
  }
}
