//create an activity objects that has a string type and a duration, and an icon
//first a shower that has a duration and uses the shower icon

// Path: lib\models\activity.dart

import 'package:flutter/material.dart';

class Activity {
  Activity({
    required this.name,
    required this.duration,
    required this.icon,
  });

  String name;

  Duration duration;

  Icon icon;

  static List<Activity> getTestActivities() {
    return List.of([
      Activity(
          name: "Shower",
          duration: const Duration(minutes: 8),
          icon: const Icon(
            Icons.shower_outlined,
            color: Colors.green,
            size: 40,
          )),
      Activity(
          name: "Dishwasher",
          duration: const Duration(minutes: 30),
          icon: const Icon(
            Icons.kitchen_outlined,
            color: Colors.green,
            size: 40,
          )),
      Activity(
          name: "Washing Machine",
          duration: const Duration(minutes: 60),
          icon: const Icon(
            Icons.local_laundry_service_outlined,
            color: Colors.green,
            size: 40,
          )),
      Activity(
          name: "Bath",
          duration: const Duration(minutes: 20),
          icon: const Icon(
            Icons.bathtub_outlined,
            color: Colors.green,
            size: 40,
          )),
      Activity(
          name: "Toilet",
          duration: const Duration(minutes: 5),
          icon: const Icon(
            Icons.wc_outlined,
            color: Colors.green,
            size: 40,
          )),
      Activity(
          name: "Brushing Teeth",
          duration: const Duration(minutes: 2),
          icon: const Icon(
            Icons.brush_outlined,
            color: Colors.green,
            size: 40,
          )),
    ]);
  }
}