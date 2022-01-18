// To parse this JSON data, do
//
//     final wooJwtResponse = wooJwtResponseFromJson(jsonString);

import 'dart:convert';

WooJwtResponse wooJwtResponseFromJson(String str) =>
    WooJwtResponse.fromJson(json.decode(str));

String wooJwtResponseToJson(WooJwtResponse data) => json.encode(data.toJson());

class WooJwtResponse {
  WooJwtResponse({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? code;
  String? message;
  Data? data;

  factory WooJwtResponse.fromJson(Map<String, dynamic> json) => WooJwtResponse(
        success: json["success"] == null ? null : json["success"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "statusCode": statusCode == null ? null : statusCode,
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });

  String? token;
  int? id;
  String? email;
  String? nicename;
  String? firstName;
  String? lastName;
  String? displayName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : json["token"],
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        nicename: json["nicename"] == null ? null : json["nicename"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        displayName: json["displayName"] == null ? null : json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "nicename": nicename == null ? null : nicename,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "displayName": displayName == null ? null : displayName,
      };
}
