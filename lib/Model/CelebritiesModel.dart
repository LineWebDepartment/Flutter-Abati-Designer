// To parse this JSON data, do
//
//     final celebritiesModel = celebritiesModelFromJson(jsonString);

import 'dart:convert';

CelebritiesModel celebritiesModelFromJson(String str) => CelebritiesModel.fromJson(json.decode(str));

String celebritiesModelToJson(CelebritiesModel data) => json.encode(data.toJson());

class CelebritiesModel {
  CelebritiesModel({
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

  CelebritiesModel copyWith({
    bool status,
    int code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      CelebritiesModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory CelebritiesModel.fromJson(Map<String, dynamic> json) => CelebritiesModel(
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
    this.email,
    this.mobile,
    this.sortOrder,
    this.isFeatured,
    this.numOfProducts,
    this.numOfServices,
    this.status,
    this.name,
    this.description,
  });

  int id;
  String image;
  String email;
  String mobile;
  int sortOrder;
  int isFeatured;
  int numOfProducts;
  int numOfServices;
  String status;
  String name;
  String description;

  Item copyWith({
    int id,
    String image,
    String email,
    String mobile,
    int sortOrder,
    int isFeatured,
    int numOfProducts,
    int numOfServices,
    String status,
    String name,
    String description,
  }) =>
      Item(
        id: id ?? this.id,
        image: image ?? this.image,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        sortOrder: sortOrder ?? this.sortOrder,
        isFeatured: isFeatured ?? this.isFeatured,
        numOfProducts: numOfProducts ?? this.numOfProducts,
        numOfServices: numOfServices ?? this.numOfServices,
        status: status ?? this.status,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    email: json["email"] == null ? null : json["email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    numOfProducts: json["num_of_products"] == null ? null : json["num_of_products"],
    numOfServices: json["num_of_services"] == null ? null : json["num_of_services"],
    status: json["status"] == null ? null : json["status"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "email": email == null ? null : email,
    "mobile": mobile == null ? null : mobile,
    "sort_order": sortOrder == null ? null : sortOrder,
    "is_featured": isFeatured == null ? null : isFeatured,
    "num_of_products": numOfProducts == null ? null : numOfProducts,
    "num_of_services": numOfServices == null ? null : numOfServices,
    "status": status == null ? null : status,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
  };
}
