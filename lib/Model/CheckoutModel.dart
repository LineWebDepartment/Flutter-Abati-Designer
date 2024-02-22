// To parse this JSON data, do
//
//     final checkoutModel = checkoutModelFromJson(jsonString);

import 'dart:convert';

CheckoutModel checkoutModelFromJson(String str) => CheckoutModel.fromJson(json.decode(str));

String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

class CheckoutModel {
  CheckoutModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  num code;
  String message;
  Item item;

  CheckoutModel copyWith({
    bool status,
    num code,
    String message,
    Item item,
  }) =>
      CheckoutModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
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
    this.deliveryCharge,
    this.changedSubTotal,
    this.changedDiscount,
    this.changedTotal,
    this.changedDeliveryCharge,
  });

  num subTotal;
  num discount;
  num total;
  num deliveryCharge;
  num changedSubTotal;
  num changedDiscount;
  num changedTotal;
  num changedDeliveryCharge;

  Item copyWith({
    num subTotal,
    num discount,
    num total,
    num deliveryCharge,
    num changedSubTotal,
    num changedDiscount,
    num changedTotal,
    num changedDeliveryCharge,
  }) =>
      Item(
        subTotal: subTotal ?? this.subTotal,
        discount: discount ?? this.discount,
        total: total ?? this.total,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        changedSubTotal: changedSubTotal ?? this.changedSubTotal,
        changedDiscount: changedDiscount ?? this.changedDiscount,
        changedTotal: changedTotal ?? this.changedTotal,
        changedDeliveryCharge: changedDeliveryCharge ?? this.changedDeliveryCharge,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    subTotal: json["sub_total"] == null ? null : json["sub_total"],
    discount: json["discount"] == null ? null : json["discount"],
    total: json["total"] == null ? null : json["total"],
    deliveryCharge: json["delivery_charge"] == null ? null : json["delivery_charge"],
    changedSubTotal: json["changed_sub_total"] == null ? null : json["changed_sub_total"],
    changedDiscount: json["changed_discount"] == null ? null : json["changed_discount"],
    changedTotal: json["changed_total"] == null ? null : json["changed_total"],
    changedDeliveryCharge: json["changed_delivery_charge"] == null ? null : json["changed_delivery_charge"],
  );

  Map<String, dynamic> toJson() => {
    "sub_total": subTotal == null ? null : subTotal,
    "discount": discount == null ? null : discount,
    "total": total == null ? null : total,
    "delivery_charge": deliveryCharge == null ? null : deliveryCharge,
    "changed_sub_total": changedSubTotal == null ? null : changedSubTotal,
    "changed_discount": changedDiscount == null ? null : changedDiscount,
    "changed_total": changedTotal == null ? null : changedTotal,
    "changed_delivery_charge": changedDeliveryCharge == null ? null : changedDeliveryCharge,
  };
}
