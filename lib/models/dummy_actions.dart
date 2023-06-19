import '../model/action.dart';

class DummyActions {
  List<EnergyAction> dummyActions() {
    final DateTime now = DateTime.now();
    final DateTime yesterday = now.subtract(Duration(days: 1));
    final DateTime twoDaysAgo = now.subtract(Duration(days: 2));
    final DateTime threeDaysAGo = now.subtract(Duration(days: 3));

    final showerAction1 =
        ShowerAction(logDate: now, name: "Alex", hot: true, length: 4.0);
    final showerAction2 =
        ShowerAction(logDate: now, name: "Ella", hot: true, length: 5.4);
    final showerAction3 =
        ShowerAction(logDate: yesterday, name: "Ines", hot: false, length: 3.7);
    final showerAction4 = ShowerAction(
        logDate: yesterday, name: "Marcus", hot: true, length: 8.5);
    final showerAction5 = ShowerAction(
        logDate: twoDaysAgo, name: "Alex", hot: false, length: 6.2);
    final showerAction6 = ShowerAction(
        logDate: threeDaysAGo, name: "Ella", hot: false, length: 4.5);
    final showerAction7 = ShowerAction(
        logDate: threeDaysAGo, name: "Marcus", hot: true, length: 3.9);

    final laundryAction1 =
        LaundryAction(logDate: now, eco: true, name: "Ines", airDry: false);
    final laundryAction2 =
        LaundryAction(logDate: now, eco: false, name: "Ella", airDry: false);
    final laundryAction3 =
        LaundryAction(logDate: now, eco: true, name: "Marcus", airDry: false);
    final laundryAction4 =
        LaundryAction(logDate: now, eco: false, name: "Ella", airDry: true);
    final laundryAction5 =
        LaundryAction(logDate: now, eco: false, name: "Alex", airDry: true);
    final laundryAction6 =
        LaundryAction(logDate: now, eco: false, name: "Ines", airDry: false);
    final laundryAction7 =
        LaundryAction(logDate: now, eco: true, name: "Marcus", airDry: false);

    List<EnergyAction> actions = [
      showerAction1,
      laundryAction1,
      showerAction2,
      laundryAction2,
      showerAction3,
      laundryAction3,
      showerAction4,
      laundryAction4,
      showerAction5,
      laundryAction5,
      showerAction6,
      laundryAction6,
      showerAction7,
      laundryAction7
    ];

    return actions;
  }
}
