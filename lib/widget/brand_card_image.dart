import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandItem {
  final String urlImage;

  const BrandItem({
    required this.urlImage,
  });
}

List<BrandItem> items = [
  BrandItem(
    urlImage: 'assets/images/brand_maybeline.png',
  ),
  BrandItem(
    urlImage: 'assets/images/brand_shuuemura.png',
  ),
  BrandItem(
    urlImage: 'assets/images/brand_makeover.png',
  ),
  BrandItem(
    urlImage: 'assets/images/brand_revlon.png',
  ),
];

Widget brandCard({required BrandItem item}) => SizedBox(
      width: 100,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(item.urlImage, fit: BoxFit.cover))),
          )
        ],
      ),
    );
