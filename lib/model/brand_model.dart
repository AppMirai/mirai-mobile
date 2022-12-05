// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  BrandModel({
    required this.message,
    required this.data,
  });

  String message;
  List<BrandData> data;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        message: json["message"],
        data: List<BrandData>.from(
            json["data"].map((x) => BrandData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BrandData {
  BrandData({
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

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
        id: json["id"],
        name: json["name"],
        brandImageUrl: json["brand_image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
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
    required this.productImageUrl,
    required this.categoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
    required this.productImagesDetail,
    required this.category,
    required this.productShades,
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
  List<ProductImagesDetailElement> productImagesDetail;
  Category category;
  List<ProductImagesDetailElement> productShades;

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
        productImagesDetail: List<ProductImagesDetailElement>.from(
            json["product_images_detail"]
                .map((x) => ProductImagesDetailElement.fromJson(x))),
        category: Category.fromJson(json["category"]),
        productShades: List<ProductImagesDetailElement>.from(
            json["product_shades"]
                .map((x) => ProductImagesDetailElement.fromJson(x))),
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
        "product_images_detail":
            List<dynamic>.from(productImagesDetail.map((x) => x.toJson())),
        "category": category.toJson(),
        "product_shades":
            List<dynamic>.from(productShades.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.categoryImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String categoryImageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        categoryImageUrl: json["category_image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_image_url": categoryImageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ProductImagesDetailElement {
  ProductImagesDetailElement({
    required this.id,
    required this.photoProductUrl,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.nameShade,
  });

  int id;
  String? photoProductUrl;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;
  String? nameShade;

  factory ProductImagesDetailElement.fromJson(Map<String, dynamic> json) =>
      ProductImagesDetailElement(
        id: json["id"],
        photoProductUrl:
            json["photo_product_url"] == null ? "" : json["photo_product_url"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nameShade: json["name_shade"] == null ? "" : json["name_shade"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_product_url": photoProductUrl == null ? null : photoProductUrl,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name_shade": nameShade == null ? null : nameShade,
      };
}
