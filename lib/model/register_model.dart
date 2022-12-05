// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) =>
    RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) =>
    json.encode(data.toJson());

class RegisterUserModel {
  RegisterUserModel({
    required this.message,
    required this.data,
  });

  String message;
  RegisterDataModel data;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        message: json["message"],
        data: RegisterDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class RegisterDataModel {
  RegisterDataModel({
    required this.user,
    required this.accessToken,
  });

  User user;
  String accessToken;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.photoUserUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String fullName;
  String email;
  String photoUserUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        photoUserUrl: json["photo_user_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "photo_user_url": photoUserUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
