// To parse this JSON data, do
//
//     final celebrityServicesModel = celebrityServicesModelFromJson(jsonString);

import 'dart:convert';

CelebrityServicesModel celebrityServicesModelFromJson(String str) => CelebrityServicesModel.fromJson(json.decode(str));

String celebrityServicesModelToJson(CelebrityServicesModel data) => json.encode(data.toJson());

class CelebrityServicesModel {
  CelebrityServicesModel({
    this.status,
    this.code,
    this.message,
    this.items,
    this.isMore,
  });

  bool status;
  num code;
  String message;
  List<Item> items;
  bool isMore;

  CelebrityServicesModel copyWith({
    bool status,
    num code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      CelebrityServicesModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory CelebrityServicesModel.fromJson(Map<String, dynamic> json) => CelebrityServicesModel(
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
    this.celebrityId,
    this.serviceCategoryId,
    this.isFeatured,
    this.price,
    this.priceOffer,
    this.listInServices,
    this.name,
    this.description,
    this.fullDescription,
  });

  num id;
  String image;
  num celebrityId;
  num serviceCategoryId;
  num isFeatured;
  num price;
  num priceOffer;
  num listInServices;
  String name;
  String description;
  String fullDescription;

  Item copyWith({
    num id,
    String image,
    num celebrityId,
    num serviceCategoryId,
    num isFeatured,
    num price,
    num priceOffer,
    num listInServices,
    String name,
    String description,
    String fullDescription,
  }) =>
      Item(
        id: id ?? this.id,
        image: image ?? this.image,
        celebrityId: celebrityId ?? this.celebrityId,
        serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
        isFeatured: isFeatured ?? this.isFeatured,
        price: price ?? this.price,
        priceOffer: priceOffer ?? this.priceOffer,
        listInServices: listInServices ?? this.listInServices,
        name: name ?? this.name,
        description: description ?? this.description,
        fullDescription: fullDescription ?? this.fullDescription,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    celebrityId: json["celebrity_id"] == null ? null : json["celebrity_id"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    price: json["price"] == null ? null : json["price"],
    priceOffer: json["price_offer"] == null ? null : json["price_offer"],
    listInServices: json["list_in_services"] == null ? null : json["list_in_services"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    fullDescription: json["full_description"] == null ? null : json["full_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "celebrity_id": celebrityId == null ? null : celebrityId,
    "service_category_id": serviceCategoryId == null ? null : serviceCategoryId,
    "is_featured": isFeatured == null ? null : isFeatured,
    "price": price == null ? null : price,
    "price_offer": priceOffer == null ? null : priceOffer,
    "list_in_services": listInServices == null ? null : listInServices,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "full_description": fullDescription == null ? null : fullDescription,
  };
}
