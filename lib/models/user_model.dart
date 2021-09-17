// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.email,
    this.userId,
  });

  String email;
  String userId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"] == null ? null : json["email"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "userId": userId == null ? null : userId,
      };
}
