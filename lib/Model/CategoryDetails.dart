// To parse this JSON data, do
//
//     final categoryDetailsModel = categoryDetailsModelFromJson(jsonString);

import 'dart:convert';

CategoryDetailsModel categoryDetailsModelFromJson(String str) => CategoryDetailsModel.fromJson(json.decode(str));

String categoryDetailsModelToJson(CategoryDetailsModel data) => json.encode(data.toJson());

class CategoryDetailsModel {
  CategoryDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
    this.isMore,
  });

  bool status;
  num code;
  String message;
  CategoryDetailsModelItem item;
  bool isMore;

  CategoryDetailsModel copyWith({
    bool status,
    num code,
    String message,
    CategoryDetailsModelItem item,
    bool isMore,
  }) =>
      CategoryDetailsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
        isMore: isMore ?? this.isMore,
      );

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) => CategoryDetailsModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    item: json["item"] == null ? null : CategoryDetailsModelItem.fromJson(json["item"]),
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

class CategoryDetailsModelItem {
  CategoryDetailsModelItem({
    this.items,
    this.subCategories,
    this.total,
  });

  List<ItemElement> items;
  List<SubCategory> subCategories;
  num total;

  CategoryDetailsModelItem copyWith({
    List<ItemElement> items,
    List<SubCategory> subCategories,
    num total,
  }) =>
      CategoryDetailsModelItem(
        items: items ?? this.items,
        subCategories: subCategories ?? this.subCategories,
        total: total ?? this.total,
      );

  factory CategoryDetailsModelItem.fromJson(Map<String, dynamic> json) => CategoryDetailsModelItem(
    items: json["items"] == null ? null : List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
    subCategories: json["sub_categories"] == null ? null : List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "sub_categories": subCategories == null ? null : List<dynamic>.from(subCategories.map((x) => x.toJson())),
    "total": total == null ? null : total,
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
  List<ColorElement> colors;
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
    List<ColorElement> colors,
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
    colors: json["colors"] == null ? null : List<ColorElement>.from(json["colors"].map((x) => ColorElement.fromJson(x))),
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
    "colors": colors == null ? null : List<dynamic>.from(colors.map((x) => x.toJson())),
    "name": name == null ? null : name,
    "description": description == null ? null : description,
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

  ColorElement copyWith({
    num id,
    Code code,
    Status status,
    bool isDisabled,
    List<Variation> variations,
    String name,
  }) =>
      ColorElement(
        id: id ?? this.id,
        code: code ?? this.code,
        status: status ?? this.status,
        isDisabled: isDisabled ?? this.isDisabled,
        variations: variations ?? this.variations,
        name: name ?? this.name,
      );

  factory ColorElement.fromJson(Map<String, dynamic> json) => ColorElement(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : codeValues.map[json["code"]],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    isDisabled: json["is_disabled"] == null ? null : json["is_disabled"],
    variations: json["variations"] == null ? null : List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : codeValues.reverse[code],
    "status": status == null ? null : statusValues.reverse[status],
    "is_disabled": isDisabled == null ? null : isDisabled,
    "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
    "name": name == null ? null : name,
  };
}

enum Code { F00505, THE_0_FA10_C, THE_0033_FF, THE_000000 }

final codeValues = EnumValues({
  "#f00505": Code.F00505,
  "#000000": Code.THE_000000,
  "#0033ff": Code.THE_0033_FF,
  "#0fa10c": Code.THE_0_FA10_C
});

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
  HeightClass color;
  HeightClass size;
  HeightClass height;

  Variation copyWith({
    num id,
    num productId,
    num sizeId,
    num colorId,
    num heightId,
    num inStock,
    HeightClass color,
    HeightClass size,
    HeightClass height,
  }) =>
      Variation(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        sizeId: sizeId ?? this.sizeId,
        colorId: colorId ?? this.colorId,
        heightId: heightId ?? this.heightId,
        inStock: inStock ?? this.inStock,
        color: color ?? this.color,
        size: size ?? this.size,
        height: height ?? this.height,
      );

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    sizeId: json["size_id"] == null ? null : json["size_id"],
    colorId: json["color_id"] == null ? null : json["color_id"],
    heightId: json["height_id"] == null ? null : json["height_id"],
    inStock: json["in_stock"] == null ? null : json["in_stock"],
    color: json["color"] == null ? null : HeightClass.fromJson(json["color"]),
    size: json["size"] == null ? null : HeightClass.fromJson(json["size"]),
    height: json["height"] == null ? null : HeightClass.fromJson(json["height"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "size_id": sizeId == null ? null : sizeId,
    "color_id": colorId == null ? null : colorId,
    "height_id": heightId == null ? null : heightId,
    "in_stock": inStock == null ? null : inStock,
    "color": color == null ? null : color.toJson(),
    "size": size == null ? null : size.toJson(),
    "height": height == null ? null : height.toJson(),
  };
}

class HeightClass {
  HeightClass({
    this.id,
    this.code,
    this.status,
    this.name,
  });

  num id;
  Code code;
  Status status;
  String name;

  HeightClass copyWith({
    num id,
    Code code,
    Status status,
    String name,
  }) =>
      HeightClass(
        id: id ?? this.id,
        code: code ?? this.code,
        status: status ?? this.status,
        name: name ?? this.name,
      );

  factory HeightClass.fromJson(Map<String, dynamic> json) => HeightClass(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : codeValues.map[json["code"]],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : codeValues.reverse[code],
    "status": status == null ? null : statusValues.reverse[status],
    "name": name == null ? null : name,
  };
}

class SubCategory {
  SubCategory({
    this.id,
    this.image,
    this.bulkDiscount,
    this.numOfItems,
    this.isFeatured,
    this.name,
  });

  num id;
  String image;
  num bulkDiscount;
  num numOfItems;
  num isFeatured;
  String name;

  SubCategory copyWith({
    num id,
    String image,
    num bulkDiscount,
    num numOfItems,
    num isFeatured,
    String name,
  }) =>
      SubCategory(
        id: id ?? this.id,
        image: image ?? this.image,
        bulkDiscount: bulkDiscount ?? this.bulkDiscount,
        numOfItems: numOfItems ?? this.numOfItems,
        isFeatured: isFeatured ?? this.isFeatured,
        name: name ?? this.name,
      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
