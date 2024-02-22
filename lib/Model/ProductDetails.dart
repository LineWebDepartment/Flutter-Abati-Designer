// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.status,
    this.code,
    this.message,
    this.item,
  });

  bool status;
  num code;
  String message;
  Item item;

  ProductDetailsModel copyWith({
    bool status,
    num code,
    String message,
    Item item,
  }) =>
      ProductDetailsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        item: item ?? this.item,
      );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
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
    this.images,
    this.videos,
    this.relateds,
    this.designerName,
    this.urlLink
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
  String designerName;
  String urlLink;
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
  List<ColorElement> colors;
  String name;
  String description;
  List<Image> images;
  List<VideoElement> videos;
  List<RelatedElement> relateds;

  Item copyWith({
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
    String designerName,
    String urlLink,
    num weight,
    num bestseller,
    num newCollection,
    num price,
    num priceOffer,
    num hasVariants,
    num countSale,
    num changedPrice,
    bool isFavorite,
    num changedPriceOffer,
    List<ColorElement> colors,
    String name,
    String description,
    List<Image> images,
    List<VideoElement> videos,
    List<RelatedElement> relateds,
  }) =>
      Item(
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
        designerName: designerName ?? this.designerName,
        description: description ?? this.description,
        images: images ?? this.images,
        videos: videos ?? this.videos,
        relateds: relateds ?? this.relateds,
        urlLink: urlLink ?? this.urlLink,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
    designerName: json["designer_name"] == null ? null : json["designer_name"],
    urlLink: json["url_link"] == null ? null : json["url_link"],
    weight: json["weight"] == null ? null : json["weight"],
    bestseller: json["bestseller"] == null ? null : json["bestseller"],
    newCollection: json["new_collection"] == null ? null : json["new_collection"],
    price: json["price"] == null ? null : json["price"],
    priceOffer: json["price_offer"] == null ? null : json["price_offer"],
    hasVariants: json["has_variants"] == null ? null : json["has_variants"],
    countSale: json["count_sale"] == null ? null : json["count_sale"],
    changedPrice: json["changed_price"] == null ? null : json["changed_price"],
    isFavorite: json["is_favorite"] == null ? null : json["is_favorite"],
    changedPriceOffer: json["changed_price_offer"] == null ? null : json["changed_price_offer"],
    colors: json["colors"] == null ? null : List<ColorElement>.from(json["colors"].map((x) => ColorElement.fromJson(x))),
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    videos: json["videos"] == null ? null : List<VideoElement>.from(json["videos"].map((x) => VideoElement.fromJson(x))),
    relateds: json["relateds"] == null ? null : List<RelatedElement>.from(json["relateds"].map((x) => RelatedElement.fromJson(x))),
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
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
    "videos": videos == null ? null : List<dynamic>.from(videos.map((x) => x.toJson())),
    "relateds": relateds == null ? null : List<dynamic>.from(relateds.map((x) => x.toJson())),
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
  String code;
  Status status;
  bool isDisabled;
  List<Variation> variations;
  String name;

  ColorElement copyWith({
    num id,
    String code,
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
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    isDisabled: json["is_disabled"] == null ? null : json["is_disabled"],
    variations: json["variations"] == null ? null : List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "status": status == null ? null : statusValues.reverse[status],
    "is_disabled": isDisabled == null ? null : isDisabled,
    "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
    "name": name == null ? null : name,
  };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

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

class HeightClass {
  HeightClass({
    this.id,
    this.code,
    this.status,
    this.name,
  });

  num id;
  String code;
  Status status;
  String name;

  HeightClass copyWith({
    num id,
    String code,
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
    code: json["code"] == null ? null : json["code"],
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "status": status == null ? null : statusValues.reverse[status],
    "name": name == null ? null : name,
  };
}

class Image {
  Image({
    this.id,
    this.productId,
    this.attachment,
  });

  num id;
  num productId;
  String attachment;

  Image copyWith({
    num id,
    num productId,
    String attachment,
  }) =>
      Image(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        attachment: attachment ?? this.attachment,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    attachment: json["attachment"] == null ? null : json["attachment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "attachment": attachment == null ? null : attachment,
  };
}

class RelatedElement {
  RelatedElement({
    this.id,
    this.productId,
    this.relatedId,
    this.related,
  });

  num id;
  num productId;
  num relatedId;
  RelatedRelated related;

  RelatedElement copyWith({
    num id,
    num productId,
    num relatedId,
    RelatedRelated related,
  }) =>
      RelatedElement(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        relatedId: relatedId ?? this.relatedId,
        related: related ?? this.related,
      );

  factory RelatedElement.fromJson(Map<String, dynamic> json) => RelatedElement(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    relatedId: json["related_id"] == null ? null : json["related_id"],
    related: json["related"] == null ? null : RelatedRelated.fromJson(json["related"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "related_id": relatedId == null ? null : relatedId,
    "related": related == null ? null : related.toJson(),
  };
}

class RelatedRelated {
  RelatedRelated({
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
  double changedPrice;
  bool isFavorite;
  double changedPriceOffer;
  List<ColorElement> colors;
  String name;
  String description;

  RelatedRelated copyWith({
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
  }) =>
      RelatedRelated(
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

  factory RelatedRelated.fromJson(Map<String, dynamic> json) => RelatedRelated(
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
  };
}

class VideoElement {
  VideoElement({
    this.id,
    this.productId,
    this.videoId,
    this.video,
  });

  num id;
  num productId;
  num videoId;
  VideoVideo video;

  VideoElement copyWith({
    num id,
    num productId,
    num videoId,
    VideoVideo video,
  }) =>
      VideoElement(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        videoId: videoId ?? this.videoId,
        video: video ?? this.video,
      );

  factory VideoElement.fromJson(Map<String, dynamic> json) => VideoElement(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    videoId: json["video_id"] == null ? null : json["video_id"],
    video: json["video"] == null ? null : VideoVideo.fromJson(json["video"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
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
