import 'package:saveshare/components/bottom_bar.dart';
import 'package:saveshare/components/top_bar.dart';
import 'package:saveshare/components/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/pages/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: APPColour.green,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: APPColour.green,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HistoryPage()));
                },
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TopBar(),
            UserTile(),
            Expanded(child: Container()),
            BottomBar(),
          ],
        ));
  }
}
