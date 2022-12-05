// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        required this.message,
        required this.data,
    });

    String message;
    Data data;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
