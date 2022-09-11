import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  final String urlImage;
  final String urlPage;

  const CategoryItem({
    required this.urlImage,
    required this.urlPage,
  });
}

List<CategoryItem> items = [
  CategoryItem(
    urlImage: 'assets/images/kategori_lipstik.png',
    urlPage: '',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_foundation.png',
    urlPage: '',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_mascara.png',
    urlPage: '',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_blushon.png',
    urlPage: '',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_lipmatte.png',
    urlPage: '',
  ),
  CategoryItem(
    urlImage: 'assets/images/kategori_eyebrow.png',
    urlPage: '',
  ),
];

class CategoryCard extends StatelessWidget {
  final int index;

  CategoryCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, items[index].urlPage);
      },
      child: Container(
        width: 100,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(items[index].urlImage,
                          fit: BoxFit.cover))),
            )
          ],
        ),
      ),
    );
  }
}