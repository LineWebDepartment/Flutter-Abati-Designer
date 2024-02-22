// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.status,
    this.code,
    this.message,
    this.items,
    this.isMore,
    this.pendingTotal,
    this.acceptedTotal,
    this.rejectedTotal,
  });

  bool status;
  num code;
  String message;
  List<Item> items;
  bool isMore;
  num pendingTotal;
  num acceptedTotal;
  num rejectedTotal;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    isMore: json["is_more"],
    pendingTotal: json["pending_total"],
    acceptedTotal: json["accepted_total"],
    rejectedTotal: json["rejected_total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "is_more": isMore,
    "pending_total": pendingTotal,
    "accepted_total": acceptedTotal,
    "rejected_total": rejectedTotal,
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
  });

  num id;
  num userId;
  String fcmToken;
  String countryId;
  String addressCountryId;
  String areaId;
  String firstAddressLine;
  String secondAddressLine;
  String extraDirections;
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
  dynamic promoCodePercentage;
  String customerName;
  String customerEmail;
  String customerMobile;
  num paymentMethod;
  num paymentStatus;
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
  String statusText;
  num numOfOrders;
  num numOfOrdersForThisDesigner;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
    changeRate: json["change_rate"].toDouble(),
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
    statusText: json["status_text"],
    numOfOrders: json["num_of_orders"],
    numOfOrdersForThisDesigner: json["num_of_orders_for_this_designer"],
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
    "status_text": statusText,
    "num_of_orders": numOfOrders,
    "num_of_orders_for_this_designer": numOfOrdersForThisDesigner,
  };
}
