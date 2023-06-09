import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../user/user.dart';

//this will need to be stateful, and take in
class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: User.getTestUsers(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
                height: APPSize.REM_HEIGHT(context),
                child: ListView.builder(
                  //temporary itemCount for UI testing
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: snapshot.data![index].profilePicture,
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(
                          "Energy Share: ${snapshot.data![index].energyPercentage}%"),
                    );
                  },
                ));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
