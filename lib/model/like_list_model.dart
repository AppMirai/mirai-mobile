// To parse this JSON data, do
//
//     final likeProductModel = likeProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LikeProductModel likeProductModelFromJson(String str) =>
    LikeProductModel.fromJson(json.decode(str));

String likeProductModelToJson(LikeProductModel data) =>
    json.encode(data.toJson());

class LikeProductModel {
  LikeProductModel({
    required this.message,
    required this.data,
  });

  String message;
  List<LikeData> data;

  factory LikeProductModel.fromJson(Map<String, dynamic> json) =>
      LikeProductModel(
        message: json["message"],
        data: List<LikeData>.from(json["data"].map((x) => LikeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LikeData {
  LikeData({
    required this.id,
    required this.userId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  int id;
  int userId;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory LikeData.fromJson(Map<String, dynamic> json) => LikeData(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.linkTokopedia,
    required this.linkShopee,
    required this.productImageUrl,
    required this.categoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int price;
  String description;
  String linkTokopedia;
  String linkShopee;
  String productImageUrl;
  int categoryId;
  int brandId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        linkTokopedia: json["link_tokopedia"],
        linkShopee: json["link_shopee"],
        productImageUrl: json["product_image_url"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "link_tokopedia": linkTokopedia,
        "link_shopee": linkShopee,
        "product_image_url": productImageUrl,
        "category_id": categoryId,
        "brand_id": brandId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
