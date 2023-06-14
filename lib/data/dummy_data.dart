import '../model/data.dart';

class AppData {
  static List<Data> dummyShowerData = [
    const Data(id: 0, name: 'Jan', y: 5.0, avg: 4.8),
    const Data(id: 1, name: 'Feb', y: 4.3, avg: 5.7),
    const Data(id: 2, name: 'Mar', y: 5.7, avg: 4.6),
    const Data(id: 3, name: 'Apr', y: 3.9, avg: 7.8),
    const Data(id: 4, name: 'May', y: 4.8, avg: 3.9)
  ];

  static List<Data> dummyLaundryData = [
    const Data(id: 0, name: 'Jan', y: 2, avg: 5),
    const Data(id: 1, name: 'Feb', y: 4, avg: 3),
    const Data(id: 2, name: 'Mar', y: 3, avg: 4),
    const Data(id: 3, name: 'Apr', y: 2, avg: 6),
    const Data(id: 4, name: 'May', y: 4, avg: 4)
  ];
}
