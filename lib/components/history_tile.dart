import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../models/activity.dart';

class HistoryTile extends StatelessWidget {
  final Activity activity;

  const HistoryTile({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(activity.name), // Use a unique key for each tile
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${activity.name} deleted'),
          ),
        );
        // activities.remove(activity);
      },
      child: ListTile(
        leading: activity.icon,
        title: Text(
          activity.name,
          style: const TextStyle(
            color: APPColour.green,
            fontSize: 24,
            fontWeight: FontWeight.bold, // Added font weight for emphasis
          ),
        ),
        subtitle: Text(
          "${activity.duration.inMinutes} minutes",
          style: const TextStyle(
            color: APPColour.green,
            fontSize: 18,
          ),
        ),
        onTap: () {}, // Added background color with opacity
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              8.0), // Added border radius for rounded corners
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 16.0), // Added padding for content
      ),
    );
  }
}
