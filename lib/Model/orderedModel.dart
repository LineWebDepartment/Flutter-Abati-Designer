// To parse this JSON data, do
//
//     final orderedModel = orderedModelFromJson(jsonString);

import 'dart:convert';

OrderedModel orderedModelFromJson(String str) => OrderedModel.fromJson(json.decode(str));

String orderedModelToJson(OrderedModel data) => json.encode(data.toJson());

class OrderedModel {
  OrderedModel({
    this.status,
    this.code,
    this.message,
    this.url,
    this.orderId,
  });

  bool status;
  int code;
  String message;
  String url;
  int orderId;

  OrderedModel copyWith({
    bool status,
    int code,
    String message,
    String url,
    int orderId,
  }) =>
      OrderedModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        url: url ?? this.url,
        orderId: orderId ?? this.orderId,
      );

  factory OrderedModel.fromJson(Map<String, dynamic> json) => OrderedModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    url: json["url"],
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "url": url,
    "order_id": orderId,
  };
}
