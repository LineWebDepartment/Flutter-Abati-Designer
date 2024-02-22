// To parse this JSON data, do
//
//     final serviceDetailModel = serviceDetailModelFromJson(jsonString);

import 'dart:convert';

ServiceDetailModel serviceDetailModelFromJson(String str) => ServiceDetailModel.fromJson(json.decode(str));

String serviceDetailModelToJson(ServiceDetailModel data) => json.encode(data.toJson());

class ServiceDetailModel {
  ServiceDetailModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  num code;
  String message;
  Item item;

  ServiceDetailModel copyWith({
    bool status,
    num code,
    String message,
    Item item,
  }) =>
      ServiceDetailModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory ServiceDetailModel.fromJson(Map<String, dynamic> json) => ServiceDetailModel(
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
    this.images,
    this.videos,
    this.relateds,
    this.dates,
    this.celebrity,
  });

  num id;
  String image;
  num celebrityId;
  num serviceCategoryId;
  num isFeatured;
  num price;
  num priceOffer;
  num listInServices;
  String name;
  String description;
  String fullDescription;
  List<Image> images;
  List<VideoElement> videos;
  List<RelatedElement> relateds;
  List<Date> dates;
  Celebrity celebrity;

  Item copyWith({
    num id,
    String image,
    num celebrityId,
    num serviceCategoryId,
    num isFeatured,
    num price,
    num priceOffer,
    num listInServices,
    String name,
    String description,
    String fullDescription,
    List<Image> images,
    List<VideoElement> videos,
    List<RelatedElement> relateds,
    List<Date> dates,
    Celebrity celebrity,
  }) =>
      Item(
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
        images: images ?? this.images,
        videos: videos ?? this.videos,
        relateds: relateds ?? this.relateds,
        dates: dates ?? this.dates,
        celebrity: celebrity ?? this.celebrity,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
    images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    videos: json["videos"] == null ? null : List<VideoElement>.from(json["videos"].map((x) => VideoElement.fromJson(x))),
    relateds: json["relateds"] == null ? null : List<RelatedElement>.from(json["relateds"].map((x) => RelatedElement.fromJson(x))),
    dates: json["dates"] == null ? null : List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
    celebrity: json["celebrity"] == null ? null : Celebrity.fromJson(json["celebrity"]),
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
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
    "videos": videos == null ? null : List<dynamic>.from(videos.map((x) => x.toJson())),
    "relateds": relateds == null ? null : List<dynamic>.from(relateds.map((x) => x.toJson())),
    "dates": dates == null ? null : List<dynamic>.from(dates.map((x) => x.toJson())),
    "celebrity": celebrity == null ? null : celebrity.toJson(),
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

  num id;
  String image;
  String email;
  String mobile;
  num sortOrder;
  num isFeatured;
  num numOfProducts;
  num numOfServices;
  String status;
  String name;
  String description;

  Celebrity copyWith({
    num id,
    String image,
    String email,
    String mobile,
    num sortOrder,
    num isFeatured,
    num numOfProducts,
    num numOfServices,
    String status,
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
    status: json["status"] == null ? null : json["status"],
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
    "status": status == null ? null : status,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
  };
}

class Date {
  Date({
    this.id,
    this.serviceId,
    this.date,
    this.name,
    this.slots,
  });

  num id;
  num serviceId;
  String date;
  String name;
  List<Slot> slots;

  Date copyWith({
    num id,
    num serviceId,
    String date,
    String name,
    List<Slot> slots,
  }) =>
      Date(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        date: date ?? this.date,
        name: name ?? this.name,
        slots: slots ?? this.slots,
      );

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    id: json["id"] == null ? null : json["id"],
    serviceId: json["service_id"] == null ? null : json["service_id"],
    date: json["date"] == null ? null : json["date"],
    // date: json["date"] == null ? null : DateTime.parse(json["date"]),
    name: json["name"] == null ? null : json["name"],
    slots: json["slots"] == null ? null : List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_id": serviceId == null ? null : serviceId,
    "date": date == null ? null : date,
    // "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "name": name == null ? null : name,
    "slots": slots == null ? null : List<dynamic>.from(slots.map((x) => x.toJson())),
  };
}

class Slot {
  Slot({
    this.id,
    this.serviceDateId,
    this.from,
    this.to,
    this.capacity,
  });

  num id;
  num serviceDateId;
  String from;
  String to;
  num capacity;

  Slot copyWith({
    num id,
    num serviceDateId,
    String from,
    String to,
    num capacity,
  }) =>
      Slot(
        id: id ?? this.id,
        serviceDateId: serviceDateId ?? this.serviceDateId,
        from: from ?? this.from,
        to: to ?? this.to,
        capacity: capacity ?? this.capacity,
      );

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    id: json["id"] == null ? null : json["id"],
    serviceDateId: json["service_date_id"] == null ? null : json["service_date_id"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    capacity: json["capacity"] == null ? null : json["capacity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_date_id": serviceDateId == null ? null : serviceDateId,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
    "capacity": capacity == null ? null : capacity,
  };
}

class Image {
  Image({
    this.id,
    this.serviceId,
    this.attachment,
  });

  num id;
  num serviceId;
  String attachment;

  Image copyWith({
    num id,
    num serviceId,
    String attachment,
  }) =>
      Image(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        attachment: attachment ?? this.attachment,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] == null ? null : json["id"],
    serviceId: json["service_id"] == null ? null : json["service_id"],
    attachment: json["attachment"] == null ? null : json["attachment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_id": serviceId == null ? null : serviceId,
    "attachment": attachment == null ? null : attachment,
  };
}

class RelatedElement {
  RelatedElement({
    this.id,
    this.serviceId,
    this.relatedId,
    this.related,
  });

  num id;
  num serviceId;
  num relatedId;
  RelatedRelated related;

  RelatedElement copyWith({
    num id,
    num serviceId,
    num relatedId,
    RelatedRelated related,
  }) =>
      RelatedElement(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        relatedId: relatedId ?? this.relatedId,
        related: related ?? this.related,
      );

  factory RelatedElement.fromJson(Map<String, dynamic> json) => RelatedElement(
    id: json["id"] == null ? null : json["id"],
    serviceId: json["service_id"] == null ? null : json["service_id"],
    relatedId: json["related_id"] == null ? null : json["related_id"],
    related: json["related"] == null ? null : RelatedRelated.fromJson(json["related"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_id": serviceId == null ? null : serviceId,
    "related_id": relatedId == null ? null : relatedId,
    "related": related == null ? null : related.toJson(),
  };
}

class RelatedRelated {
  RelatedRelated({
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

  num id;
  String image;
  num celebrityId;
  num serviceCategoryId;
  num isFeatured;
  num price;
  num priceOffer;
  num listInServices;
  String name;
  String description;
  String fullDescription;

  RelatedRelated copyWith({
    num id,
    String image,
    num celebrityId,
    num serviceCategoryId,
    num isFeatured,
    num price,
    num priceOffer,
    num listInServices,
    String name,
    String description,
    String fullDescription,
  }) =>
      RelatedRelated(
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

  factory RelatedRelated.fromJson(Map<String, dynamic> json) => RelatedRelated(
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

class VideoElement {
  VideoElement({
    this.id,
    this.serviceId,
    this.videoId,
    this.video,
  });

  num id;
  num serviceId;
  num videoId;
  VideoVideo video;

  VideoElement copyWith({
    num id,
    num serviceId,
    num videoId,
    VideoVideo video,
  }) =>
      VideoElement(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        videoId: videoId ?? this.videoId,
        video: video ?? this.video,
      );

  factory VideoElement.fromJson(Map<String, dynamic> json) => VideoElement(
    id: json["id"] == null ? null : json["id"],
    serviceId: json["service_id"] == null ? null : json["service_id"],
    videoId: json["video_id"] == null ? null : json["video_id"],
    video: json["video"] == null ? null : VideoVideo.fromJson(json["video"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_id": serviceId == null ? null : serviceId,
    "video_id": videoId == null ? null : videoId,
    "video": video == null ? null : video.toJson(),
  };
}

class VideoVideo {
  VideoVideo({
    this.id,
    this.image,
    this.url,
    this.isFeatured,
    this.name,
    this.description,
  });

  num id;
  String image;
  String url;
  num isFeatured;
  String name;
  String description;

  VideoVideo copyWith({
    num id,
    String image,
    String url,
    num isFeatured,
    String name,
    String description,
  }) =>
      VideoVideo(
        id: id ?? this.id,
        image: image ?? this.image,
        url: url ?? this.url,
        isFeatured: isFeatured ?? this.isFeatured,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory VideoVideo.fromJson(Map<String, dynamic> json) => VideoVideo(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    url: json["url"] == null ? null : json["url"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "url": url == null ? null : url,
    "is_featured": isFeatured == null ? null : isFeatured,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
  };
}
