// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
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

  CategoriesModel copyWith({
    bool status,
    int code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      CategoriesModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    isMore: json["is_more"] == null ? null : json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "is_more": isMore == null ? null : isMore,
  };
}

class Item {
  Item({
    this.id,
    this.image,
    this.bulkDiscount,
    this.numOfItems,
    this.isFeatured,
    this.name,
  });

  int id;
  String image;
  int bulkDiscount;
  int numOfItems;
  int isFeatured;
  String name;

  Item copyWith({
    int id,
    String image,
    int bulkDiscount,
    int numOfItems,
    int isFeatured,
    String name,
  }) =>
      Item(
        id: id ?? this.id,
        image: image ?? this.image,
        bulkDiscount: bulkDiscount ?? this.bulkDiscount,
        numOfItems: numOfItems ?? this.numOfItems,
        isFeatured: isFeatured ?? this.isFeatured,
        name: name ?? this.name,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    bulkDiscount: json["bulk_discount"] == null ? null : json["bulk_discount"],
    numOfItems: json["num_of_items"] == null ? null : json["num_of_items"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "bulk_discount": bulkDiscount == null ? null : bulkDiscount,
    "num_of_items": numOfItems == null ? null : numOfItems,
    "is_featured": isFeatured == null ? null : isFeatured,
    "name": name == null ? null : name,
  };
}
