import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/shared/theme.dart';

import '../model/product_model.dart';
import '../routes/route_name.dart';
import '../widget/product_tile_items.dart';

class ProductsPage extends StatelessWidget {
  // const ProductsPage({Key? key, required this.item});
  const ProductsPage({super.key});

  // final Product item;

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 190;
    final double itemWidth = 155;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          "Products",
          style: TextStyle(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 24),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: primaryColor,
                  onPressed: () {
                    Get.toNamed(RouteName.like);
                    // Navigator.pushNamed(context, '/like');
                  },
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GridView.count(
              //   padding: EdgeInsets.only(right: 24, left: 24, bottom: 60),
              //   shrinkWrap: true,
              //   controller: ScrollController(
              //     keepScrollOffset: false,
              //   ),
              //   crossAxisCount: 2,
              //   childAspectRatio: (itemWidth / itemHeight),
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(left: 24, right: 24, bottom: 20),
              //       padding: EdgeInsets.all(10),
              //       decoration: BoxDecoration(
              //           color: whiteColor,
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Container(
              //         width: 70,
              //         height: 70,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             image: DecorationImage(
              //                 fit: BoxFit.cover,
              //                 image: NetworkImage(item.image))),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
