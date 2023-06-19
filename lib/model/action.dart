// Action type
sealed class EnergyAction {
  final DateTime logDate;
  final String name;

  const EnergyAction({required this.logDate, required this.name});
}

class ShowerAction extends EnergyAction {
  final double length;
  final bool hot;

  const ShowerAction(
      {required super.logDate,
      required super.name,
      required this.length,
      required this.hot});
}

class LaundryAction extends EnergyAction {
  final bool eco;
  final bool airDry;

  LaundryAction(
      {required super.logDate,
      required super.name,
      required this.eco,
      required this.airDry});
}
