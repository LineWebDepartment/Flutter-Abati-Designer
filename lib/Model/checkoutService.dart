// To parse this JSON data, do
//
//     final checkoutServiceModel = checkoutServiceModelFromJson(jsonString);

import 'dart:convert';

CheckoutServiceModel checkoutServiceModelFromJson(String str) => CheckoutServiceModel.fromJson(json.decode(str));

String checkoutServiceModelToJson(CheckoutServiceModel data) => json.encode(data.toJson());

class CheckoutServiceModel {
  CheckoutServiceModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  num code;
  String message;
  Item item;

  CheckoutServiceModel copyWith({
    bool status,
    num code,
    String message,
    Item item,
  }) =>
      CheckoutServiceModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory CheckoutServiceModel.fromJson(Map<String, dynamic> json) => CheckoutServiceModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "item": item == null ? null : item.toJson(),
  };
}

class Item {
  Item({
    this.subTotal,
    this.discount,
    this.total,
    this.changedSubTotal,
    this.changedDiscount,
    this.changedTotal,
  });

  num subTotal;
  num discount;
  num total;
  num changedSubTotal;
  num changedDiscount;
  num changedTotal;

  Item copyWith({
    num subTotal,
    num discount,
    num total,
    num changedSubTotal,
    num changedDiscount,
    num changedTotal,
  }) =>
      Item(
        subTotal: subTotal ?? this.subTotal,
        discount: discount ?? this.discount,
        total: total ?? this.total,
        changedSubTotal: changedSubTotal ?? this.changedSubTotal,
        changedDiscount: changedDiscount ?? this.changedDiscount,
        changedTotal: changedTotal ?? this.changedTotal,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    subTotal: json["sub_total"] == null ? null : json["sub_total"],
    discount: json["discount"] == null ? null : json["discount"],
    total: json["total"] == null ? null : json["total"],
    changedSubTotal: json["changed_sub_total"] == null ? null : json["changed_sub_total"],
    changedDiscount: json["changed_discount"] == null ? null : json["changed_discount"],
    changedTotal: json["changed_total"] == null ? null : json["changed_total"],
  );

  Map<String, dynamic> toJson() => {
    "sub_total": subTotal == null ? null : subTotal,
    "discount": discount == null ? null : discount,
    "total": total == null ? null : total,
    "changed_sub_total": changedSubTotal == null ? null : changedSubTotal,
    "changed_discount": changedDiscount == null ? null : changedDiscount,
    "changed_total": changedTotal == null ? null : changedTotal,
  };
}
