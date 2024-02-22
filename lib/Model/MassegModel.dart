// To parse this JSON data, do
//
//     final massegModel = massegModelFromJson(jsonString);

import 'dart:convert';

MassegModel massegModelFromJson(String str) => MassegModel.fromJson(json.decode(str));

String massegModelToJson(MassegModel data) => json.encode(data.toJson());

class MassegModel {
  MassegModel({
    this.status,
    this.code,
    this.message,
  });

  bool status;
  int code;
  String message;

  MassegModel copyWith({
    bool status,
    int code,
    String message,
  }) =>
      MassegModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory MassegModel.fromJson(Map<String, dynamic> json) => MassegModel(
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
