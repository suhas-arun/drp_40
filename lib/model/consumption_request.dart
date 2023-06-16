// To parse this JSON data, do
//
//     final consumptionRequest = consumptionRequestFromJson(jsonString);

import 'dart:convert';

ConsumptionRequest consumptionRequestFromJson(String str) =>
    ConsumptionRequest.fromJson(json.decode(str));

String consumptionRequestToJson(ConsumptionRequest data) =>
    json.encode(data.toJson());

class ConsumptionRequest {
  String resource;
  DateTime responseTimestamp;
  AvailableCacheRange availableCacheRange;
  String start;
  String end;
  String granularity;
  String unit;
  List<Device> devices;

  ConsumptionRequest({
    required this.resource,
    required this.responseTimestamp,
    required this.availableCacheRange,
    required this.start,
    required this.end,
    required this.granularity,
    required this.unit,
    required this.devices,
  });

  factory ConsumptionRequest.fromJson(Map<String, dynamic> json) =>
      ConsumptionRequest(
        resource: json["resource"],
        responseTimestamp: DateTime.parse(json["responseTimestamp"]),
        availableCacheRange:
            AvailableCacheRange.fromJson(json["availableCacheRange"]),
        start: json["start"],
        end: json["end"],
        granularity: json["granularity"],
        unit: json["unit"],
        devices:
            List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "responseTimestamp": responseTimestamp.toIso8601String(),
        "availableCacheRange": availableCacheRange.toJson(),
        "start": start,
        "end": end,
        "granularity": granularity,
        "unit": unit,
        "devices": List<dynamic>.from(devices.map((x) => x.toJson())),
      };
}

class AvailableCacheRange {
  String start;
  String end;

  AvailableCacheRange({
    required this.start,
    required this.end,
  });

  factory AvailableCacheRange.fromJson(Map<String, dynamic> json) =>
      AvailableCacheRange(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}

class Device {
  String deviceId;
  List<Value> values;

  Device({
    required this.deviceId,
    required this.values,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        deviceId: json["deviceId"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
      };
}

class Value {
  double primaryValue;
  String timestamp;

  Value({
    required this.primaryValue,
    required this.timestamp,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        primaryValue: json["primaryValue"]?.toDouble(),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "primaryValue": primaryValue,
        "timestamp": timestamp,
      };
}
