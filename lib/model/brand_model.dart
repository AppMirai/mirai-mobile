// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
    BrandModel({
        required this.message,
        required this.data,
    });

    String message;
    List<Datum> data;

    factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.brandImageUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.products,
    });

    int id;
    String name;
    String brandImageUrl;
    DateTime createdAt;
    DateTime updatedAt;
    List<Product> products;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        brandImageUrl: json["brand_image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand_image_url": brandImageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
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
        "category_id": categoryId,
        "brand_id": brandId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
