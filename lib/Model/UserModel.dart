// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  int code;
  String message;
  Item item;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.numOfProducts,
    this.numOfOrders,
    this.numOfBookings,
    this.status,
    this.image,
    this.isFeatured,
    this.type,
    this.rate,
    this.size,
    this.supplierCode,
    this.notifications,
    this.isDeleted,
    this.accessToken,
    this.isRated,
    this.myRate,
    this.designerName,
    this.designerDescription,
    this.discountLabel,
  });

  int id;
  dynamic name;
  String mobile;
  String email;
  int numOfProducts;
  int numOfOrders;
  int numOfBookings;
  String status;
  String image;
  int isFeatured;
  String type;
  int rate;
  dynamic size;
  String supplierCode;
  int notifications;
  String isDeleted;
  String accessToken;
  bool isRated;
  dynamic myRate;
  String designerName;
  String designerDescription;
  String discountLabel;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    numOfProducts: json["num_of_products"],
    numOfOrders: json["num_of_orders"],
    numOfBookings: json["num_of_bookings"],
    status: json["status"],
    image: json["image"],
    isFeatured: json["is_featured"],
    type: json["type"],
    rate: json["rate"],
    size: json["size"],
    supplierCode: json["supplier_code"],
    notifications: json["notifications"],
    isDeleted: json["is_deleted"],
    accessToken: json["access_token"],
    isRated: json["is_rated"],
    myRate: json["my_rate"],
    designerName: json["designer_name"],
    designerDescription: json["designer_description"],
    discountLabel: json["discount_label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "num_of_products": numOfProducts,
    "num_of_orders": numOfOrders,
    "num_of_bookings": numOfBookings,
    "status": status,
    "image": image,
    "is_featured": isFeatured,
    "type": type,
    "rate": rate,
    "size": size,
    "supplier_code": supplierCode,
    "notifications": notifications,
    "is_deleted": isDeleted,
    "access_token": accessToken,
    "is_rated": isRated,
    "my_rate": myRate,
    "designer_name": designerName,
    "designer_description": designerDescription,
    "discount_label": discountLabel,
  };
}
