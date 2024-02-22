// To parse this JSON data, do
//
//     final myOrderDetailsModel = myOrderDetailsModelFromJson(jsonString);

import 'dart:convert';

MyOrderDetailsModel myOrderDetailsModelFromJson(String str) => MyOrderDetailsModel.fromJson(json.decode(str));

String myOrderDetailsModelToJson(MyOrderDetailsModel data) => json.encode(data.toJson());

class MyOrderDetailsModel {
  MyOrderDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
    this.products,
  });

  bool status;
  int code;
  String message;
  MyOrderDetailsModelItem item;
  List<ProductElement> products;

  factory MyOrderDetailsModel.fromJson(Map<String, dynamic> json) => MyOrderDetailsModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    item: MyOrderDetailsModelItem.fromJson(json["item"]),
    products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "item": item.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class MyOrderDetailsModelItem {
  MyOrderDetailsModelItem({
    this.id,
    this.userId,
    this.fcmToken,
    this.countryId,
    this.addressCountryId,
    this.areaId,
    this.firstAddressLine,
    this.secondAddressLine,
    this.extraDirections,
    this.addressId,
    this.total,
    this.subTotal,
    this.discount,
    this.changeRate,
    this.changedSubTotal,
    this.changedTotal,
    this.changedDiscount,
    this.deliveryCharge,
    this.changedDeliveryCharge,
    this.promoCodeId,
    this.promoCodeName,
    this.promoCodePercentage,
    this.customerName,
    this.customerEmail,
    this.customerMobile,
    this.paymentMethod,
    this.paymentStatus,
    this.transactionId,
    this.paymentId,
    this.refundKey,
    this.refundId,
    this.refundReference,
    this.refundAmount,
    this.status,
    this.designerAcceptance,
    this.trackingNumber,
    this.createdAt,
    this.isMissing,
    this.statusText,
    this.numOfOrders,
    this.numOfOrdersForThisDesigner,
    this.country,
    this.addressCountry,
  });

  int id;
  dynamic userId;
  String fcmToken;
  String countryId;
  String addressCountryId;
  String areaId;
  String firstAddressLine;
  String secondAddressLine;
  String extraDirections;
  dynamic addressId;
  num total;
  int subTotal;
  int discount;
  int changeRate;
  int changedSubTotal;
  int changedTotal;
  int changedDiscount;
  int deliveryCharge;
  int changedDeliveryCharge;
  dynamic promoCodeId;
  dynamic promoCodeName;
  int promoCodePercentage;
  String customerName;
  String customerEmail;
  String customerMobile;
  int paymentMethod;
  int paymentStatus;
  String transactionId;
  String paymentId;
  dynamic refundKey;
  dynamic refundId;
  dynamic refundReference;
  dynamic refundAmount;
  String status;
  int designerAcceptance;
  dynamic trackingNumber;
  DateTime createdAt;
  bool isMissing;
  String statusText;
  int numOfOrders;
  int numOfOrdersForThisDesigner;
  Country country;
  Country addressCountry;

  factory MyOrderDetailsModelItem.fromJson(Map<String, dynamic> json) => MyOrderDetailsModelItem(
    id: json["id"],
    userId: json["user_id"],
    fcmToken: json["fcm_token"],
    countryId: json["country_id"],
    addressCountryId: json["address_country_id"],
    areaId: json["area_id"],
    firstAddressLine: json["first_address_line"],
    secondAddressLine: json["second_address_line"],
    extraDirections: json["extra_directions"],
    addressId: json["address_id"],
    total: json["total"],
    subTotal: json["sub_total"],
    discount: json["discount"],
    changeRate: json["change_rate"],
    changedSubTotal: json["changed_sub_total"],
    changedTotal: json["changed_total"],
    changedDiscount: json["changed_discount"],
    deliveryCharge: json["delivery_charge"],
    changedDeliveryCharge: json["changed_delivery_charge"],
    promoCodeId: json["promo_code_id"],
    promoCodeName: json["promo_code_name"],
    promoCodePercentage: json["promo_code_percentage"],
    customerName: json["customer_name"],
    customerEmail: json["customer_email"],
    customerMobile: json["customer_mobile"],
    paymentMethod: json["payment_method"],
    paymentStatus: json["payment_status"],
    transactionId: json["transaction_id"],
    paymentId: json["payment_id"],
    refundKey: json["refund_Key"],
    refundId: json["refund_id"],
    refundReference: json["refund_reference"],
    refundAmount: json["refund_amount"],
    status: json["status"],
    designerAcceptance: json["designer_acceptance"],
    trackingNumber: json["tracking_number"],
    createdAt: DateTime.parse(json["created_at"]),
    isMissing: json["is_missing"],
    statusText: json["status_text"],
    numOfOrders: json["num_of_orders"],
    numOfOrdersForThisDesigner: json["num_of_orders_for_this_designer"],
    country: Country.fromJson(json["country"]),
    addressCountry: Country.fromJson(json["address_country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "fcm_token": fcmToken,
    "country_id": countryId,
    "address_country_id": addressCountryId,
    "area_id": areaId,
    "first_address_line": firstAddressLine,
    "second_address_line": secondAddressLine,
    "extra_directions": extraDirections,
    "address_id": addressId,
    "total": total,
    "sub_total": subTotal,
    "discount": discount,
    "change_rate": changeRate,
    "changed_sub_total": changedSubTotal,
    "changed_total": changedTotal,
    "changed_discount": changedDiscount,
    "delivery_charge": deliveryCharge,
    "changed_delivery_charge": changedDeliveryCharge,
    "promo_code_id": promoCodeId,
    "promo_code_name": promoCodeName,
    "promo_code_percentage": promoCodePercentage,
    "customer_name": customerName,
    "customer_email": customerEmail,
    "customer_mobile": customerMobile,
    "payment_method": paymentMethod,
    "payment_status": paymentStatus,
    "transaction_id": transactionId,
    "payment_id": paymentId,
    "refund_Key": refundKey,
    "refund_id": refundId,
    "refund_reference": refundReference,
    "refund_amount": refundAmount,
    "status": status,
    "designer_acceptance": designerAcceptance,
    "tracking_number": trackingNumber,
    "created_at": createdAt.toIso8601String(),
    "is_missing": isMissing,
    "status_text": statusText,
    "num_of_orders": numOfOrders,
    "num_of_orders_for_this_designer": numOfOrdersForThisDesigner,
    "country": country.toJson(),
    "address_country": addressCountry.toJson(),
  };
}

class Country {
  Country({
    this.id,
    this.image,
    this.changeRate,
    this.mobileIntro,
    this.deliveryCharge,
    this.isoCode,
    this.status,
    this.name,
    this.currencyName,
    this.shortCode,
  });

  int id;
  String image;
  int changeRate;
  int mobileIntro;
  int deliveryCharge;
  String isoCode;
  Status status;
  String name;
  String currencyName;
  String shortCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    image: json["image"],
    changeRate: json["change_rate"],
    mobileIntro: json["mobile_intro"],
    deliveryCharge: json["delivery_charge"],
    isoCode: json["iso_code"],
    status: statusValues.map[json["status"]],
    name: json["name"],
    currencyName: json["currency_name"],
    shortCode: json["short_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "change_rate": changeRate,
    "mobile_intro": mobileIntro,
    "delivery_charge": deliveryCharge,
    "iso_code": isoCode,
    "status": statusValues.reverse[status],
    "name": name,
    "currency_name": currencyName,
    "short_code": shortCode,
  };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class ProductElement {
  ProductElement({
    this.user,
    this.items,
  });

  User user;
  List<ItemElement> items;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    user: User.fromJson(json["user"]),
    items: List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class ItemElement {
  ItemElement({
    this.id,
    this.userId,
    this.orderId,
    this.productId,
    this.quantity,
    this.price,
    this.changedPrice,
    this.vareiationId,
    this.colorId,
    this.sizeId,
    this.heightId,
    this.weight,
    this.userSpecialSize,
    this.giftWrapping,
    this.note,
    this.createdAt,
    this.color,
    this.size,
    this.height,
    this.product,
    this.designer,
  });

  int id;
  int userId;
  int orderId;
  int productId;
  int quantity;
  int price;
  int changedPrice;
  int vareiationId;
  int colorId;
  int sizeId;
  int heightId;
  String weight;
  dynamic userSpecialSize;
  int giftWrapping;
  String note;
  DateTime createdAt;
  HeightClass color;
  HeightClass size;
  HeightClass height;
  ItemProduct product;
  User designer;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
    id: json["id"],
    userId: json["user_id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    price: json["price"],
    changedPrice: json["changed_price"],
    vareiationId: json["vareiation_id"],
    colorId: json["color_id"],
    sizeId: json["size_id"],
    heightId: json["height_id"],
    weight: json["weight"],
    userSpecialSize: json["user_special_size"],
    giftWrapping: json["gift_wrapping"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    color: HeightClass.fromJson(json["color"]),
    size: HeightClass.fromJson(json["size"]),
    height: HeightClass.fromJson(json["height"]),
    product: ItemProduct.fromJson(json["product"]),
    designer: User.fromJson(json["designer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_id": orderId,
    "product_id": productId,
    "quantity": quantity,
    "price": price,
    "changed_price": changedPrice,
    "vareiation_id": vareiationId,
    "color_id": colorId,
    "size_id": sizeId,
    "height_id": heightId,
    "weight": weight,
    "user_special_size": userSpecialSize,
    "gift_wrapping": giftWrapping,
    "note": note,
    "created_at": createdAt.toIso8601String(),
    "color": color.toJson(),
    "size": size.toJson(),
    "height": height.toJson(),
    "product": product.toJson(),
    "designer": designer.toJson(),
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
  String code;
  Status status;
  String name;

  factory HeightClass.fromJson(Map<String, dynamic> json) => HeightClass(
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

class User {
  User({
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
    this.notifications,
    this.isDeleted,
    this.isRated,
    this.myRate,
    this.designerName,
    this.designerDescription,
    this.discountLabel,
  });

  int id;
  dynamic name;
  String mobile;
  String email;
  int numOfProducts;
  int numOfOrders;
  int numOfBookings;
  Status status;
  String image;
  int isFeatured;
  String type;
  int rate;
  dynamic size;
  String supplierCode;
  int notifications;
  String isDeleted;
  bool isRated;
  dynamic myRate;
  String designerName;
  String designerDescription;
  String discountLabel;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    rate: json["rate"],
    size: json["size"],
    supplierCode: json["supplier_code"],
    notifications: json["notifications"],
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
    "notifications": notifications,
    "is_deleted": isDeleted,
    "is_rated": isRated,
    "my_rate": myRate,
    "designer_name": designerName,
    "designer_description": designerDescription,
    "discount_label": discountLabel,
  };
}

class ItemProduct {
  ItemProduct({
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
    this.isCart,
    this.currentCart,
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
  int changedPrice;
  bool isFavorite;
  int changedPriceOffer;
  List<ColorElement> colors;
  String designerName;
  String urlLink;
  int isCart;
  dynamic currentCart;
  String name;
  String description;
  User designer;

  factory ItemProduct.fromJson(Map<String, dynamic> json) => ItemProduct(
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
    colors: List<ColorElement>.from(json["colors"].map((x) => ColorElement.fromJson(x))),
    designerName: json["designer_name"],
    urlLink: json["url_link"],
    isCart: json["is_cart"],
    currentCart: json["current_cart"],
    name: json["name"],
    description: json["description"],
    designer: User.fromJson(json["designer"]),
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
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    "designer_name": designerName,
    "url_link": urlLink,
    "is_cart": isCart,
    "current_cart": currentCart,
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

  int id;
  String code;
  Status status;
  bool isDisabled;
  List<Variation> variations;
  String name;

  factory ColorElement.fromJson(Map<String, dynamic> json) => ColorElement(
    id: json["id"],
    code: json["code"],
    status: statusValues.map[json["status"]],
    isDisabled: json["is_disabled"],
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "status": statusValues.reverse[status],
    "is_disabled": isDisabled,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    "name": name,
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

  int id;
  int productId;
  int sizeId;
  int colorId;
  int heightId;
  int inStock;
  HeightClass color;
  HeightClass size;
  HeightClass height;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    productId: json["product_id"],
    sizeId: json["size_id"],
    colorId: json["color_id"],
    heightId: json["height_id"],
    inStock: json["in_stock"],
    color: HeightClass.fromJson(json["color"]),
    size: HeightClass.fromJson(json["size"]),
    height: HeightClass.fromJson(json["height"]),
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
    "height": height.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
   Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
