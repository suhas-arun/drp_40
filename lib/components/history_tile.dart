import 'package:flutter/material.dart';

import '../constants/colour.dart';
import '../constants/size.dart';
import '../models/activity.dart';
import '../user/user.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Icon(
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
          style: TextStyle(
            color: APPColour.green,
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          activity.duration.inMinutes.toString() + " minutes",
          style: TextStyle(
            color: APPColour.green,
            fontSize: 18,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
