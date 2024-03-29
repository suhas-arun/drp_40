import 'package:flutter/material.dart';
import 'package:saveshare/constants/buttons.dart';

import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../components/top_bar.dart';

import '../constants/colour.dart';
import '../constants/size.dart';
import '../constants/text.dart';
import 'log_page.dart';

class SelectActionPage extends StatefulWidget {
  const SelectActionPage({super.key});

  @override
  State<SelectActionPage> createState() => _SelectActionPageState();
}

class _SelectActionPageState extends State<SelectActionPage> {
  final List<Widget> images = [
    Expanded(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/radiator.jpg')),
    ),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/shower.jpg')),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/washing.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const TopBar(),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Expanded(child: actionCards()),
            const BottomBar(),
          ],
        ));
  }

  // Combine the actions into a listview
  Widget actionCards() {
    return ListView(children: [
      actionCard(false, "shower", APPColour.showerBlue),
      actionCard(true, "laundry", APPColour.laundryGreen),
      actionCard(false, "heating", APPColour.heatingRed)
    ]);
  }

  // A single card for a single action
  Widget actionCard(bool rightAlign, String picName, Color colour) {
    return SizedBox(
        height: 270,
        child: Stack(
          children: [
            // The background card
            Positioned(
                top: 35,
                left: 0.05 * APPSize.WIDTH(context),
                child: Material(
                    child: Container(
                        height: 220,
                        width: APPSize.WIDTH(context) * 0.9,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0)
                          ],
                        )))),
            // The image card
            Positioned(
              top: 10,
              left: APPSize.WIDTH(context) * (rightAlign ? 0.1 : 0.45),
              child: Card(
                  elevation: 10,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                      height: APPSize.WIDTH(context) * 0.55,
                      width: APPSize.WIDTH(context) * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage('assets/images/$picName.png'))))),
            ),
            logActionText(rightAlign, colour, picName),
            Positioned(
                top: 200,
                left: APPSize.WIDTH(context) * (rightAlign ? 0.59 : 0.09),
                child: SizedBox(
                    width: APPSize.WIDTH(context) * 0.325,
                    child: ElevatedButton(
                      style: APPButtons.EnterDetailsStyle(colour, context),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LogPage(actionName: picName)),
                        );
                      },
                      child: const Text("Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    )))
          ],
        ));
  }

  // The text to overlap the background card
  Widget logActionText(rightAlign, colour, actionString) {
    if (actionString == "shower") {
      return logShowerText(rightAlign, colour);
    } else if (actionString == "laundry") {
      return logLaundryText(rightAlign, colour);
    } else {
      return logHeatingText(rightAlign, colour);
    }
  }

  // Text for logging showers
  Widget logShowerText(rightAlign, colour) {
    return Positioned(
        top: 60,
        left: APPSize.WIDTH(context) * (rightAlign ? 0.6 : 0.1),
        child: SizedBox(
            width: APPSize.WIDTH(context) * 0.325,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Log Shower", style: APPText.mediumText(colour)),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Divider(thickness: 2.0)),
                const Text("Tell us your:"),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                const Text("  - Shower length"),
                const Padding(padding: EdgeInsets.only(bottom: 2)),
                const Text("  - Temperature")
              ],
            )));
  }

  // Text for logging heating
  Widget logHeatingText(rightAlign, colour) {
    return Positioned(
        top: 60,
        left: APPSize.WIDTH(context) * (rightAlign ? 0.6 : 0.1),
        child: SizedBox(
            width: APPSize.WIDTH(context) * 0.325,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Log Heating", style: APPText.mediumText(colour)),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Divider(thickness: 2.0)),
                const Text("Tell us if you:"),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                const Text("  - Changed house"),
                const Text("    temperature"),
              ],
            )));
  }

  // Text for logging laundry
  Widget logLaundryText(rightAlign, colour) {
    return Positioned(
        top: 60,
        left: APPSize.WIDTH(context) * (rightAlign ? 0.6 : 0.1),
        child: SizedBox(
            width: APPSize.WIDTH(context) * 0.325,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Log Laundry", style: APPText.mediumText(colour)),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Divider(thickness: 2.0)),
                const Text("Did you:"),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                const Text("  - Use Eco mode"),
                const Padding(padding: EdgeInsets.only(bottom: 2)),
                const Text("  - Air dry")
              ],
            )));
  }
}
