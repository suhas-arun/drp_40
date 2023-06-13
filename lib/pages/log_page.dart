import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/pages/shower_page.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';
import '../constants/text.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const TopBar(),
            Expanded(child: Container()),
            Row(children: [
              IconButton(
                padding: const EdgeInsets.all(40.0),
                alignment: Alignment.centerLeft,
                iconSize: APPSize.LARGE_ICON_SIZE,
                color: APPColour.green,
                icon: const Icon(Icons.shower_outlined),
                splashRadius: APPSize.LARGE_ICON_SPLASH,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddShowerPage()),
                  );
                },
              ),
              const Text("Log a Shower", style: APPText.LARGE_TEXT)
            ]),
            Expanded(child: Container()),
            const BottomBar(),
          ],
        ));
  }
}
