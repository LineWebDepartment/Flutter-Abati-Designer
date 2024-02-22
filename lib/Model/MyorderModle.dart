// To parse this JSON data, do
//
//     final myorderedModel = myorderedModelFromJson(jsonString);

import 'dart:convert';

MyOrderModel myorderedModelFromJson(String str) => MyOrderModel.fromJson(json.decode(str));

String myorderedModelToJson(MyOrderModel data) => json.encode(data.toJson());

class MyOrderModel {
  MyOrderModel({
    this.status,
    this.code,
    this.message,
    this.items,
    this.isMore,
  });

  bool status;
   num code;
  String message;
  List<Item> items;
  bool isMore;

  MyOrderModel copyWith({
    bool status,
     num code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      MyOrderModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    isMore: json["is_more"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": items == null ? [] : List<dynamic>.from(items.map((x) => x.toJson())),
    "is_more": isMore,
  };
}

class Item {
  Item({
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
    this.statusText,
    this.numOfOrders,
    this.numOfOrdersForThisDesigner,
    this.country,
    this.addressCountry,
  });

   num id;
   num userId;
  String fcmToken;
  String countryId;
  String addressCountryId;
  String areaId;
  FirstAddressLine firstAddressLine;
  SecondAddressLine secondAddressLine;
  ExtraDirections extraDirections;
   num addressId;
   num total;
   num subTotal;
   num discount;
  double changeRate;
   num changedSubTotal;
   num changedTotal;
   num changedDiscount;
   num deliveryCharge;
   num changedDeliveryCharge;
   num promoCodeId;
  dynamic promoCodeName;
   num promoCodePercentage;
  CustomerName customerName;
  CustomerEmail customerEmail;
  String customerMobile;
   num paymentMethod;
   num  paymentStatus;
  String transactionId;
  dynamic paymentId;
  dynamic refundKey;
  dynamic refundId;
  dynamic refundReference;
  dynamic refundAmount;
  String status;
   num designerAcceptance;
  dynamic trackingNumber;
  DateTime createdAt;
  StatusText statusText;
   num numOfOrders;
  String numOfOrdersForThisDesigner;
  Country country;
  Country addressCountry;

  Item copyWith({
     num id,
     num userId,
    String fcmToken,
    String countryId,
    String addressCountryId,
    String areaId,
    FirstAddressLine firstAddressLine,
    SecondAddressLine secondAddressLine,
    ExtraDirections extraDirections,
     num addressId,
     num total,
     num subTotal,
     num discount,
    double changeRate,
     num changedSubTotal,
     num changedTotal,
     num changedDiscount,
     num deliveryCharge,
     num changedDeliveryCharge,
     num promoCodeId,
    dynamic promoCodeName,
     num promoCodePercentage,
    CustomerName customerName,
    CustomerEmail customerEmail,
    String customerMobile,
     num paymentMethod,
     num paymentStatus,
    String transactionId,
    dynamic paymentId,
    dynamic refundKey,
    dynamic refundId,
    dynamic refundReference,
    dynamic refundAmount,
    String status,
     num designerAcceptance,
    dynamic trackingNumber,
    DateTime createdAt,
    StatusText statusText,
     num numOfOrders,
    String numOfOrdersForThisDesigner,
    Country country,
    Country addressCountry,
  }) =>
      Item(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        fcmToken: fcmToken ?? this.fcmToken,
        countryId: countryId ?? this.countryId,
        addressCountryId: addressCountryId ?? this.addressCountryId,
        areaId: areaId ?? this.areaId,
        firstAddressLine: firstAddressLine ?? this.firstAddressLine,
        secondAddressLine: secondAddressLine ?? this.secondAddressLine,
        extraDirections: extraDirections ?? this.extraDirections,
        addressId: addressId ?? this.addressId,
        total: total ?? this.total,
        subTotal: subTotal ?? this.subTotal,
        discount: discount ?? this.discount,
        changeRate: changeRate ?? this.changeRate,
        changedSubTotal: changedSubTotal ?? this.changedSubTotal,
        changedTotal: changedTotal ?? this.changedTotal,
        changedDiscount: changedDiscount ?? this.changedDiscount,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        changedDeliveryCharge: changedDeliveryCharge ?? this.changedDeliveryCharge,
        promoCodeId: promoCodeId ?? this.promoCodeId,
        promoCodeName: promoCodeName ?? this.promoCodeName,
        promoCodePercentage: promoCodePercentage ?? this.promoCodePercentage,
        customerName: customerName ?? this.customerName,
        customerEmail: customerEmail ?? this.customerEmail,
        customerMobile: customerMobile ?? this.customerMobile,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        transactionId: transactionId ?? this.transactionId,
        paymentId: paymentId ?? this.paymentId,
        refundKey: refundKey ?? this.refundKey,
        refundId: refundId ?? this.refundId,
        refundReference: refundReference ?? this.refundReference,
        refundAmount: refundAmount ?? this.refundAmount,
        status: status ?? this.status,
        designerAcceptance: designerAcceptance ?? this.designerAcceptance,
        trackingNumber: trackingNumber ?? this.trackingNumber,
        createdAt: createdAt ?? this.createdAt,
        statusText: statusText ?? this.statusText,
        numOfOrders: numOfOrders ?? this.numOfOrders,
        numOfOrdersForThisDesigner: numOfOrdersForThisDesigner ?? this.numOfOrdersForThisDesigner,
        country: country ?? this.country,
        addressCountry: addressCountry ?? this.addressCountry,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    userId: json["user_id"],
    fcmToken: json["fcm_token"],
    countryId: json["country_id"],
    addressCountryId: json["address_country_id"],
    areaId: json["area_id"],
    firstAddressLine: firstAddressLineValues.map[json["first_address_line"]],
    secondAddressLine: secondAddressLineValues.map[json["second_address_line"]],
    extraDirections: extraDirectionsValues.map[json["extra_directions"]],
    addressId: json["address_id"],
    total: json["total"],
    subTotal: json["sub_total"],
    discount: json["discount"],
    changeRate: json["change_rate"].toDouble(),
    changedSubTotal: json["changed_sub_total"],
    changedTotal: json["changed_total"],
    changedDiscount: json["changed_discount"],
    deliveryCharge: json["delivery_charge"],
    changedDeliveryCharge: json["changed_delivery_charge"],
    promoCodeId: json["promo_code_id"],
    promoCodeName: json["promo_code_name"],
    promoCodePercentage: json["promo_code_percentage"],
    customerName: customerNameValues.map[json["customer_name"]],
    // customerEmail: customerEmailValue.map[json["customer_email"]],
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
    statusText: statusTextValues.map[json["status_text"]],
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
    "first_address_line": firstAddressLineValues.reverse[firstAddressLine],
    "second_address_line": secondAddressLineValues.reverse[secondAddressLine],
    "extra_directions": extraDirectionsValues.reverse[extraDirections],
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
    "customer_name": customerNameValues.reverse[customerName],
    "customer_email": customerEmailValues.reverse[customerEmail],
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
    "created_at": createdAt?.toIso8601String(),
    "status_text": statusTextValues.reverse[statusText],
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

   num id;
  String image;
  double changeRate;
   num mobileIntro;
   num deliveryCharge;
  String isoCode;
  Status status;
  Name name;
  CurrencyName currencyName;
  ShortCode shortCode;

  Country copyWith({
     num id,
    String image,
    double changeRate,
     num mobileIntro,
     num deliveryCharge,
    String isoCode,
    Status status,
    Name name,
    CurrencyName currencyName,
    ShortCode shortCode,
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
    id: json["id"],
    image: json["image"],
    changeRate: json["change_rate"].toDouble(),
    mobileIntro: json["mobile_ numro"],
    deliveryCharge: json["delivery_charge"],
    isoCode: json["iso_code"],
    status: statusValues.map[json["status"]],
    name: nameValues.map[json["name"]],
    currencyName: currencyNameValues.map[json["currency_name"]],
    shortCode: shortCodeValues.map[json["short_code"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "change_rate": changeRate,
    "mobile_ numro": mobileIntro,
    "delivery_charge": deliveryCharge,
    "iso_code": isoCode,
    "status": statusValues.reverse[status],
    "name": nameValues.reverse[name],
    "currency_name": currencyNameValues.reverse[currencyName],
    "short_code": shortCodeValues.reverse[shortCode],
  };
}

enum CurrencyName { KUWAIT_KWD, SAUDI_SAR }

final currencyNameValues = EnumValues({
  "Kuwait (KWD)": CurrencyName.KUWAIT_KWD,
  "Saudi (SAR)": CurrencyName.SAUDI_SAR
});

enum Name { KUWAIT, SAUDI }

final nameValues = EnumValues({
  "Kuwait": Name.KUWAIT,
  "Saudi": Name.SAUDI
});

enum ShortCode { KWD, SAR }

final shortCodeValues = EnumValues({
  "KWD": ShortCode.KWD,
  "SAR": ShortCode.SAR
});

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

enum CustomerEmail { OSAMA99_GMAIL_COM }

final customerEmailValues = EnumValues({
  "osama99@gmail.com": CustomerEmail.OSAMA99_GMAIL_COM
});

enum CustomerName { OSAMA }

final customerNameValues = EnumValues({
  "osama": CustomerName.OSAMA
});

enum ExtraDirections { PALESTINE, FEFWFEWFEFEFEFE }

final extraDirectionsValues = EnumValues({
  "fefwfewfefefefe": ExtraDirections.FEFWFEWFEFEFEFE,
  "palestine": ExtraDirections.PALESTINE
});

enum FirstAddressLine { GAZA, ASASDEFEFEF }

final firstAddressLineValues = EnumValues({
  "asasdefefef": FirstAddressLine.ASASDEFEFEF,
  "gaza": FirstAddressLine.GAZA
});

enum SecondAddressLine { NUSIRAT, FEFEFEFEFEFWEFWEF99090909090909090 }

final secondAddressLineValues = EnumValues({
  "fefefefefefwefwef99090909090909090": SecondAddressLine.FEFEFEFEFEFWEFWEF99090909090909090,
  "nusirat": SecondAddressLine.NUSIRAT
});

enum StatusText { PLACED }

final statusTextValues = EnumValues({
  "Placed": StatusText.PLACED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
