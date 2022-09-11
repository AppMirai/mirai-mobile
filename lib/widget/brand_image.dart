import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandImage {
  final String urlImage;

  const BrandImage({
    required this.urlImage,
  });
}

List<BrandImage> items = [
  BrandImage(
    urlImage: 'assets/images/brand_maybeline.png',
  ),
  BrandImage(
    urlImage: 'assets/images/brand_shuuemura.png',
  ),
  BrandImage(
    urlImage: 'assets/images/brand_makeover.png',
  ),
  BrandImage(
    urlImage: 'assets/images/brand_revlon.png',
  ),
];
