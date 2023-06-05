import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../user/user.dart';

//this will need to be stateful, and take in
class UserTile extends StatelessWidget {
  const UserTile({super.key});

  List<User> getUsers() {
    //implement properly
    return User.getTestUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: APPSize.REM_HEIGHT(context),
        child: ListView.builder(
          //temporary itemCount for UI testing
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              leading: getUsers()[index].profilePicture,
              title: Text(getUsers()[index].name),
              subtitle: Text("Energy Share: " +
                  getUsers()[index].energyPercentage.toString() +
                  "%"),
            );
          },
        ));
  }
}
