import 'package:flutter/material.dart';
import '../constants/colour.dart';
import '../user/user.dart';

import '../constants/size.dart';
import '../pages/breakdown_page.dart';

class UserTile extends StatefulWidget {
  const UserTile({super.key});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, num>>>(
        future:
            Future.wait([User_.getShowerDurations(), User_.getLaundryUsages()]),
        builder: (context, AsyncSnapshot<List<Map<String, num>>> snapshot) {
          if (snapshot.hasData) {
            List<User_> users = [];
            var showerMap = snapshot.data![0];
            var laundryMap = snapshot.data![1];
            showerMap.forEach((name, duration) {
              User_ user = User_(
                  name: name,
                  energyPercentage:
                      (duration / User_.householdShowerDuration).toDouble(),
                  laundryPercentage:
                      (laundryMap[name]! / User_.householdLaundryUsage)
                          .toDouble(),
                  profilePicture: User_.getProfilePic(name));
              if (name == User_.curUser) {
                users.insert(0, user);
              } else {
                users.add(user);
              }
            });
            return Expanded(
              child: SizedBox(
                  width: APPSize.WIDTH(context) * 0.9,
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      bool isCurUser = users[index].name == User_.curUser;
                      return Material(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: APPColour.laundryGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            minVerticalPadding: 10,
                            leading: users[index].profilePicture,
                            trailing: isCurUser
                                ? const Icon(Icons.arrow_forward_ios_outlined)
                                : null,
                            title: Text(users[index].name +
                                (isCurUser ? " (You)" : "")),
                            subtitle: Text(
                                "Shower Share: ${(users[index].energyPercentage * 100).toStringAsFixed(1)}%\nLaundry Share: ${(users[index].laundryPercentage * 100).toStringAsFixed(1)}%"),
                            onTap: () {
                              final curUser = User_.curUser;
                              if (curUser == users[index].name) {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BreakdownPage(
                                          curUser: User_.curUser)),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  )),
            );
          } else {
            return Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()));
          }
        });
  }
}
