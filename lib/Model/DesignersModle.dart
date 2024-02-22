// To parse this JSON data, do
//
//     final designersModel = designersModelFromJson(jsonString);

import 'dart:convert';

DesignersModel designersModelFromJson(String str) => DesignersModel.fromJson(json.decode(str));

String designersModelToJson(DesignersModel data) => json.encode(data.toJson());

class DesignersModel {
  DesignersModel({
    this.status,
    this.code,
    this.message,
    this.items,
    this.isMore,
  });

  bool status;
  int code;
  String message;
  List<Item> items;
  bool isMore;

  DesignersModel copyWith({
    bool status,
    int code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      DesignersModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory DesignersModel.fromJson(Map<String, dynamic> json) => DesignersModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    isMore: json["is_more"] == null ? null : json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "is_more": isMore == null ? null : isMore,
  };
}

class Item {
  Item({
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
  String supplierCode;
  String isDeleted;
  bool isRated;
  dynamic myRate;
  String designerName;
  String designerDescription;
  String discountLabel;

  Item copyWith({
    int id,
    String name,
    String mobile,
    String email,
    int numOfProducts,
    int numOfOrders,
    int numOfBookings,
    String status,
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
      Item(
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
    numOfProducts: json["num_of_products"] == null ? null : json["num_of_products"],
    numOfOrders: json["num_of_orders"] == null ? null : json["num_of_orders"],
    numOfBookings: json["num_of_bookings"] == null ? null : json["num_of_bookings"],
    status: json["status"] == null ? null : json["status"],
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
    "status": status == null ? null : status,
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
