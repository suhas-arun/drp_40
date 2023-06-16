import 'package:saveshare/model/consumption_request.dart';

import 'package:http/http.dart' as http;

class EnergyService {
  Future<ConsumptionRequest> getData() async {
    Map<String, String>? apiKey = {
      'x-api-key': '447c60ea-6783-4800-895c-56fd71092638'
    };
    var client = http.Client();
    const mpan = 1234567891000;
    final curTime = DateTime.now();
    final yesterday = curTime.subtract(const Duration(days: 1));
    String startTime = getTimeString(yesterday);
    String endTime = getTimeString(curTime);

    var getGasConsUri = Uri.parse(
        'https://api-v2-sandbox.data.n3rgy.com/mpxn/$mpan/utility/electricity/readingtype/consumption?start=$startTime&end=$endTime');
    var response = await client.get(getGasConsUri, headers: apiKey);

    if (response.statusCode == 200) {
      var json = response.body;
      var data = consumptionRequestFromJson(json);
      return data;
    } else {
      return ConsumptionRequest(
          resource: "",
          responseTimestamp: DateTime.now(),
          availableCacheRange: AvailableCacheRange(start: "", end: ""),
          start: "",
          end: "",
          granularity: "",
          unit: "",
          devices: []);
    }
  }

  // Sandbox data is for 2013
  String getTimeString(DateTime time) {
    return "2013${time.month < 10 ? "0" : ""}${time.month}${time.day < 10 ? "0" : ""}${time.day}${time.hour < 10 ? "0" : ""}${time.hour}${time.minute < 10 ? "0" : ""}${time.minute}";
  }
}
