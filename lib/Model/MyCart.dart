// To parse this JSON data, do
//
//     final myCartModel = myCartModelFromJson(jsonString);

import 'dart:convert';

MyCartModel myCartModelFromJson(String str) => MyCartModel.fromJson(json.decode(str));

String myCartModelToJson(MyCartModel data) => json.encode(data.toJson());

class MyCartModel {
  MyCartModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  num code;
  String message;
  MyCartModelItem item;

  MyCartModel copyWith({
    bool status,
    num code,
    String message,
    MyCartModelItem item,
  }) =>
      MyCartModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory MyCartModel.fromJson(Map<String, dynamic> json) => MyCartModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    item: json["item"] == null ? null : MyCartModelItem.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "item": item == null ? null : item.toJson(),
  };
}

class MyCartModelItem {
  MyCartModelItem({
    this.items,
    this.subTotal,
    this.changedSubTotal,
  });

  List<ItemElement> items;
  num subTotal;
  double changedSubTotal;

  MyCartModelItem copyWith({
    List<ItemElement> items,
    num subTotal,
    double changedSubTotal,
  }) =>
      MyCartModelItem(
        items: items ?? this.items,
        subTotal: subTotal ?? this.subTotal,
        changedSubTotal: changedSubTotal ?? this.changedSubTotal,
      );

  factory MyCartModelItem.fromJson(Map<String, dynamic> json) => MyCartModelItem(
    items: json["items"] == null ? null : List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
    subTotal: json["sub_total"] == null ? null : json["sub_total"],
    changedSubTotal: json["changed_sub_total"] == null ? null : json["changed_sub_total"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "sub_total": subTotal == null ? null : subTotal,
    "changed_sub_total": changedSubTotal == null ? null : changedSubTotal,
  };
}

class ItemElement {
  ItemElement({
    this.id,
    this.fcmToken,
    this.userId,
    this.productId,
    this.quantity,
    this.vareiationId,
    this.colorId,
    this.sizeId,
    this.heightId,
    this.userSpecialSize,
    this.giftWrapping,
    this.note,
    this.createdAt,
    this.product,
    this.color,
    this.size,
    this.height,
  });

  num id;
  String fcmToken;
  num userId;
  num productId;
  num quantity;
  num vareiationId;
  num colorId;
  num sizeId;
  num heightId;
  String userSpecialSize;
  num giftWrapping;
  String note;
  DateTime createdAt;
  Product product;
  HeightClass color;
  HeightClass size;
  HeightClass height;

  ItemElement copyWith({
    num id,
    String fcmToken,
    num userId,
    num productId,
    num quantity,
    num vareiationId,
    num colorId,
    num sizeId,
    num heightId,
    String userSpecialSize,
    num giftWrapping,
    String note,
    DateTime createdAt,
    Product product,
    HeightClass color,
    HeightClass size,
    HeightClass height,
  }) =>
      ItemElement(
        id: id ?? this.id,
        fcmToken: fcmToken ?? this.fcmToken,
        userId: userId ?? this.userId,
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        vareiationId: vareiationId ?? this.vareiationId,
        colorId: colorId ?? this.colorId,
        sizeId: sizeId ?? this.sizeId,
        heightId: heightId ?? this.heightId,
        userSpecialSize: userSpecialSize ?? this.userSpecialSize,
        giftWrapping: giftWrapping ?? this.giftWrapping,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        product: product ?? this.product,
        color: color ?? this.color,
        size: size ?? this.size,
        height: height ?? this.height,
      );

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
    id: json["id"] == null ? null : json["id"],
    fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
    userId: json["user_id"] == null ? null : json["user_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    vareiationId: json["vareiation_id"] == null ? null : json["vareiation_id"],
    colorId: json["color_id"] == null ? null : json["color_id"],
    sizeId: json["size_id"] == null ? null : json["size_id"],
    heightId: json["height_id"] == null ? null : json["height_id"],
    userSpecialSize: json["user_special_size"] == null ? null : json["user_special_size"],
    giftWrapping: json["gift_wrapping"] == null ? null : json["gift_wrapping"],
    note: json["note"] == null ? null : json["note"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    color: json["color"] == null ? null : HeightClass.fromJson(json["color"]),
    size: json["size"] == null ? null : HeightClass.fromJson(json["size"]),
    height: json["height"] == null ? null : HeightClass.fromJson(json["height"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fcm_token": fcmToken == null ? null : fcmToken,
    "user_id": userId == null ? null : userId,
    "product_id": productId == null ? null : productId,
    "quantity": quantity == null ? null : quantity,
    "vareiation_id": vareiationId == null ? null : vareiationId,
    "color_id": colorId == null ? null : colorId,
    "size_id": sizeId == null ? null : sizeId,
    "height_id": heightId == null ? null : heightId,
    "user_special_size": userSpecialSize == null ? null : userSpecialSize,
    "gift_wrapping": giftWrapping == null ? null : giftWrapping,
    "note": note == null ? null : note,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "product": product == null ? null : product.toJson(),
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

enum Code { THE_000000, F00505, THE_0_FA10_C, THE_0033_FF }

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

class Product {
  Product({
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
  double changedPrice;
  bool isFavorite;
  double changedPriceOffer;
  List<ColorElement> colors;
  String name;
  String description;
  Designer designer;

  Product copyWith({
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
    double changedPrice,
    bool isFavorite,
    double changedPriceOffer,
    List<ColorElement> colors,
    String name,
    String description,
    Designer designer,
  }) =>
      Product(
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
        designer: designer ?? this.designer,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    designer: json["designer"] == null ? null : Designer.fromJson(json["designer"]),
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
    "designer": designer == null ? null : designer.toJson(),
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
  double rate;
  String size;
  dynamic supplierCode;
  String isDeleted;
  bool isRated;
  dynamic myRate;
  String designerName;
  String designerDescription;
  String discountLabel;

  Designer copyWith({
    num id,
    String name,
    String mobile,
    String email,
    num numOfProducts,
    num numOfOrders,
    num numOfBookings,
    Status status,
    String image,
    num isFeatured,
    String type,
    double rate,
    String size,
    dynamic supplierCode,
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
    supplierCode: json["supplier_code"],
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
    "supplier_code": supplierCode,
    "is_deleted": isDeleted == null ? null : isDeleted,
    "is_rated": isRated == null ? null : isRated,
    "my_rate": myRate,
    "designer_name": designerName == null ? null : designerName,
    "designer_description": designerDescription == null ? null : designerDescription,
    "discount_label": discountLabel == null ? null : discountLabel,
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
