// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  final bool? success;
  final Data? data;
  final String? message;

  SignupModel({
    this.success,
    this.data,
    this.message,
  });

  SignupModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      SignupModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  final String? apiToken;
  final int? userId;
  final String? noOfBottles;
  final DateTime? createdAt;

  Data({
    this.apiToken,
    this.userId,
    this.noOfBottles,
    this.createdAt,
  });

  Data copyWith({
    String? apiToken,
    int? userId,
    String? noOfBottles,
    DateTime? createdAt,
  }) =>
      Data(
        apiToken: apiToken ?? this.apiToken,
        userId: userId ?? this.userId,
        noOfBottles: noOfBottles ?? this.noOfBottles,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        apiToken: json["api_token"],
        userId: json["user_id"],
        noOfBottles: json["no_of_bottles"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "api_token": apiToken,
        "user_id": userId,
        "no_of_bottles": noOfBottles,
        "created_at": createdAt?.toIso8601String(),
      };
}
