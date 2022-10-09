import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../shared/theme.dart';
import '../widget/category_image.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 190;
    final double itemWidth = 155;
    List<CategoryImage> imageItem = items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        // title: Container(
        //   width: double.infinity,
        //   height: 40,
        //   decoration: BoxDecoration(
        //     color: whiteColor,
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        //   child: Center(
        //       child: TextField(
        //     cursorColor: primaryColor,
        //     decoration: InputDecoration(
        //         prefixIcon: Icon(
        //           Icons.search,
        //           color: greyColor,
        //         ),
        //         hintText: 'Search...',
        //         border: InputBorder.none),
        //   )),
        // ),
        title: Text(
          "Explore",
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
              // Container(
              //   margin: EdgeInsets.only(left: 24, top: 20),
              //   child: Text(
              //     'Explore',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              //   ),
              // ),
              GridView.count(
                  padding: EdgeInsets.only(right: 24, left: 24, bottom: 60),
                  shrinkWrap: true,
                  controller: ScrollController(
                    keepScrollOffset: false,
                  ),
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: List.generate(imageItem.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.productspage);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8, top: 16),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageItem[index].urlImage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
