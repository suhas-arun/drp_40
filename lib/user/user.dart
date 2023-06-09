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

  //get users from firestore collection users
  static Future<List<User>> getTestUsers() async {
    List<User> users = [];
    await FirebaseFirestore.instance
        .collection("user")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          var data = doc.data() as Map<String, dynamic>;
          // ! Suhas check here because the problem is after marcus it's
          // ! hanging. This is usually because there is either a typo or an entry missing a value
          // ! or something, cause you can see here that using a fixed value works
          if (data["name"] != null && data["energyPercentage"] != null) {
            users.add(User(name: data["name"], energyPercentage: 25));
          }
        }
      });
    });
    return users;
  }
}
