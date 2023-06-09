import 'package:flutter/material.dart';
import 'package:saveshare/constants/size.dart';
import 'package:saveshare/constants/text.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/colour.dart';
import '../user/user.dart';
import 'home_page.dart';

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
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
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
                            color: APPColour.green,
                            size: APPSize.LARGE_ICON_SIZE)),
                    Expanded(child: Container()),
                    const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text("Add Shower", style: APPText.LARGE_TEXT)),
                    Expanded(child: Container())
                  ])),
              Expanded(child: Container()),
              Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: _timecontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter duration (minutes)',
                            hintText: 'Duration')),
                  )),
              CheckboxListTile(
                contentPadding: const EdgeInsets.only(left: 20),
                title: const Text("Cold Shower", style: APPText.LARGE_TEXT),
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
                    if (!checkedValue) {
                      User.demoShowerDurations
                          .update(User.curUser, (value) => value + duration);
                    }
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      backgroundColor: APPColour.green,
                      fixedSize: const Size(200, 50)),
                  child: const Text('Log Action',
                      style: APPText.LARGE_WHITE_TEXT)),
              Expanded(child: Container()),
              const BottomBar(),
            ])));
  }
}
