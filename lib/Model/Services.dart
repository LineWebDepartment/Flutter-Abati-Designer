// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  ServicesModel({
    this.status,
    this.code,
    this.message,
    this.item,
    this.isMore,
  });

  bool status;
  num code;
  String message;
  ServicesModelItem item;
  bool isMore;

  ServicesModel copyWith({
    bool status,
    num code,
    String message,
    ServicesModelItem item,
    bool isMore,
  }) =>
      ServicesModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
        isMore: isMore ?? this.isMore,
      );

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    item: json["item"] == null ? null : ServicesModelItem.fromJson(json["item"]),
    isMore: json["is_more"] == null ? null : json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "item": item == null ? null : item.toJson(),
    "is_more": isMore == null ? null : isMore,
  };
}

class ServicesModelItem {
  ServicesModelItem({
    this.items,
    this.total,
  });

  List<ItemElement> items;
  num total;

  ServicesModelItem copyWith({
    List<ItemElement> items,
    num total,
  }) =>
      ServicesModelItem(
        items: items ?? this.items,
        total: total ?? this.total,
      );

  factory ServicesModelItem.fromJson(Map<String, dynamic> json) => ServicesModelItem(
    items: json["items"] == null ? null : List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "total": total == null ? null : total,
  };
}

class ItemElement {
  ItemElement({
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

  ItemElement copyWith({
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
      ItemElement(
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

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
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
