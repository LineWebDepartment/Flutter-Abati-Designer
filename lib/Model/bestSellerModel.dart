// To parse this JSON data, do
//
//     final bestSellerModel = bestSellerModelFromJson(jsonString);

import 'dart:convert';

BestSellerModel bestSellerModelFromJson(String str) => BestSellerModel.fromJson(json.decode(str));

String bestSellerModelToJson(BestSellerModel data) => json.encode(data.toJson());

class BestSellerModel {
  BestSellerModel({
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

  factory BestSellerModel.fromJson(Map<String, dynamic> json) => BestSellerModel(
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
    this.image,
    this.parentId,
    this.sizeChart,
    this.userId,
    this.celebrityId,
    this.categoryId,
    this.subCategoryId,
    this.inStock,
    this.sku,
    this.weight,
    this.bestseller,
    this.newCollection,
    this.price,
    this.priceOffer,
    this.hasVariants,
    this.countSale,
    this.changedPrice,
    this.isFavorite,
    this.changedPriceOffer,

    this.name,
    this.description,
  });

  num id;
  String image;
  num parentId;
  String sizeChart;
  num userId;
  num celebrityId;
  num categoryId;
  num subCategoryId;
  num inStock;
  String sku;
  num weight;
  num bestseller;
  num newCollection;
  num price;
  num priceOffer;
  num hasVariants;
  num countSale;
  num changedPrice;
  bool isFavorite;
  num changedPriceOffer;
  String name;
  String description;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    image: json["image"],
    parentId: json["parent_id"],
    sizeChart: json["size_chart"],
    userId: json["user_id"],
    celebrityId: json["celebrity_id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    inStock: json["in_stock"],
    sku: json["sku"],
    weight: json["weight"],
    bestseller: json["bestseller"],
    newCollection: json["new_collection"],
    price: json["price"],
    priceOffer: json["price_offer"],
    hasVariants: json["has_variants"],
    countSale: json["count_sale"],
    changedPrice: json["changed_price"],
    isFavorite: json["is_favorite"],
    changedPriceOffer: json["changed_price_offer"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "parent_id": parentId,
    "size_chart": sizeChart,
    "user_id": userId,
    "celebrity_id": celebrityId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "in_stock": inStock,
    "sku": sku,
    "weight": weight,
    "bestseller": bestseller,
    "new_collection": newCollection,
    "price": price,
    "price_offer": priceOffer,
    "has_variants": hasVariants,
    "count_sale": countSale,
    "changed_price": changedPrice,
    "is_favorite": isFavorite,
    "changed_price_offer": changedPriceOffer,
    "name": name,
    "description": description,
  };
}



enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class Variation {
  Variation({
    this.id,
    this.productId,
    this.sizeId,
    this.colorId,
    this.heightId,
    this.inStock,
    this.color,
    this.size,
    this.height,
  });

  num id;
  num productId;
  num sizeId;
  num colorId;
  num heightId;
  num inStock;
  SizeClass color;
  SizeClass size;
  SizeClass height;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    productId: json["product_id"],
    sizeId: json["size_id"],
    colorId: json["color_id"],
    heightId: json["height_id"],
    inStock: json["in_stock"],
    size: SizeClass.fromJson(json["size"]),
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "size_id": sizeId,
    "color_id": colorId,
    "height_id": heightId,
    "in_stock": inStock,
    "color": color.toJson(),
    "size": size.toJson(),
    "height": height,
  };
}

class SizeClass {
  SizeClass({
    this.id,

    this.status,
    this.name,
  });

  num id;

  Status status;
  String name;

  factory SizeClass.fromJson(Map<String, dynamic> json) => SizeClass(
    id: json["id"],
    status: statusValues.map[json["status"]],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,

    "status": statusValues.reverse[status],
    "name": name,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
