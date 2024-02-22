// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.status,
    this.code,
    this.message,
    this.item,
    this.isMore,
  });

  bool status;
  int code;
  String message;
  SearchModelItem item;
  bool isMore;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    item: SearchModelItem.fromJson(json["item"]),
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

class SearchModelItem {
  SearchModelItem({
    this.items,
    this.total,
  });

  List<ItemElement> items;
  int total;

  factory SearchModelItem.fromJson(Map<String, dynamic> json) => SearchModelItem(
    items: List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "total": total,
  };
}

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
    this.colors,
    this.designerName,
    this.urlLink,
    this.name,
    this.description,
    this.designer,
  });

  int id;
  String image;
  int parentId;
  String sizeChart;
  int userId;
  int celebrityId;
  int categoryId;
  int subCategoryId;
  int inStock;
  String sku;
  int weight;
  int bestseller;
  int newCollection;
  int price;
  int priceOffer;
  int hasVariants;
  int countSale;
  double changedPrice;
  bool isFavorite;
  double changedPriceOffer;
  List<dynamic> colors;
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
    changedPrice: json["changed_price"].toDouble(),
    isFavorite: json["is_favorite"],
    changedPriceOffer: json["changed_price_offer"].toDouble(),
    colors: List<dynamic>.from(json["colors"].map((x) => x)),
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
    "colors": List<dynamic>.from(colors.map((x) => x)),
    "designer_name": designerName,
    "url_link": urlLink,
    "name": name,
    "description": description,
    "designer": designer.toJson(),
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
  double rate;
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
    status: json["status"],
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
