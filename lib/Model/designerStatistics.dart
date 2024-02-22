// To parse this JSON data, do
//
//     final designerStatisticsModel = designerStatisticsModelFromJson(jsonString);

import 'dart:convert';

DesignerStatisticsModel designerStatisticsModelFromJson(String str) => DesignerStatisticsModel.fromJson(json.decode(str));

String designerStatisticsModelToJson(DesignerStatisticsModel data) => json.encode(data.toJson());

class DesignerStatisticsModel {
  DesignerStatisticsModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  int code;
  String message;
  Item item;

  factory DesignerStatisticsModel.fromJson(Map<String, dynamic> json) => DesignerStatisticsModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    item: Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "item": item.toJson(),
  };
}

class Item {
  Item({
    this.totalSales,
    this.totalOrders,
    this.todaySales,
    this.todayOrders,
    this.pendingOrders,
    this.acceptedOrders,
    this.rejectedOrders,
  });

  num totalSales;
  int totalOrders;
  num todaySales;
  int todayOrders;
  int pendingOrders;
  int acceptedOrders;
  int rejectedOrders;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    totalSales: json["total_sales"],
    totalOrders: json["total_orders"],
    todaySales: json["today_sales"],
    todayOrders: json["today_orders"],
    pendingOrders: json["pending_orders"],
    acceptedOrders: json["accepted_orders"],
    rejectedOrders: json["rejected_orders"],
  );

  Map<String, dynamic> toJson() => {
    "total_sales": totalSales,
    "total_orders": totalOrders,
    "today_sales": todaySales,
    "today_orders": todayOrders,
    "pending_orders": pendingOrders,
    "accepted_orders": acceptedOrders,
    "rejected_orders": rejectedOrders,
  };
}
