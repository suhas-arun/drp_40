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
  bool checkedValue = false;
  final TextEditingController _timecontroller = TextEditingController();
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _timecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter duration (minutes)',
                    hintText: 'Duration')),
          ),
          Expanded(child: Container()),
          CheckboxListTile(
            contentPadding: EdgeInsets.only(left: 20),
            title: Text("Cold Shower", style: APPText.LARGE_TEXT),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = newValue!;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          Expanded(child: Container()),
          ElevatedButton(
              onPressed: () {
                double duration = double.parse(_timecontroller.text);
                //remember checkedValue is a bool that is true if Cold Shower
                //add firebase section here
              },
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
