import '../model/data.dart';

class AppData {
  static List<ShowerData> dummyData = [
    const ShowerData(id: 0, name: 'Jan', y: 5.0, avg: 4.8),
    const ShowerData(id: 1, name: 'Feb', y: 4.3, avg: 5.7),
    const ShowerData(id: 2, name: 'Mar', y: 5.7, avg: 4.6),
    const ShowerData(id: 3, name: 'Apr', y: 3.9, avg: 7.8),
    const ShowerData(id: 4, name: 'May', y: 4.8, avg: 3.9)
  ];

  static List<ShowerData> zeroData = [
    const ShowerData(id: 0, name: 'Jan', y: 0, avg: 0),
    const ShowerData(id: 1, name: 'Feb', y: 0, avg: 0),
    const ShowerData(id: 2, name: 'Mar', y: 0, avg: 0),
    const ShowerData(id: 3, name: 'Apr', y: 0, avg: 0),
    const ShowerData(id: 4, name: 'May', y: 0, avg: 0)
  ];
}
