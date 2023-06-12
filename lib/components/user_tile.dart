import 'package:flutter/material.dart';
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
              users.add(User(
                  name: name,
                  energyPercentage:
                      (duration / User.householdShowerDuration).toDouble()));
            });
            return SizedBox(
                height: APPSize.REM_HEIGHT(context),
                child: ListView.builder(
                  //temporary itemCount for UI testing
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: users[index].profilePicture,
                      title: Text(users[index].name),
                      subtitle: Text(
                          "Energy Share: ${(users[index].energyPercentage * 100).roundToDouble()}%"),
                      onTap: () {
                        const curUser = User.curUser;
                        if (curUser == users[index].name) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BreakdownPage(curUser: User.curUser)),
                          );
                        }
                      },
                    );
                  },
                ));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
