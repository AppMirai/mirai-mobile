import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';

import '../widget/brand_image.dart';

class BrandListScreen extends StatefulWidget {
  const BrandListScreen({Key? key}) : super(key: key);

  @override
  State<BrandListScreen> createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = 190;
    final double itemWidth = 155;
    List<BrandImage> imageItems = items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: BackButton(color: blackColor),
        title: Text(
          "Brand",
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
                  ),
                );
              })),
        ),
      ),
    );
  }
}
