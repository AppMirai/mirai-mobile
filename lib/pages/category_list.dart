import 'package:flutter/material.dart';
import 'package:mirai_app/widget/category_image.dart';

import '../shared/theme.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = 190;
    final double itemWidth = 155;
    List<CategoryImage> imageItems = items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: BackButton(color: blackColor),
        title: Text(
          "Category",
          style: TextStyle(
              color: blackColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GridView.count(
              padding: EdgeInsets.only(right: 24, left: 24, bottom: 60),
              shrinkWrap: true,
              controller: ScrollController(
                keepScrollOffset: false,
              ),
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              children: List.generate(imageItems.length, (index) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(right: 8, top: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageItems[index].urlImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ));
              })),
        ),
      ),
    );
  }
}
