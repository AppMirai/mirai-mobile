import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/strings.dart';
import '../model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.item});
  final CategoryData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(baseURLHOST + item.categoryImageUrl,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
