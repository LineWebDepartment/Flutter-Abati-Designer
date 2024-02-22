// To parse this JSON data, do
//
//     final videoDetailsModel = videoDetailsModelFromJson(jsonString);

import 'dart:convert';

VideoDetailsModel videoDetailsModelFromJson(String str) => VideoDetailsModel.fromJson(json.decode(str));

String videoDetailsModelToJson(VideoDetailsModel data) => json.encode(data.toJson());

class VideoDetailsModel {
  VideoDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  num code;
  String message;
  Item item;

  VideoDetailsModel copyWith({
    bool status,
    num code,
    String message,
    Item item,
  }) =>
      VideoDetailsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory VideoDetailsModel.fromJson(Map<String, dynamic> json) => VideoDetailsModel(
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
    this.url,
    this.isFeatured,
    this.name,
    this.description,
    this.products,
    this.services,
  });

  num id;
  String image;
  String url;
  num isFeatured;
  String name;
  String description;
  List<ProductElement> products;
  List<ServiceElement> services;

  Item copyWith({
    num id,
    String image,
    String url,
    num isFeatured,
    String name,
    String description,
    List<ProductElement> products,
    List<ServiceElement> services,
  }) =>
      Item(
        id: id ?? this.id,
        image: image ?? this.image,
        url: url ?? this.url,
        isFeatured: isFeatured ?? this.isFeatured,
        name: name ?? this.name,
        description: description ?? this.description,
        products: products ?? this.products,
        services: services ?? this.services,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    url: json["url"] == null ? null : json["url"],
    isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    products: json["products"] == null ? null : List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
    services: json["services"] == null ? null : List<ServiceElement>.from(json["services"].map((x) => ServiceElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "url": url == null ? null : url,
    "is_featured": isFeatured == null ? null : isFeatured,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    "services": services == null ? null : List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class ProductElement {
  ProductElement({
    this.id,
    this.productId,
    this.videoId,
    this.product,
  });

  num id;
  num productId;
  num videoId;
  ProductProduct product;

  ProductElement copyWith({
    num id,
    num productId,
    num videoId,
    ProductProduct product,
  }) =>
      ProductElement(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        videoId: videoId ?? this.videoId,
        product: product ?? this.product,
      );

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    videoId: json["video_id"] == null ? null : json["video_id"],
    product: json["product"] == null ? null : ProductProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "video_id": videoId == null ? null : videoId,
    "product": product == null ? null : product.toJson(),
  };
}

class ProductProduct {
  ProductProduct({
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
  num changedPrice;
  bool isFavorite;
  num changedPriceOffer;
  List<dynamic> colors;
  String name;
  String description;

  ProductProduct copyWith({
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
    dynamic priceOffer,
    num hasVariants,
    num countSale,
    num changedPrice,
    bool isFavorite,
    num changedPriceOffer,
    List<dynamic> colors,
    String name,
    String description,
  }) =>
      ProductProduct(
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

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
    priceOffer: json["price_offer"],
    hasVariants: json["has_variants"] == null ? null : json["has_variants"],
    countSale: json["count_sale"] == null ? null : json["count_sale"],
    changedPrice: json["changed_price"] == null ? null : json["changed_price"],
    isFavorite: json["is_favorite"] == null ? null : json["is_favorite"],
    changedPriceOffer: json["changed_price_offer"] == null ? null : json["changed_price_offer"],
    colors: json["colors"] == null ? null : List<dynamic>.from(json["colors"].map((x) => x)),
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
    "price_offer": priceOffer,
    "has_variants": hasVariants == null ? null : hasVariants,
    "count_sale": countSale == null ? null : countSale,
    "changed_price": changedPrice == null ? null : changedPrice,
    "is_favorite": isFavorite == null ? null : isFavorite,
    "changed_price_offer": changedPriceOffer == null ? null : changedPriceOffer,
    "colors": colors == null ? null : List<dynamic>.from(colors.map((x) => x)),
    "name": name == null ? null : name,
    "description": description == null ? null : description,
  };
}

class ServiceElement {
  ServiceElement({
    this.id,
    this.serviceId,
    this.videoId,
    this.service,
  });

  num id;
  num serviceId;
  num videoId;
  ServiceService service;

  ServiceElement copyWith({
    num id,
    num serviceId,
    num videoId,
    ServiceService service,
  }) =>
      ServiceElement(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        videoId: videoId ?? this.videoId,
        service: service ?? this.service,
      );

  factory ServiceElement.fromJson(Map<String, dynamic> json) => ServiceElement(
    id: json["id"] == null ? null : json["id"],
    serviceId: json["service_id"] == null ? null : json["service_id"],
    videoId: json["video_id"] == null ? null : json["video_id"],
    service: json["service"] == null ? null : ServiceService.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_id": serviceId == null ? null : serviceId,
    "video_id": videoId == null ? null : videoId,
    "service": service == null ? null : service.toJson(),
  };
}

class ServiceService {
  ServiceService({
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

  ServiceService copyWith({
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
      ServiceService(
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

  factory ServiceService.fromJson(Map<String, dynamic> json) => ServiceService(
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
