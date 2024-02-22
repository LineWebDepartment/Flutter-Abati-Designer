// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  int code;
  String message;
  Item item;

  HomeModel copyWith({
    bool status,
    int code,
    String message,
    Item item,
  }) =>
      HomeModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "item": item == null ? null : item.toJson(),
  };
}

class Item {
  Item({
    this.banners,
    this.categories,
    this.services,
    this.celebrities,
    this.bestseller,
    this.newCollection,
    this.designers,
  });

  List<Banner> banners;
  List<Category> categories;
  List<Service> services;
  List<Celebrity> celebrities;
  List<Bestseller> bestseller;
  List<Bestseller> newCollection;
  List<Designer> designers;

  Item copyWith({
    List<Banner> banners,
    List<Category> categories,
    List<Service> services,
    List<Celebrity> celebrities,
    List<Bestseller> bestseller,
    List<Bestseller> newCollection,
    List<Designer> designers,
  }) =>
      Item(
        banners: banners ?? this.banners,
        categories: categories ?? this.categories,
        services: services ?? this.services,
        celebrities: celebrities ?? this.celebrities,
        bestseller: bestseller ?? this.bestseller,
        newCollection: newCollection ?? this.newCollection,
        designers: designers ?? this.designers,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    banners: json["banners"] == null ? null : List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    services: json["services"] == null ? null : List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    celebrities: json["celebrities"] == null ? null : List<Celebrity>.from(json["celebrities"].map((x) => Celebrity.fromJson(x))),
    bestseller: json["bestseller"] == null ? null : List<Bestseller>.from(json["bestseller"].map((x) => Bestseller.fromJson(x))),
    newCollection: json["new_collection"] == null ? null : List<Bestseller>.from(json["new_collection"].map((x) => Bestseller.fromJson(x))),
    designers: json["designers"] == null ? null : List<Designer>.from(json["designers"].map((x) => Designer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": banners == null ? null : List<dynamic>.from(banners.map((x) => x.toJson())),
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
    "services": services == null ? null : List<dynamic>.from(services.map((x) => x.toJson())),
    "celebrities": celebrities == null ? null : List<dynamic>.from(celebrities.map((x) => x.toJson())),
    "bestseller": bestseller == null ? null : List<dynamic>.from(bestseller.map((x) => x.toJson())),
    "new_collection": newCollection == null ? null : List<dynamic>.from(newCollection.map((x) => x.toJson())),
    "designers": designers == null ? null : List<dynamic>.from(designers.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    this.id,
    this.image,
    this.targetId,
    this.targetType,
    this.bannerType,
    this.status,
    this.createdAt,
  });

  int id;
  String image;
  int targetId;
  int targetType;
  int bannerType;
  Status status;
  DateTime createdAt;

  Banner copyWith({
    int id,
    String image,
    int targetId,
    int targetType,
    int bannerType,
    Status status,
    DateTime createdAt,
  }) =>
      Banner(
        id: id ?? this.id,
        image: image ?? this.image,
        targetId: targetId ?? this.targetId,
        targetType: targetType ?? this.targetType,
        bannerType: bannerType ?? this.bannerType,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    targetId: json["target_id"] == null ? null : json["target_id"],
    targetType: json["target_type"] == null ? null : json["target_type"],
    bannerType: json["banner_type"] == null ? null : json["banner_type"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "target_id": targetId == null ? null : targetId,
    "target_type": targetType == null ? null : targetType,
    "banner_type": bannerType == null ? null : bannerType,
    "status": status == null ? null : statusValues.reverse[status],
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class Bestseller {
  Bestseller({
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
  List<ColorElement> colors;
  String name;
  String description;

  Bestseller copyWith({
    int id,
    String image,
    int parentId,
    String sizeChart,
    int userId,
    int celebrityId,
    int categoryId,
    int subCategoryId,
    int inStock,
    String sku,
    int weight,
    int bestseller,
    int newCollection,
    int price,
    int priceOffer,
    int hasVariants,
    int countSale,
    double changedPrice,
    bool isFavorite,
    double changedPriceOffer,
    List<ColorElement> colors,
    String name,
    String description,
  }) =>
      Bestseller(
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

  factory Bestseller.fromJson(Map<String, dynamic> json) => Bestseller(
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
    changedPrice: json["changed_price"] == null ? null : json["changed_price"].toDouble(),
    isFavorite: json["is_favorite"] == null ? null : json["is_favorite"],
    changedPriceOffer: json["changed_price_offer"] == null ? null : json["changed_price_offer"].toDouble(),
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

  int id;
  Code code;
  Status status;
  bool isDisabled;
  List<Variation> variations;
  String name;

  ColorElement copyWith({
    int id,
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

  int id;
  int productId;
  int sizeId;
  int colorId;
  int heightId;
  int inStock;
  HeightClass color;
  HeightClass size;
  HeightClass height;

  Variation copyWith({
    int id,
    int productId,
    int sizeId,
    int colorId,
    int heightId,
    int inStock,
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

  int id;
  Code code;
  Status status;
  String name;

  HeightClass copyWith({
    int id,
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

class Category {
  Category({
    this.id,
    this.image,
    this.bulkDiscount,
    this.numOfItems,
    this.isFeatured,
    this.name,
  });

  int id;
  String image;
  int bulkDiscount;
  int numOfItems;
  int isFeatured;
  String name;

  Category copyWith({
    int id,
    String image,
    int bulkDiscount,
    int numOfItems,
    int isFeatured,
    String name,
  }) =>
      Category(
        id: id ?? this.id,
        image: image ?? this.image,
        bulkDiscount: bulkDiscount ?? this.bulkDiscount,
        numOfItems: numOfItems ?? this.numOfItems,
        isFeatured: isFeatured ?? this.isFeatured,
        name: name ?? this.name,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
  });

  int id;
  String image;
  String email;
  String mobile;
  int sortOrder;
  int isFeatured;
  int numOfProducts;
  int numOfServices;
  Status status;
  String name;
  String description;

  Celebrity copyWith({
    int id,
    String image,
    String email,
    String mobile,
    int sortOrder,
    int isFeatured,
    int numOfProducts,
    int numOfServices,
    Status status,
    String name,
    String description,
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
    status: json["status"] == null ? null : statusValues.map[json["status"]],
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
    "status": status == null ? null : statusValues.reverse[status],
    "name": name == null ? null : name,
    "description": description == null ? null : description,
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
  Status status;
  String image;
  int isFeatured;
  String type;
  double rate;
  String size;
  String supplierCode;
  String isDeleted;
  bool isRated;
  dynamic myRate;
  String designerName;
  String designerDescription;
  String discountLabel;

  Designer copyWith({
    int id,
    String name,
    String mobile,
    String email,
    int numOfProducts,
    int numOfOrders,
    int numOfBookings,
    Status status,
    String image,
    int isFeatured,
    String type,
    double rate,
    String size,
    String supplierCode,
    String isDeleted,
    bool isRated,
    dynamic myRate,
    String designerName,
    String designerDescription,
    String discountLabel,
  }) =>
      Designer(
        id: id ?? this.id,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        numOfProducts: numOfProducts ?? this.numOfProducts,
        numOfOrders: numOfOrders ?? this.numOfOrders,
        numOfBookings: numOfBookings ?? this.numOfBookings,
        status: status ?? this.status,
        image: image ?? this.image,
        isFeatured: isFeatured ?? this.isFeatured,
        type: type ?? this.type,
        rate: rate ?? this.rate,
        size: size ?? this.size,
        supplierCode: supplierCode ?? this.supplierCode,
        isDeleted: isDeleted ?? this.isDeleted,
        isRated: isRated ?? this.isRated,
        myRate: myRate ?? this.myRate,
        designerName: designerName ?? this.designerName,
        designerDescription: designerDescription ?? this.designerDescription,
        discountLabel: discountLabel ?? this.discountLabel,
      );

  factory Designer.fromJson(Map<String, dynamic> json) => Designer(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
    numOfProducts: json["num_of_products"] == null ? null : json["num_of_products"],
    numOfOrders: json["num_of_orders"] == null ? null : json["num_of_orders"],
    numOfBookings: json["num_of_bookings"] == null ? null : json["num_of_bookings"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    image: json["image"] == null ? null : json["image"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    type: json["type"] == null ? null : json["type"],
    rate: json["rate"] == null ? null : json["rate"].toDouble(),
    size: json["size"] == null ? null : json["size"],
    supplierCode: json["supplier_code"] == null ? null : json["supplier_code"],
    isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
    isRated: json["is_rated"] == null ? null : json["is_rated"],
    myRate: json["my_rate"],
    designerName: json["designer_name"] == null ? null : json["designer_name"],
    designerDescription: json["designer_description"] == null ? null : json["designer_description"],
    discountLabel: json["discount_label"] == null ? null : json["discount_label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "mobile": mobile == null ? null : mobile,
    "email": email == null ? null : email,
    "num_of_products": numOfProducts == null ? null : numOfProducts,
    "num_of_orders": numOfOrders == null ? null : numOfOrders,
    "num_of_bookings": numOfBookings == null ? null : numOfBookings,
    "status": status == null ? null : statusValues.reverse[status],
    "image": image == null ? null : image,
    "is_featured": isFeatured == null ? null : isFeatured,
    "type": type == null ? null : type,
    "rate": rate == null ? null : rate,
    "size": size == null ? null : size,
    "supplier_code": supplierCode == null ? null : supplierCode,
    "is_deleted": isDeleted == null ? null : isDeleted,
    "is_rated": isRated == null ? null : isRated,
    "my_rate": myRate,
    "designer_name": designerName == null ? null : designerName,
    "designer_description": designerDescription == null ? null : designerDescription,
    "discount_label": discountLabel == null ? null : discountLabel,
  };
}

class Service {
  Service({
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

  int id;
  String image;
  int celebrityId;
  int serviceCategoryId;
  int isFeatured;
  int price;
  int priceOffer;
  int listInServices;
  String name;
  String description;
  String fullDescription;

  Service copyWith({
    int id,
    String image,
    int celebrityId,
    int serviceCategoryId,
    int isFeatured,
    int price,
    int priceOffer,
    int listInServices,
    String name,
    String description,
    String fullDescription,
  }) =>
      Service(
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

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
