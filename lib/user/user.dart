import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saveshare/constants/size.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

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

  static const String curUser = "Alex";

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
      for (var doc in querySnapshot.docs) {
        if (doc.exists) {
          var data = doc.data() as Map<String, dynamic>;
          users.add(User(
              name: data["name"],
              energyPercentage: data["energyPercentage"].toDouble()));
        }
      }
    });
    return users;
  }
}
