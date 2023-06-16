
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

  static const String curUser = "Alex";

  String name;

  double energyPercentage;

  //will have to change this to a picture
  Icon profilePicture;

  static num householdShowerDuration = 0;

  // How current user's shower duration this month compares to household avg
  static num monthlyHouseholdShowerDiff = 0;

  // How current user's laundry usage this month compares to household avg
  static num monthlyLaundryDiff = 0;

  static num currMonthAvgTemp = 0;

  static num ecoWashes = 0;

  static num normWashes = 0;

  static num airDries = 0;

  static num tumbleDries = 0;

  static Future<Map<String, num>> getShowerDurations() async {
    householdShowerDuration = 0;
    Map<String, num> showerDurations = {};
    QuerySnapshot<Map> userSnapshot =
        await FirebaseFirestore.instance.collection("user").get();

    for (var userDoc in userSnapshot.docs) {
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        String name = userData["name"];
        QuerySnapshot<Map> showerSnapshot = await FirebaseFirestore.instance
            .collection("user/${userDoc.id}/shower")
            .get();
        num personalShowerDuration = 0;
        for (var showerDoc in showerSnapshot.docs) {
          if (showerDoc.exists) {
            var showerData = showerDoc.data() as Map<String, dynamic>;
            var duration = showerData["duration"];
            householdShowerDuration += duration;
            personalShowerDuration += duration;
          }
        }
        showerDurations[name] = personalShowerDuration;
      }
    }
    return showerDurations;
  }
}
