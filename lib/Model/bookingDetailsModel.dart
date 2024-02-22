// To parse this JSON data, do
//
//     final bookingDetailsModel = bookingDetailsModelFromJson(jsonString);

import 'dart:convert';

BookingDetailsModel bookingDetailsModelFromJson(String str) => BookingDetailsModel.fromJson(json.decode(str));

String bookingDetailsModelToJson(BookingDetailsModel data) => json.encode(data.toJson());

class BookingDetailsModel {
  BookingDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  int code;
  String message;
  Item item;

  BookingDetailsModel copyWith({
    bool status,
    int code,
    String message,
    Item item,
  }) =>
      BookingDetailsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) => BookingDetailsModel(
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
    this.id,
    this.userId,
    this.fcmToken,
    this.countryId,
    this.changeRate,
    this.serviceId,
    this.total,
    this.subTotal,
    this.discount,
    this.changedSubTotal,
    this.changedDiscount,
    this.changedTotal,
    this.promoCodeId,
    this.promoCodeName,
    this.promoCodePercentage,
    this.customerName,
    this.customerEmail,
    this.customerMobile,
    this.date,
    this.dateName,
    this.timeFrom,
    this.timeTo,
    this.dateId,
    this.slotId,
    this.paymentMethod,
    this.paymentStatus,
    this.transactionId,
    this.paymentId,
    this.refundKey,
    this.refundId,
    this.refundAmount,
    this.status,
    this.refundReference,
    this.createdAt,
    this.statusText,
    this.paymentMethodText,
    this.service,
  });

  int id;
  int userId;
  String fcmToken;
  String countryId;
  double changeRate;
  int serviceId;
  int total;
  int subTotal;
  int discount;
  double changedSubTotal;
  double changedDiscount;
  double changedTotal;
  int promoCodeId;
  String promoCodeName;
  int promoCodePercentage;
  String customerName;
  String customerEmail;
  String customerMobile;
  String date;
  String dateName;
  String timeFrom;
  String timeTo;
  int dateId;
  int slotId;
  int paymentMethod;
  int paymentStatus;
  String transactionId;
  dynamic paymentId;
  dynamic refundKey;
  dynamic refundId;
  dynamic refundAmount;
  String status;
  dynamic refundReference;
  DateTime createdAt;
  String statusText;
  String paymentMethodText;
  Service service;

  Item copyWith({
    int id,
    int userId,
    String fcmToken,
    String countryId,
    double changeRate,
    int serviceId,
    int total,
    int subTotal,
    int discount,
    double changedSubTotal,
    double changedDiscount,
    double changedTotal,
    int promoCodeId,
    String promoCodeName,
    int promoCodePercentage,
    String customerName,
    String customerEmail,
    String customerMobile,
    DateTime date,
    String dateName,
    String timeFrom,
    String timeTo,
    int dateId,
    int slotId,
    int paymentMethod,
    int paymentStatus,
    String transactionId,
    dynamic paymentId,
    dynamic refundKey,
    dynamic refundId,
    dynamic refundAmount,
    String status,
    dynamic refundReference,
    DateTime createdAt,
    String statusText,
    String paymentMethodText,
    Service service,
  }) =>
      Item(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        fcmToken: fcmToken ?? this.fcmToken,
        countryId: countryId ?? this.countryId,
        changeRate: changeRate ?? this.changeRate,
        serviceId: serviceId ?? this.serviceId,
        total: total ?? this.total,
        subTotal: subTotal ?? this.subTotal,
        discount: discount ?? this.discount,
        changedSubTotal: changedSubTotal ?? this.changedSubTotal,
        changedDiscount: changedDiscount ?? this.changedDiscount,
        changedTotal: changedTotal ?? this.changedTotal,
        promoCodeId: promoCodeId ?? this.promoCodeId,
        promoCodeName: promoCodeName ?? this.promoCodeName,
        promoCodePercentage: promoCodePercentage ?? this.promoCodePercentage,
        customerName: customerName ?? this.customerName,
        customerEmail: customerEmail ?? this.customerEmail,
        customerMobile: customerMobile ?? this.customerMobile,
        date: date ?? this.date,
        dateName: dateName ?? this.dateName,
        timeFrom: timeFrom ?? this.timeFrom,
        timeTo: timeTo ?? this.timeTo,
        dateId: dateId ?? this.dateId,
        slotId: slotId ?? this.slotId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        transactionId: transactionId ?? this.transactionId,
        paymentId: paymentId ?? this.paymentId,
        refundKey: refundKey ?? this.refundKey,
        refundId: refundId ?? this.refundId,
        refundAmount: refundAmount ?? this.refundAmount,
        status: status ?? this.status,
        refundReference: refundReference ?? this.refundReference,
        createdAt: createdAt ?? this.createdAt,
        statusText: statusText ?? this.statusText,
        paymentMethodText: paymentMethodText ?? this.paymentMethodText,
        service: service ?? this.service,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    changeRate: json["change_rate"] == null ? null : json["change_rate"].toDouble(),
    serviceId: json["service_id"] == null ? null : json["service_id"],
    total: json["total"] == null ? null : json["total"],
    subTotal: json["sub_total"] == null ? null : json["sub_total"],
    discount: json["discount"] == null ? null : json["discount"],
    changedSubTotal: json["changed_sub_total"] == null ? null : json["changed_sub_total"].toDouble(),
    changedDiscount: json["changed_discount"] == null ? null : json["changed_discount"].toDouble(),
    changedTotal: json["changed_total"] == null ? null : json["changed_total"].toDouble(),
    promoCodeId: json["promo_code_id"] == null ? null : json["promo_code_id"],
    promoCodeName: json["promo_code_name"] == null ? null : json["promo_code_name"],
    promoCodePercentage: json["promo_code_percentage"] == null ? null : json["promo_code_percentage"],
    customerName: json["customer_name"] == null ? null : json["customer_name"],
    customerEmail: json["customer_email"] == null ? null : json["customer_email"],
    customerMobile: json["customer_mobile"] == null ? null : json["customer_mobile"],
    date: json["date"] == null ? null : json["date"],
    // date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateName: json["date_name"] == null ? null : json["date_name"],
    timeFrom: json["time_from"] == null ? null : json["time_from"],
    timeTo: json["time_to"] == null ? null : json["time_to"],
    dateId: json["date_id"] == null ? null : json["date_id"],
    slotId: json["slot_id"] == null ? null : json["slot_id"],
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    paymentStatus: json["payment_status"] == null ? null : json["payment_status"],
    transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
    paymentId: json["payment_id"],
    refundKey: json["refund_Key"],
    refundId: json["refund_id"],
    refundAmount: json["refund_amount"],
    status: json["status"] == null ? null : json["status"],
    refundReference: json["refund_reference"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    statusText: json["status_text"] == null ? null : json["status_text"],
    paymentMethodText: json["payment_method_text"] == null ? null : json["payment_method_text"],
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "fcm_token": fcmToken == null ? null : fcmToken,
    "country_id": countryId == null ? null : countryId,
    "change_rate": changeRate == null ? null : changeRate,
    "service_id": serviceId == null ? null : serviceId,
    "total": total == null ? null : total,
    "sub_total": subTotal == null ? null : subTotal,
    "discount": discount == null ? null : discount,
    "changed_sub_total": changedSubTotal == null ? null : changedSubTotal,
    "changed_discount": changedDiscount == null ? null : changedDiscount,
    "changed_total": changedTotal == null ? null : changedTotal,
    "promo_code_id": promoCodeId == null ? null : promoCodeId,
    "promo_code_name": promoCodeName == null ? null : promoCodeName,
    "promo_code_percentage": promoCodePercentage == null ? null : promoCodePercentage,
    "customer_name": customerName == null ? null : customerName,
    "customer_email": customerEmail == null ? null : customerEmail,
    "customer_mobile": customerMobile == null ? null : customerMobile,
    "date": date == null ? null : date,
    // "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "date_name": dateName == null ? null : dateName,
    "time_from": timeFrom == null ? null : timeFrom,
    "time_to": timeTo == null ? null : timeTo,
    "date_id": dateId == null ? null : dateId,
    "slot_id": slotId == null ? null : slotId,
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "payment_status": paymentStatus == null ? null : paymentStatus,
    "transaction_id": transactionId == null ? null : transactionId,
    "payment_id": paymentId,
    "refund_Key": refundKey,
    "refund_id": refundId,
    "refund_amount": refundAmount,
    "status": status == null ? null : status,
    "refund_reference": refundReference,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "status_text": statusText == null ? null : statusText,
    "payment_method_text": paymentMethodText == null ? null : paymentMethodText,
    "service": service == null ? null : service.toJson(),
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
