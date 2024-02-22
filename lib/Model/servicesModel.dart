// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

MainServicesModel servicesModelFromJson(String str) => MainServicesModel.fromJson(json.decode(str));

String servicesModelToJson(MainServicesModel data) => json.encode(data.toJson());

class MainServicesModel {
  MainServicesModel({
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

  factory MainServicesModel.fromJson(Map<String, dynamic> json) => MainServicesModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    isMore: json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": items == null ? [] : List<dynamic>.from(items.map((x) => x.toJson())),
    "is_more": isMore,
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    image: json["image"],
    celebrityId: json["celebrity_id"],
    serviceCategoryId: json["service_category_id"],
    isFeatured: json["is_featured"],
    price: json["price"],
    priceOffer: json["price_offer"],
    listInServices: json["list_in_services"],
    name: json["name"],
    description: json["description"],
    fullDescription: json["full_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "celebrity_id": celebrityId,
    "service_category_id": serviceCategoryId,
    "is_featured": isFeatured,
    "price": price,
    "price_offer": priceOffer,
    "list_in_services": listInServices,
    "name": name,
    "description": description,
    "full_description": fullDescription,
  };
}
