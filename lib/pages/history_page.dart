import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:saveshare/components/bottom_bar.dart';

import '../components/drawer.dart';
import '../components/top_bar.dart';
import '../models/dummy_actions.dart';
import '../model/action.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late List<EnergyAction> actions = DummyActions().actions;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const TopBar(),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(children: actionsToSlidableWidget()),
              ),
            ),
            const BottomBar()
          ],
        ),
      ),
    );
  }

  List<Widget> actionsToSlidableWidget() {
    return actions
        .map((action) => Slidable(
              // Specify a key if the Slidable is dismissible.
              key: ValueKey(action),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {
                  setState(() {
                    actions.remove(action);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Action dismissed'),
                    showCloseIcon: true,
                  ));
                }),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        actions.remove(action);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Action dismissed'),
                        showCloseIcon: true,
                      ));
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),

              child: makeListTile(action),
            ))
        .toList();
  }

  Widget makeListTile(EnergyAction action) {
    switch (action) {
      case ShowerAction(:var name, :var hot, :var length, :var logDate):
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
              leading: const Icon(Icons.shower),
              title: Text("Shower - $name"),
              subtitle: Text(
                  "Date: ${logDate.toString().substring(0, 16)}\nCold Shower: ${!hot}   Length: $length mins"),
              onTap: () {}),
        );
      case LaundryAction(:var name, :var eco, :var airDry, :var logDate):
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
              leading: const Icon(Icons.local_laundry_service),
              title: Text("Laundry - $name"),
              subtitle: Text(
                  "Date: ${logDate.toString().substring(0, 16)}\nEco Wash: $eco   AirDry: $airDry"),
              onTap: () {}),
        );
    }
  }
}

void doNothing(BuildContext context) {}
