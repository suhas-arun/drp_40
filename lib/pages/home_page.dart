import 'package:saveshare/components/bottom_bar.dart';
import 'package:saveshare/components/top_bar.dart';
import 'package:saveshare/components/user_tile.dart';
import 'package:flutter/material.dart';

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
            TopBar(),
            //UserTile(),
            Expanded(child: Container()),
            BottomBar(),
          ],
        ));
  }
}
