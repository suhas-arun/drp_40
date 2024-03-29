// Data format to be fed to time chart
class Data {
  final int id;
  final String name;
  final double y;
  final double avg;

  const Data(
      {required this.name,
      required this.id,
      required this.y,
      required this.avg});

  @override
  String toString() {
    return "($id, $name, $y, $avg)";
  }
}
