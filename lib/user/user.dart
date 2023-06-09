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

  static num householdShowerDuration = 0;

  static Map<String, num> demoShowerDurations =
      Map.of({"Marcus": 25, "Alex": 15, "Ella": 6, "Ines": 12});

  static Future<Map<String, num>> getShowerDurations() async {
    householdShowerDuration = 0;
    Map<String, num> showerDurations = {};
    await FirebaseFirestore.instance
        .collection("user")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc.exists) {
          var data = doc.data() as Map<String, dynamic>;
          String name = data["name"];
          FirebaseFirestore.instance
              .collection("user/${doc.id}/shower")
              .get()
              .then((QuerySnapshot showerQuerySnapshot) {
            num personalShowerDuration = 0;
            for (var showerDoc in showerQuerySnapshot.docs) {
              if (showerDoc.exists) {
                var showerData = showerDoc.data() as Map<String, dynamic>;
                var duration = showerData["duration"];
                householdShowerDuration += duration;
                personalShowerDuration += duration;
              }
            }
            showerDurations[name] = personalShowerDuration;
          });
        }
      }
      return showerDurations;
    });
    householdShowerDuration =
        demoShowerDurations.values.reduce((x, y) => x + y);
    return demoShowerDurations;
  }
}
