// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool? success;
  final Data? data;
  final String? message;

  LoginModel({
    this.success,
    this.data,
    this.message,
  });

  LoginModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      LoginModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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

  Data({
    this.apiToken,
  });

  Data copyWith({
    String? apiToken,
  }) =>
      Data(
        apiToken: apiToken ?? this.apiToken,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "api_token": apiToken,
      };
}
