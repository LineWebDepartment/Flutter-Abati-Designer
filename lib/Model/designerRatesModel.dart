// To parse this JSON data, do
//
//     final designerRatesModel = designerRatesModelFromJson(jsonString);

import 'dart:convert';

DesignerRatesModel designerRatesModelFromJson(String str) => DesignerRatesModel.fromJson(json.decode(str));

String designerRatesModelToJson(DesignerRatesModel data) => json.encode(data.toJson());

class DesignerRatesModel {
  DesignerRatesModel({
    this.status,
    this.code,
    this.message,
    this.items,
    this.isMore,
  });

  bool status;
  int code;
  String message;
  List<Item> items;
  bool isMore;

  factory DesignerRatesModel.fromJson(Map<String, dynamic> json) => DesignerRatesModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    isMore: json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "is_more": isMore,
  };
}

class Item {
  Item({
    this.id,
    this.userId,
    this.ratedBy,
    this.rate,
    this.comment,
    this.createdAt,
  });

  int id;
  int userId;
  RatedBy ratedBy;
  int rate;
  String comment;
  DateTime createdAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    userId: json["user_id"],
    ratedBy: RatedBy.fromJson(json["rated_by"]),
    rate: json["rate"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "rated_by": ratedBy.toJson(),
    "rate": rate,
    "comment": comment,
    "created_at": createdAt.toIso8601String(),
  };
}

class RatedBy {
  RatedBy({
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
    this.isDeleted,
    this.isRated,
    this.myRate,
    this.designerName,
    this.designerDescription,
    this.discountLabel,
  });

  int id;
  String name;
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
  String size;
  dynamic supplierCode;
  String isDeleted;
  bool isRated;
  dynamic myRate;
  dynamic designerName;
  dynamic designerDescription;
  dynamic discountLabel;

  factory RatedBy.fromJson(Map<String, dynamic> json) => RatedBy(
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
    isDeleted: json["is_deleted"],
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
    "is_deleted": isDeleted,
    "is_rated": isRated,
    "my_rate": myRate,
    "designer_name": designerName,
    "designer_description": designerDescription,
    "discount_label": discountLabel,
  };
}
