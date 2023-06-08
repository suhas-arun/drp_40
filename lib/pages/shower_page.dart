import 'package:flutter/material.dart';
import 'package:saveshare/constants/size.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/colour.dart';

class AddShowerPage extends StatefulWidget {
  const AddShowerPage({super.key});

  @override
  State<AddShowerPage> createState() => _AddShowerPageState();
}

class _AddShowerPageState extends State<AddShowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(children: [
          const TopBar(),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(children: [
                const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Icon(Icons.shower_outlined,
                        color: APPColour.green, size: APPSize.LARGE_ICON_SIZE)),
                Expanded(child: Container()),
                const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("Shower", style: APPText.LARGE_TEXT)),
                Expanded(child: Container())
              ])),
          Expanded(child: Container()),
          Row(children: [
            Expanded(child: Container()),
            const Text("Minutes:", style: APPText.LARGE_TEXT),
            Expanded(child: Container()),
            // TODO Input text
          ]),
          Expanded(child: Container()),
          Row(children: [
            Expanded(child: Container()),
            const Text("Cold shower?", style: APPText.LARGE_TEXT),
            Expanded(child: Container()),
            // TODO Select hot or cold
          ]),
          Expanded(child: Container()),
          ElevatedButton(
              onPressed: () {},
              child: Text('Log Action', style: APPText.LARGE_WHITE_TEXT),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  backgroundColor: APPColour.green,
                  fixedSize: Size(200, 50))),
          Expanded(child: Container()),
          const BottomBar(),
        ]));
  }
}
