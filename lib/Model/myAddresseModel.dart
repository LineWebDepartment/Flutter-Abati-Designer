// To parse this JSON data, do
//
//     final myAddressesModel = myAddressesModelFromJson(jsonString);

import 'dart:convert';

MyAddressesModel myAddressesModelFromJson(String str) => MyAddressesModel.fromJson(json.decode(str));

String myAddressesModelToJson(MyAddressesModel data) => json.encode(data.toJson());

class MyAddressesModel {
  MyAddressesModel({
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

  MyAddressesModel copyWith({
    bool status,
    int code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      MyAddressesModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory MyAddressesModel.fromJson(Map<String, dynamic> json) => MyAddressesModel(
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
    this.userId,
    this.countryId,
    this.areaId,
    this.title,
    this.firstAddressLine,
    this.secondAddressLine,
    this.extraDirections,
    this.createdAt,
    this.country,
    this.area,
  });

  int id;
  int userId;
  int countryId;
  int areaId;
  String title;
  String firstAddressLine;
  String secondAddressLine;
  String extraDirections;
  DateTime createdAt;
  Country country;
  Area area;

  Item copyWith({
    int id,
    int userId,
    int countryId,
    int areaId,
    String title,
    String firstAddressLine,
    String secondAddressLine,
    String extraDirections,
    DateTime createdAt,
    Country country,
    Area area,
  }) =>
      Item(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        countryId: countryId ?? this.countryId,
        areaId: areaId ?? this.areaId,
        title: title ?? this.title,
        firstAddressLine: firstAddressLine ?? this.firstAddressLine,
        secondAddressLine: secondAddressLine ?? this.secondAddressLine,
        extraDirections: extraDirections ?? this.extraDirections,
        createdAt: createdAt ?? this.createdAt,
        country: country ?? this.country,
        area: area ?? this.area,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    areaId: json["area_id"] == null ? null : json["area_id"],
    title: json["title"] == null ? null : json["title"],
    firstAddressLine: json["first_address_line"] == null ? null : json["first_address_line"],
    secondAddressLine: json["second_address_line"] == null ? null : json["second_address_line"],
    extraDirections: json["extra_directions"] == null ? null : json["extra_directions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    area: json["area"] == null ? null : Area.fromJson(json["area"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "country_id": countryId == null ? null : countryId,
    "area_id": areaId == null ? null : areaId,
    "title": title == null ? null : title,
    "first_address_line": firstAddressLine == null ? null : firstAddressLine,
    "second_address_line": secondAddressLine == null ? null : secondAddressLine,
    "extra_directions": extraDirections == null ? null : extraDirections,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "country": country == null ? null : country.toJson(),
    "area": area == null ? null : area.toJson(),
  };
}

class Area {
  Area({
    this.id,
    this.countryId,
    this.deliveryCharge,
    this.name,
  });

  int id;
  int countryId;
  int deliveryCharge;
  String name;

  Area copyWith({
    int id,
    int countryId,
    int deliveryCharge,
    String name,
  }) =>
      Area(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        name: name ?? this.name,
      );

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"] == null ? null : json["id"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    deliveryCharge: json["delivery_charge"] == null ? null : json["delivery_charge"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "country_id": countryId == null ? null : countryId,
    "delivery_charge": deliveryCharge == null ? null : deliveryCharge,
    "name": name == null ? null : name,
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
  String status;
  String name;
  String currencyName;
  String shortCode;

  Country copyWith({
    int id,
    String image,
    int changeRate,
    int mobileIntro,
    int deliveryCharge,
    String isoCode,
    String status,
    String name,
    String currencyName,
    String shortCode,
  }) =>
      Country(
        id: id ?? this.id,
        image: image ?? this.image,
        changeRate: changeRate ?? this.changeRate,
        mobileIntro: mobileIntro ?? this.mobileIntro,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        isoCode: isoCode ?? this.isoCode,
        status: status ?? this.status,
        name: name ?? this.name,
        currencyName: currencyName ?? this.currencyName,
        shortCode: shortCode ?? this.shortCode,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    changeRate: json["change_rate"] == null ? null : json["change_rate"],
    mobileIntro: json["mobile_intro"] == null ? null : json["mobile_intro"],
    deliveryCharge: json["delivery_charge"] == null ? null : json["delivery_charge"],
    isoCode: json["iso_code"] == null ? null : json["iso_code"],
    status: json["status"] == null ? null : json["status"],
    name: json["name"] == null ? null : json["name"],
    currencyName: json["currency_name"] == null ? null : json["currency_name"],
    shortCode: json["short_code"] == null ? null : json["short_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "change_rate": changeRate == null ? null : changeRate,
    "mobile_intro": mobileIntro == null ? null : mobileIntro,
    "delivery_charge": deliveryCharge == null ? null : deliveryCharge,
    "iso_code": isoCode == null ? null : isoCode,
    "status": status == null ? null : status,
    "name": name == null ? null : name,
    "currency_name": currencyName == null ? null : currencyName,
    "short_code": shortCode == null ? null : shortCode,
  };
}
