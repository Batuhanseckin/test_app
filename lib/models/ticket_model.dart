// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
    TicketModel({
        this.passengerName,
        this.seatNu,
        this.departureCity,
        this.departureBusStop,
        this.departureTime,
        this.arrivalCity,
        this.arrivalBusStop,
        this.arrivalTime,
        this.tourNumber,
        this.date,
        this.ticketNumber,
        this.bookingNumber,
        this.qrCode,
    });

    String passengerName;
    String seatNu;
    String departureCity;
    String departureBusStop;
    String departureTime;
    String arrivalCity;
    String arrivalBusStop;
    String arrivalTime;
    String tourNumber;
    String date;
    String ticketNumber;
    String bookingNumber;
    String qrCode;

    factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        passengerName: json["passengerName"] == null ? null : json["passengerName"],
        seatNu: json["seatNu"] == null ? null : json["seatNu"],
        departureCity: json["departureCity"] == null ? null : json["departureCity"],
        departureBusStop: json["departureBusStop"] == null ? null : json["departureBusStop"],
        departureTime: json["departureTime"] == null ? null : json["departureTime"],
        arrivalCity: json["arrivalCity"] == null ? null : json["arrivalCity"],
        arrivalBusStop: json["arrivalBusStop"] == null ? null : json["arrivalBusStop"],
        arrivalTime: json["arrivalTime"] == null ? null : json["arrivalTime"],
        tourNumber: json["tourNumber"] == null ? null : json["tourNumber"],
        date: json["date"] == null ? null : json["date"],
        ticketNumber: json["ticketNumber"] == null ? null : json["ticketNumber"],
        bookingNumber: json["bookingNumber"] == null ? null : json["bookingNumber"],
        qrCode: json["qrCode"] == null ? null : json["qrCode"],
    );

    Map<String, dynamic> toJson() => {
        "passengerName": passengerName == null ? null : passengerName,
        "seatNu": seatNu == null ? null : seatNu,
        "departureCity": departureCity == null ? null : departureCity,
        "departureBusStop": departureBusStop == null ? null : departureBusStop,
        "departureTime": departureTime == null ? null : departureTime,
        "arrivalCity": arrivalCity == null ? null : arrivalCity,
        "arrivalBusStop": arrivalBusStop == null ? null : arrivalBusStop,
        "arrivalTime": arrivalTime == null ? null : arrivalTime,
        "tourNumber": tourNumber == null ? null : tourNumber,
        "date": date == null ? null : date,
        "ticketNumber": ticketNumber == null ? null : ticketNumber,
        "bookingNumber": bookingNumber == null ? null : bookingNumber,
        "qrCode": qrCode == null ? null : qrCode,
    };
}
