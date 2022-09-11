// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.data,
  });

  List<Product> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.shade,
    required this.description,
    required this.tokopedia,
    required this.shopee,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  int id;
  String name;
  String image;
  String price;
  String shade;
  String description;
  String tokopedia;
  String shopee;
  DateTime createdAt;
  DateTime updatedAt;
  List<ImageList> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        shade: json["shade"],
        description: json["description"],
        tokopedia: json["tokopedia"],
        shopee: json["shopee"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<ImageList>.from(
            json["images"].map((x) => ImageList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "shade": shade,
        "description": description,
        "tokopedia": tokopedia,
        "shopee": shopee,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ImageList {
  ImageList({
    required this.id,
    required this.images,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String images;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
        id: json["id"],
        images: json["images"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
