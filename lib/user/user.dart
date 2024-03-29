import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saveshare/constants/size.dart';
import 'package:flutter/material.dart';

//will have to implement comparable probably
class User_ {
  User_(
      {required this.name,
      required this.energyPercentage,
      required this.laundryPercentage,
      required this.profilePicture});

  static String curUser = "Alex";

  String name;

  double energyPercentage;

  double laundryPercentage;

  //will have to change this to a picture
  CircleAvatar profilePicture;

  static num householdShowerDuration = 0;

  static num householdLaundryUsage = 0;

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

  // Get laundry breakdown for last month
  static Future<Map<String, num>> getLaundryUsages() async {
    householdLaundryUsage = 0;
    Map<String, num> laundryUsages = {};
    QuerySnapshot<Map> userSnapshot =
        await FirebaseFirestore.instance.collection("user").get();
    for (var userDoc in userSnapshot.docs) {
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;
        String name = userData["name"];
        QuerySnapshot<Map> laundrySnapshot = await FirebaseFirestore.instance
            .collection("user/${userDoc.id}/laundry")
            .get();
        num personalLaundryUsage = 0;
        for (var laundryDoc in laundrySnapshot.docs) {
          if (laundryDoc.exists) {
            var laundryData = laundryDoc.data() as Map<String, dynamic>;
            personalLaundryUsage++;
            householdLaundryUsage++;
            if (!laundryData["airDry"]) {
              personalLaundryUsage++;
              householdLaundryUsage++;
            }
          }
        }
        laundryUsages[name] = personalLaundryUsage;
      }
    }
    return laundryUsages;
  }

  static CircleAvatar getProfilePic(String name) {
    return CircleAvatar(
        radius: 30, backgroundImage: AssetImage("assets/images/$name.jpg"));
  }
}
