import 'package:saveshare/components/bottom_bar.dart';
import 'package:saveshare/components/top_bar.dart';
import 'package:saveshare/components/user_tile.dart';
import 'package:flutter/material.dart';

import '../constants/size.dart';
import '../constants/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const TopBar(),
        body: Column(
          children: [
            SizedBox(
                height: APPSize.REM_HEIGHT(context),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text("Your Household",
                            style: APPText.largeGreenText)),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: APPSize.REM_HEIGHT(context) * 0.3,
                        width: APPSize.REM_HEIGHT(context) * 0.3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/house.png")),
                        )),
                    const UserTile(),
                  ],
                )),
            const BottomBar(),
          ],
        ));
  }
}
