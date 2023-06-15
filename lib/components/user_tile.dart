import 'package:flutter/material.dart';
import '../constants/colour.dart';
import '../user/user.dart';

import '../constants/size.dart';
import '../pages/breakdown_page.dart';

//this will need to be stateful, and take in
class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: User.getShowerDurations(),
        builder: (context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            List<User> users = [];
            snapshot.data!.forEach((name, duration) {
              if (name == User.curUser.name) {
                users.insert(
                    0,
                    User(
                        name: name,
                        energyPercentage:
                            (duration / User.householdShowerDuration)
                                .toDouble()));
              } else {
                users.add(User(
                    name: name,
                    energyPercentage:
                        (duration / User.householdShowerDuration).toDouble()));
              }
            });
            return Expanded(
              child: SizedBox(
                  width: APPSize.WIDTH(context) * 0.9,
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      bool isCurUser = users[index].name == User.curUser.name;
                      return Material(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: APPColour.laundryGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: users[index].profilePicture,
                            trailing: isCurUser
                                ? const Icon(Icons.arrow_forward_ios_outlined)
                                : null,
                            title: Text(users[index].name +
                                (isCurUser ? " (You)" : "")),
                            subtitle: Text(
                                "Energy Share: ${(users[index].energyPercentage * 100).roundToDouble()}%"),
                            onTap: () {
                              final curUser = User.curUser.name;
                              if (curUser == users[index].name) {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BreakdownPage(
                                          curUser: User.curUser.name)),
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
            return const CircularProgressIndicator();
          }
        });
  }
}
