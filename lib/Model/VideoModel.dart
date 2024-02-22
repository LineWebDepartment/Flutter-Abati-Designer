// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
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

  VideoModel copyWith({
    bool status,
    int code,
    String message,
    List<Item> items,
    bool isMore,
  }) =>
      VideoModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
        items: items ?? this.items,
        isMore: isMore ?? this.isMore,
      );

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
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
    this.image,
    this.url,
    this.isFeatured,
    this.name,
    this.description,
  });

  int id;
  String image;
  String url;
  int isFeatured;
  String name;
  String description;

  Item copyWith({
    int id,
    String image,
    String url,
    int isFeatured,
    String name,
    String description,
  }) =>
      Item(
        id: id ?? this.id,
        image: image ?? this.image,
        url: url ?? this.url,
        isFeatured: isFeatured ?? this.isFeatured,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
