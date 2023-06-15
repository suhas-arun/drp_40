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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const TopBar(),
            Container(
                height: APPSize.REM_HEIGHT(context) * 0.95,
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Text("Your Household", style: APPText.largeGreenText),
                    Container(
                        margin: const EdgeInsets.all(20),
                        height: APPSize.WIDTH(context) * 0.5,
                        width: APPSize.WIDTH(context) * 0.5,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/house.png")),
                        )),
                    const UserTile(),
                  ],
                )),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
