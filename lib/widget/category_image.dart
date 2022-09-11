import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryImage {
  final String urlImage;
  final String urlPage;

  const CategoryImage({
    required this.urlImage,
    required this.urlPage,
  });
}

List<CategoryImage> items = [
  CategoryImage(
    urlImage: 'assets/images/kategori_lipstik.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_foundation.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_mascara.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_blushon.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_lipmatte.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_eyebrow.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_eyeshadow.png',
    urlPage: '',
  ),
  CategoryImage(
    urlImage: 'assets/images/kategori_lipcream.png',
    urlPage: '',
  ),
];
