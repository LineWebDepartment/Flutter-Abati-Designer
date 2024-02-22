// To parse this JSON data, do
//
//     final celebrityDetailsModel = celebrityDetailsModelFromJson(jsonString);

import 'dart:convert';

CelebrityDetailsModel celebrityDetailsModelFromJson(String str) => CelebrityDetailsModel.fromJson(json.decode(str));

String celebrityDetailsModelToJson(CelebrityDetailsModel data) => json.encode(data.toJson());

class CelebrityDetailsModel {
  CelebrityDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
    this.isMore,
  });

  bool status;
  num code;
  String message;
  CelebrityDetailsModelItem item;
  bool isMore;

  CelebrityDetailsModel copyWith({
    bool status,
    num code,
    String message,
    CelebrityDetailsModelItem item,
    bool isMore,
  }) =>
      CelebrityDetailsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
        isMore: isMore ?? this.isMore,
      );

  factory CelebrityDetailsModel.fromJson(Map<String, dynamic> json) => CelebrityDetailsModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    item: json["item"] == null ? null : CelebrityDetailsModelItem.fromJson(json["item"]),
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

class CelebrityDetailsModelItem {
  CelebrityDetailsModelItem({
    this.celebrity,
    this.items,
  });

  Celebrity celebrity;
  List<ItemElement> items;

  CelebrityDetailsModelItem copyWith({
    Celebrity celebrity,
    List<ItemElement> items,
  }) =>
      CelebrityDetailsModelItem(
        celebrity: celebrity ?? this.celebrity,
        items: items ?? this.items,
      );

  factory CelebrityDetailsModelItem.fromJson(Map<String, dynamic> json) => CelebrityDetailsModelItem(
    celebrity: json["celebrity"] == null ? null : Celebrity.fromJson(json["celebrity"]),
    items: json["items"] == null ? null : List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "celebrity": celebrity == null ? null : celebrity.toJson(),
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Celebrity {
  Celebrity({
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
    this.urlLink
  });

  num id;
  String image;
  String email;
  String mobile;
  num sortOrder;
  num isFeatured;
  num numOfProducts;
  num numOfServices;
  String status;
  String name;
  String description;
  String urlLink;

  Celebrity copyWith({
    num id,
    String image,
    String email,
    String mobile,
    num sortOrder,
    num isFeatured,
    num numOfProducts,
    num numOfServices,
    String status,
    String name,
    String description,
    String urlLink,
  }) =>
      Celebrity(
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
        urlLink: urlLink ?? this.urlLink,
      );

  factory Celebrity.fromJson(Map<String, dynamic> json) => Celebrity(
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
    urlLink: json["url_link"] == null ? null : json["url_link"],
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
    "url_link": urlLink == null ? null : urlLink,
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
  List<dynamic> colors;
  String name;
  String description;

  ItemElement copyWith({
    num id,
    String image,
    num parentId,
    String sizeChart,
    num userId,
    num celebrityId,
    num categoryId,
    num subCategoryId,
    num inStock,
    String sku,
    num weight,
    num bestseller,
    num newCollection,
    num price,
    num priceOffer,
    num hasVariants,
    num countSale,
    num changedPrice,
    bool isFavorite,
    num changedPriceOffer,
    List<dynamic> colors,
    String name,
    String description,
  }) =>
      ItemElement(
        id: id ?? this.id,
        image: image ?? this.image,
        parentId: parentId ?? this.parentId,
        sizeChart: sizeChart ?? this.sizeChart,
        userId: userId ?? this.userId,
        celebrityId: celebrityId ?? this.celebrityId,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        inStock: inStock ?? this.inStock,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        bestseller: bestseller ?? this.bestseller,
        newCollection: newCollection ?? this.newCollection,
        price: price ?? this.price,
        priceOffer: priceOffer ?? this.priceOffer,
        hasVariants: hasVariants ?? this.hasVariants,
        countSale: countSale ?? this.countSale,
        changedPrice: changedPrice ?? this.changedPrice,
        isFavorite: isFavorite ?? this.isFavorite,
        changedPriceOffer: changedPriceOffer ?? this.changedPriceOffer,
        colors: colors ?? this.colors,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    sizeChart: json["size_chart"] == null ? null : json["size_chart"],
    userId: json["user_id"] == null ? null : json["user_id"],
    celebrityId: json["celebrity_id"] == null ? null : json["celebrity_id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    subCategoryId: json["sub_category_id"] == null ? null : json["sub_category_id"],
    inStock: json["in_stock"] == null ? null : json["in_stock"],
    sku: json["sku"] == null ? null : json["sku"],
    weight: json["weight"] == null ? null : json["weight"],
    bestseller: json["bestseller"] == null ? null : json["bestseller"],
    newCollection: json["new_collection"] == null ? null : json["new_collection"],
    price: json["price"] == null ? null : json["price"],
    priceOffer: json["price_offer"] == null ? null : json["price_offer"],
    hasVariants: json["has_variants"] == null ? null : json["has_variants"],
    countSale: json["count_sale"] == null ? null : json["count_sale"],
    changedPrice: json["changed_price"] == null ? null : json["changed_price"],
    isFavorite: json["is_favorite"] == null ? null : json["is_favorite"],
    changedPriceOffer: json["changed_price_offer"] == null ? null : json["changed_price_offer"],
    colors: json["colors"] == null ? null : List<dynamic>.from(json["colors"].map((x) => x)),
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "parent_id": parentId == null ? null : parentId,
    "size_chart": sizeChart == null ? null : sizeChart,
    "user_id": userId == null ? null : userId,
    "celebrity_id": celebrityId == null ? null : celebrityId,
    "category_id": categoryId == null ? null : categoryId,
    "sub_category_id": subCategoryId == null ? null : subCategoryId,
    "in_stock": inStock == null ? null : inStock,
    "sku": sku == null ? null : sku,
    "weight": weight == null ? null : weight,
    "bestseller": bestseller == null ? null : bestseller,
    "new_collection": newCollection == null ? null : newCollection,
    "price": price == null ? null : price,
    "price_offer": priceOffer == null ? null : priceOffer,
    "has_variants": hasVariants == null ? null : hasVariants,
    "count_sale": countSale == null ? null : countSale,
    "changed_price": changedPrice == null ? null : changedPrice,
    "is_favorite": isFavorite == null ? null : isFavorite,
    "changed_price_offer": changedPriceOffer == null ? null : changedPriceOffer,
    "colors": colors == null ? null : List<dynamic>.from(colors.map((x) => x)),
    "name": name == null ? null : name,
    "description": description == null ? null : description,
  };
}
