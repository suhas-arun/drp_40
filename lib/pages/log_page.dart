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
        body: Column(
          children: [
            const TopBar(),
            Expanded(child: actionCards()),
            const BottomBar(),
          ],
        ));
  }

  Widget actionCards() {
    return ListView(children: [
      actionCard(false, "shower", const Color.fromRGBO(64, 123, 255, 1)),
      actionCard(true, "laundry", const Color.fromRGBO(85, 205, 119, 1)),
      actionCard(false, "heating", const Color.fromRGBO(255, 114, 94, 1))
    ]);
  }

  Widget actionCard(bool rightAlign, String picName, Color colour) {
    return SizedBox(
        height: 270,
        //alignment: Alignment.center,
        child: Stack(
          children: [
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
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(-10.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0)
                          ],
                        )))),
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
                            //color: colour,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/$picName.png')))))),
            logActionText(rightAlign, colour, picName)
          ],
        ));
  }

  Widget logActionText(rightAlign, colour, actionString) {
    if (actionString == "shower") {
      return logShowerText(rightAlign, colour);
    } else if (actionString == "laundry") {
      return logLaundryText(rightAlign, colour);
    } else {
      return logHeatingText(rightAlign, colour);
    }
  }

  Widget logShowerText(rightAlign, colour) {
    return Positioned(
        top: 70,
        left: APPSize.WIDTH(context) * (rightAlign ? 0.6 : 0.1),
        child: SizedBox(
            width: APPSize.WIDTH(context) * 0.325,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Log a Shower", style: APPText.mediumText(colour)),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Divider(thickness: 2.0)),
                const Text("Tell us your:"),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                const Text("  - Shower length"),
                const Text("  - Temperature")
              ],
            )));
  }

  Widget logHeatingText(rightAlign, colour) {
    return Positioned(
        top: 70,
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
                const Text("  - Changed room"),
                const Text("    temperature"),
              ],
            )));
  }

  Widget logLaundryText(rightAlign, colour) {
    return Positioned(
        top: 70,
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
                const Text("  - Hand dry")
              ],
            )));
  }

  Widget logShower(BuildContext context) {
    return Row(children: [
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
      const Text("Log a Shower", style: APPText.largeGreenText)
    ]);
  }
}
