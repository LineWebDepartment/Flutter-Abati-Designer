// To parse this JSON data, do
//
//     final responsModel = responsModelFromJson(jsonString);

import 'dart:convert';

ResponsModel responsModelFromJson(String str) => ResponsModel.fromJson(json.decode(str));

String responsModelToJson(ResponsModel data) => json.encode(data.toJson());

class ResponsModel {
  ResponsModel({
    this.status,
    this.code,
    this.message,
  });

  bool status;
  int code;
  String message;

  ResponsModel copyWith({
    bool status,
    int code,
    String message,
  }) =>
      ResponsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory ResponsModel.fromJson(Map<String, dynamic> json) => ResponsModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
