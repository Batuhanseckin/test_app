// To parse this JSON data, do
//
//     final departureModel = departureModelFromJson(jsonString);

import 'dart:convert';

DepartureModel departureModelFromJson(String str) =>
    DepartureModel.fromJson(json.decode(str));

String departureModelToJson(DepartureModel data) => json.encode(data.toJson());

class DepartureModel {
  DepartureModel({
    this.route,
    this.departureTime,
    this.arrivalTime,
    this.tourType,
    this.daysOfWeek,
  });

  String route;
  String departureTime;
  String arrivalTime;
  String tourType;
  List<String> daysOfWeek;

  factory DepartureModel.fromJson(Map<String, dynamic> json) => DepartureModel(
        route: json["route"] == null ? null : json["route"],
        departureTime:
            json["departureTime"] == null ? null : json["departureTime"],
        arrivalTime: json["arrivalTime"] == null ? null : json["arrivalTime"],
        tourType: json["tourType"] == null ? null : json["tourType"],
        daysOfWeek: json["daysOfWeek"] == null
            ? null
            : List<String>.from(json["daysOfWeek"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "route": route == null ? null : route,
        "departureTime": departureTime == null ? null : departureTime,
        "arrivalTime": arrivalTime == null ? null : arrivalTime,
        "tourType": tourType == null ? null : tourType,
        "daysOfWeek": daysOfWeek == null
            ? null
            : List<dynamic>.from(daysOfWeek.map((x) => x)),
      };
}
