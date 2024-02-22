// To parse this JSON data, do
//
//     final designerDetails = designerDetailsFromJson(jsonString);

import 'dart:convert';

DesignerDetailsModel designerDetailsFromJson(String str) => DesignerDetailsModel.fromJson(json.decode(str));

String designerDetailsToJson(DesignerDetailsModel data) => json.encode(data.toJson());

class DesignerDetailsModel {
  DesignerDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
    this.isMore,
  });

  bool status;
  num code;
  String message;
  DesignerDetailsItem item;
  bool isMore;

  factory DesignerDetailsModel.fromJson(Map<String, dynamic> json) => DesignerDetailsModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    item: DesignerDetailsItem.fromJson(json["item"]),
    isMore: json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "item": item.toJson(),
    "is_more": isMore,
  };
}

class DesignerDetailsItem {
  DesignerDetailsItem({
    this.designer,
    this.items,
    this.total,
  });

  Designer designer;
  List<ItemElement> items;
  num total;

  factory DesignerDetailsItem.fromJson(Map<String, dynamic> json) => DesignerDetailsItem(
    designer: Designer.fromJson(json["designer"]),
    items: List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "designer": designer.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "total": total,
  };
}

class Designer {
  Designer({
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

  num id;
  String name;
  String mobile;
  String email;
  num numOfProducts;
  num numOfOrders;
  num numOfBookings;
  Status status;
  String image;
  num isFeatured;
  String type;
  num rate;
  String size;
  dynamic supplierCode;
  String isDeleted;
  bool isRated;
  dynamic myRate;
  String designerName;
  String designerDescription;
  String discountLabel;

  factory Designer.fromJson(Map<String, dynamic> json) => Designer(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    numOfProducts: json["num_of_products"],
    numOfOrders: json["num_of_orders"],
    numOfBookings: json["num_of_bookings"],
    status: statusValues.map[json["status"]],
    image: json["image"],
    isFeatured: json["is_featured"],
    type: json["type"],
    rate: json["rate"].toDouble(),
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
    "status": statusValues.reverse[status],
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

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class ItemElement {
  ItemElement({
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
    // this.colors,
    this.designerName,
    this.urlLink,
    this.name,
    this.description,
    this.designer,
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
  // List<ColorElement> colors;
  String designerName;
  String urlLink;
  String name;
  String description;
  Designer designer;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
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
    // colors: List<ColorElement>.from(json["colors"].map((x) => ColorElement.fromJson(x))),
    designerName: json["designer_name"],
    urlLink: json["url_link"],
    name: json["name"],
    description: json["description"],
    designer: Designer.fromJson(json["designer"]),
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
    // "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "designer_name": designerName,
    "url_link": urlLink,
    "name": name,
    "description": description,
    "designer": designer.toJson(),
  };
}

class ColorElement {
  ColorElement({
    this.id,
    this.code,
    this.status,
    this.isDisabled,
    this.variations,
    this.name,
  });

  num id;
  Code code;
  Status status;
  bool isDisabled;
  List<Variation> variations;
  String name;

  factory ColorElement.fromJson(Map<String, dynamic> json) => ColorElement(
    id: json["id"],
    code: codeValues.map[json["code"]],
    status: statusValues.map[json["status"]],
    isDisabled: json["is_disabled"],
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": codeValues.reverse[code],
    "status": statusValues.reverse[status],
    "is_disabled": isDisabled,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    "name": name,
  };
}

enum Code { F00505, THE_0_FA10_C, THE_0033_FF, THE_000000 }

final codeValues = EnumValues({
  "#f00505": Code.F00505,
  "#000000": Code.THE_000000,
  "#0033ff": Code.THE_0033_FF,
  "#0fa10c": Code.THE_0_FA10_C
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
    color: SizeClass.fromJson(json["color"]),
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
    this.code,
    this.status,
    this.name,
  });

  num id;
  Code code;
  Status status;
  String name;

  factory SizeClass.fromJson(Map<String, dynamic> json) => SizeClass(
    id: json["id"],
    code: json["code"],
    status: statusValues.map[json["status"]],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
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
