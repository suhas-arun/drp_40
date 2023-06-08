import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saveshare/constants/size.dart';
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

  static Future<List<User>> getTestUsers() async {
    List<User> userList = List.empty();
    QuerySnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection("user").get();
    for (var doc in userSnapshot.docs) {
      Map<String, dynamic> user = doc.data();
      print(user);
      // userList.add(
      //     User(name: user["name"], energyPercentage: user["energyPercentage"]));
    }
    // TODO: FIX SO ADD TO LIST DOESN'T HANG.
    return List.of([
      User(name: "Marcus", energyPercentage: (34)),
      User(name: "Alex", energyPercentage: (25)),
      User(name: "Ella", energyPercentage: (17)),
      User(name: "Ines", energyPercentage: (24)),
    ]);
  }
}
