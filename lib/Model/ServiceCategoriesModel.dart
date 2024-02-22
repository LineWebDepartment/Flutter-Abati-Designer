// To parse this JSON data, do
//
//     final serviceCategoriesModel = serviceCategoriesModelFromJson(jsonString);

import 'dart:convert';

ServiceCategoriesModel serviceCategoriesModelFromJson(String str) => ServiceCategoriesModel.fromJson(json.decode(str));

String serviceCategoriesModelToJson(ServiceCategoriesModel data) => json.encode(data.toJson());

class ServiceCategoriesModel {
  ServiceCategoriesModel({
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

  ServiceCategoriesModel copyWith({
    bool status,
    int code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      ServiceCategoriesModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory ServiceCategoriesModel.fromJson(Map<String, dynamic> json) => ServiceCategoriesModel(
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
    this.numOfItems,
    this.status,
    this.name,
  });

  int id;
  String image;
  int numOfItems;
  String status;
  String name;

  Item copyWith({
    int id,
    String image,
    int numOfItems,
    String status,
    String name,
  }) =>
      Item(
        id: id ?? this.id,
        image: image ?? this.image,
        numOfItems: numOfItems ?? this.numOfItems,
        status: status ?? this.status,
        name: name ?? this.name,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    numOfItems: json["num_of_items"] == null ? null : json["num_of_items"],
    status: json["status"] == null ? null : json["status"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "num_of_items": numOfItems == null ? null : numOfItems,
    "status": status == null ? null : status,
    "name": name == null ? null : name,
  };
}
