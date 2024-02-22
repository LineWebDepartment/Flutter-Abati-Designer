// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'dart:convert';

SettingModel settingModelFromJson(String str) => SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  SettingModel({
    this.status,
    this.code,
    this.message,
    this.settings,
  });

  bool status;
  int code;
  String message;
  Settings settings;

  SettingModel copyWith({
    bool status,
    int code,
    String message,
    Settings settings,
  }) =>
      SettingModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        settings: settings ?? this.settings,
      );

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    status: json["status"] == null ? null : json["status"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
    settings: json["settings"] == null ? null : Settings.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
    "settings": settings == null ? null : settings.toJson(),
  };
}

class Settings {
  Settings({
    this.id,
    this.paginateTotal,
    this.loginImage,
    this.googlePlayUrl,
    this.appStoreUrl,
    this.infoEmail,
    this.mobile,
    this.whatsapp,
    this.snapchat,
    this.tiktok,
    this.instagram,
    this.twitter,
    this.isMaintenanceMode,
    this.isAllowRegister,
    this.isAllowLogin,
    this.giftWrappingFees,
    this.sizeChart,
    this.createdAt,
    this.pages,
    this.countries,
    this.areas,
    this.banner,
    this.location,
  });

  int id;
  int paginateTotal;
  String loginImage;
  String googlePlayUrl;
  String appStoreUrl;
  String infoEmail;
  String mobile;
  String whatsapp;
  String snapchat;
  String tiktok;
  String instagram;
  String twitter;
  String isMaintenanceMode;
  String isAllowRegister;
  String isAllowLogin;
  int giftWrappingFees;
  String sizeChart;
  DateTime createdAt;
  List<Page> pages;
  List<Country> countries;
  List<Area> areas;
  Banner banner;
  String location;

  Settings copyWith({
    int id,
    int paginateTotal,
    String loginImage,
    String googlePlayUrl,
    String appStoreUrl,
    String infoEmail,
    String mobile,
    String whatsapp,
    String snapchat,
    String tiktok,
    String instagram,
    String twitter,
    String isMaintenanceMode,
    String isAllowRegister,
    String isAllowLogin,
    int giftWrappingFees,
    String sizeChart,
    DateTime createdAt,
    List<Page> pages,
    List<Country> countries,
    List<Area> areas,
    Banner banner,
    String location,
  }) =>
      Settings(
        id: id ?? this.id,
        paginateTotal: paginateTotal ?? this.paginateTotal,
        loginImage: loginImage ?? this.loginImage,
        googlePlayUrl: googlePlayUrl ?? this.googlePlayUrl,
        appStoreUrl: appStoreUrl ?? this.appStoreUrl,
        infoEmail: infoEmail ?? this.infoEmail,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        snapchat: snapchat ?? this.snapchat,
        tiktok: tiktok ?? this.tiktok,
        instagram: instagram ?? this.instagram,
        twitter: twitter ?? this.twitter,
        isMaintenanceMode: isMaintenanceMode ?? this.isMaintenanceMode,
        isAllowRegister: isAllowRegister ?? this.isAllowRegister,
        isAllowLogin: isAllowLogin ?? this.isAllowLogin,
        giftWrappingFees: giftWrappingFees ?? this.giftWrappingFees,
        sizeChart: sizeChart ?? this.sizeChart,
        createdAt: createdAt ?? this.createdAt,
        pages: pages ?? this.pages,
        countries: countries ?? this.countries,
        areas: areas ?? this.areas,
        banner: banner ?? this.banner,
        location: location ?? this.location,
      );

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    id: json["id"] == null ? null : json["id"],
    paginateTotal: json["paginateTotal"] == null ? null : json["paginateTotal"],
    loginImage: json["login_image"] == null ? null : json["login_image"],
    googlePlayUrl: json["google_play_url"] == null ? null : json["google_play_url"],
    appStoreUrl: json["app_store_url"] == null ? null : json["app_store_url"],
    infoEmail: json["info_email"] == null ? null : json["info_email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    snapchat: json["snapchat"] == null ? null : json["snapchat"],
    tiktok: json["tiktok"] == null ? null : json["tiktok"],
    instagram: json["instagram"] == null ? null : json["instagram"],
    twitter: json["twitter"] == null ? null : json["twitter"],
    isMaintenanceMode: json["is_maintenance_mode"] == null ? null : json["is_maintenance_mode"],
    isAllowRegister: json["is_allow_register"] == null ? null : json["is_allow_register"],
    isAllowLogin: json["is_allow_login"] == null ? null : json["is_allow_login"],
    giftWrappingFees: json["gift_wrapping_fees"] == null ? null : json["gift_wrapping_fees"],
    sizeChart: json["size_chart"] == null ? null : json["size_chart"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    pages: json["pages"] == null ? null : List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
    countries: json["countries"] == null ? null : List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    areas: json["areas"] == null ? null : List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
    banner: json["banner"] == null ? null : Banner.fromJson(json["banner"]),
    location: json["location"] == null ? null : json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "paginateTotal": paginateTotal == null ? null : paginateTotal,
    "login_image": loginImage == null ? null : loginImage,
    "google_play_url": googlePlayUrl == null ? null : googlePlayUrl,
    "app_store_url": appStoreUrl == null ? null : appStoreUrl,
    "info_email": infoEmail == null ? null : infoEmail,
    "mobile": mobile == null ? null : mobile,
    "whatsapp": whatsapp == null ? null : whatsapp,
    "snapchat": snapchat == null ? null : snapchat,
    "tiktok": tiktok == null ? null : tiktok,
    "instagram": instagram == null ? null : instagram,
    "twitter": twitter == null ? null : twitter,
    "is_maintenance_mode": isMaintenanceMode == null ? null : isMaintenanceMode,
    "is_allow_register": isAllowRegister == null ? null : isAllowRegister,
    "is_allow_login": isAllowLogin == null ? null : isAllowLogin,
    "gift_wrapping_fees": giftWrappingFees == null ? null : giftWrappingFees,
    "size_chart": sizeChart == null ? null : sizeChart,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "pages": pages == null ? null : List<dynamic>.from(pages.map((x) => x.toJson())),
    "countries": countries == null ? null : List<dynamic>.from(countries.map((x) => x.toJson())),
    "areas": areas == null ? null : List<dynamic>.from(areas.map((x) => x.toJson())),
    "banner": banner == null ? null : banner.toJson(),
    "location": location == null ? null : location,
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
  String status;
  DateTime createdAt;

  Banner copyWith({
    int id,
    String image,
    int targetId,
    int targetType,
    int bannerType,
    String status,
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
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "target_id": targetId == null ? null : targetId,
    "target_type": targetType == null ? null : targetType,
    "banner_type": bannerType == null ? null : bannerType,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
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
    this.areas,
  });

  int id;
  String image;
  double changeRate;
  int mobileIntro;
  int deliveryCharge;
  String isoCode;
  String status;
  String name;
  String currencyName;
  String shortCode;
  List<Area> areas;

  Country copyWith({
    int id,
    String image,
    double changeRate,
    int mobileIntro,
    int deliveryCharge,
    String isoCode,
    String status,
    String name,
    String currencyName,
    String shortCode,
    List<Area> areas,
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
        areas: areas ?? this.areas,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    changeRate: json["change_rate"] == null ? null : json["change_rate"].toDouble(),
    mobileIntro: json["mobile_intro"] == null ? null : json["mobile_intro"],
    deliveryCharge: json["delivery_charge"] == null ? null : json["delivery_charge"],
    isoCode: json["iso_code"] == null ? null : json["iso_code"],
    status: json["status"] == null ? null : json["status"],
    name: json["name"] == null ? null : json["name"],
    currencyName: json["currency_name"] == null ? null : json["currency_name"],
    shortCode: json["short_code"] == null ? null : json["short_code"],
    areas: json["areas"] == null ? null : List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
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
    "areas": areas == null ? null : List<dynamic>.from(areas.map((x) => x.toJson())),
  };
}

class Page {
  Page({
    this.id,
    this.image,
    this.views,
    this.slug,
    this.status,
    this.createdAt,
    this.title,
    this.description,
  });

  int id;
  String image;
  int views;
  String slug;
  String status;
  DateTime createdAt;
  String title;
  String description;

  Page copyWith({
    int id,
    String image,
    int views,
    String slug,
    String status,
    DateTime createdAt,
    String title,
    String description,
  }) =>
      Page(
        id: id ?? this.id,
        image: image ?? this.image,
        views: views ?? this.views,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    views: json["views"] == null ? null : json["views"],
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "views": views == null ? null : views,
    "slug": slug == null ? null : slug,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "title": title == null ? null : title,
    "description": description == null ? null : description,
  };
}
