import 'package:flutter/material.dart';
import 'package:saveshare/constants/buttons.dart';
import 'package:saveshare/constants/colour.dart';

import '../components/bottom_bar.dart';
import '../components/top_bar.dart';
import '../constants/size.dart';
import '../constants/text.dart';

class LogPage extends StatefulWidget {
  final String actionName;

  const LogPage({super.key, required this.actionName});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  bool checkedValue = false;
  bool ecoWash = false;
  bool airDry = false;
  double temp = 0;
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
          body: Column(
            children: [
              const TopBar(),
              topSection(widget.actionName),
              actionInput(widget.actionName),
              Expanded(child: Container()),
              logActionButton(widget.actionName),
              const BottomBar(),
            ],
          )),
    );
  }

  Widget topSection(String actionName) {
    return SizedBox(
        width: APPSize.WIDTH(context),
        height: APPSize.REM_HEIGHT(context) * 0.45,
        child: Stack(children: [
          Positioned(
              top: 20,
              left: 10,
              child: APPButtons.backButton(
                  APPColour.actionColour(actionName), context)),
          Positioned(
            top: APPSize.REM_HEIGHT(context) * 0.05,
            left: APPSize.WIDTH(context) * 0.15,
            child: Card(
                elevation: 0,
                color: Colors.transparent,
                //shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                    height: APPSize.WIDTH(context) * 0.7,
                    width: APPSize.WIDTH(context) * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/$actionName.png'))))),
          ),
        ]));
  }

  Widget actionInput(actionName) {
    if (actionName == "shower") {
      return showerInput();
    } else if (actionName == "laundry") {
      return laundryInput();
    } else {
      return heatingInput();
    }
  }

  Widget showerInput() {
    Color colour = const Color.fromARGB(255, 9, 66, 188);

    return SizedBox(
      width: APPSize.WIDTH(context) * 0.85,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Tell us about your shower:",
            textAlign: TextAlign.left, style: APPText.mediumText(colour)),
        Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 30),
            child: SizedBox(
              width: APPSize.WIDTH(context) * 0.85,
              child: TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _timecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter duration (minutes)',
                      hintText: 'Duration')),
            )),
        CheckboxListTile(
          fillColor: MaterialStatePropertyAll(colour),
          contentPadding: const EdgeInsets.only(left: 0),
          title: Text("Cold Shower", style: APPText.mediumText(colour)),
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        )
      ]),
    );
  }

  Widget laundryInput() {
    Color colour = APPColour.green;

    return SizedBox(
      width: APPSize.WIDTH(context) * 0.9,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("Tell us about your washing load:",
            textAlign: TextAlign.center, style: APPText.mediumText(colour)),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        Row(children: [
          SizedBox(
            width: APPSize.WIDTH(context) * 0.45,
            child: CheckboxListTile(
              fillColor: MaterialStatePropertyAll(colour),
              contentPadding: const EdgeInsets.only(left: 0),
              title: Text("Eco Wash", style: APPText.mediumText(colour)),
              value: ecoWash,
              onChanged: (newValue) {
                setState(() {
                  ecoWash = newValue!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ),
          SizedBox(
            width: APPSize.WIDTH(context) * 0.45,
            child: CheckboxListTile(
              fillColor: MaterialStatePropertyAll(colour),
              contentPadding: const EdgeInsets.only(left: 0),
              title: Text("Air Dry", style: APPText.mediumText(colour)),
              value: airDry,
              onChanged: (newValue) {
                setState(() {
                  airDry = newValue!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          )
        ])
      ]),
    );
  }

  Widget heatingInput() {
    Color colour = const Color.fromARGB(255, 97, 15, 15);
    int displayTemp = temp.round();

    return SizedBox(
      width: APPSize.WIDTH(context) * 0.9,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("What is the new thermostat value?",
            textAlign: TextAlign.center, style: APPText.mediumText(colour)),
        const Padding(padding: EdgeInsets.only(bottom: 50)),
        SizedBox(
            width: APPSize.WIDTH(context) * 0.85,
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    inactiveTickMarkColor: APPColour.grey,
                    activeTickMarkColor: APPColour.heatingRed,
                    activeTrackColor: APPColour.heatingRed,
                    inactiveTrackColor: APPColour.grey,
                    valueIndicatorColor: colour,
                    thumbColor: APPColour.heatingRed,
                    overlayColor: APPColour.heatingRed.withOpacity(0.3)),
                child: Slider(
                  min: 0,
                  max: 35,
                  divisions: 35,
                  value: temp,
                  label: "$displayTemp \u00B0C",
                  onChanged: (newTemp) {
                    setState(() {
                      temp = newTemp;
                    });
                  },
                )))
      ]),
    );
  }

  Widget logActionButton(actionName) {
    Color colour;

    if (actionName == "shower") {
      colour = APPColour.showerBlue;
    } else if (actionName == "laundry") {
      colour = APPColour.laundryGreen;
    } else {
      colour = APPColour.heatingRed;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ElevatedButton(
          onPressed: () {
            double duration = double.parse(_timecontroller.text);
            //remember checkedValue is a bool that is true if Cold Shower
            //add firebase section here
            Navigator.pop(context);
          },
          style: APPButtons.logButtonStyle(colour, context),
          child: Text('Log Action', style: APPText.mediumText(Colors.white))),
    );
  }
}
