import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirai_app/pages/components/carousel_banner.dart';
import 'package:mirai_app/pages/components/carousel_brand.dart';
import 'package:mirai_app/pages/components/navbar.dart';
import 'package:mirai_app/pages/components/product_tile.dart';
import 'package:mirai_app/shared/theme.dart';

import 'components/carousel_category.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: kPrimaryColor,
                ),
                SafeArea(
                  child: Container(
                    color: kWhiteColor,
                  ),
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 30, right: 24, bottom: 20),
                        child: Text(
                          'MiraiApp',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 30, right: 24, bottom: 20),
                        child: Icon(
                          Icons.favorite_border,
                          color: kWhiteColor,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 24,
                      left: 24,
                      right: 24,
                    ),
                    child: CupertinoSearchTextField(
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CarouselBanner(),
                const CarouselBrand(),
                const CarouselCategory(),
                const ProductsTile(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                    child: Text(
                      "Mirai Dev @2022",
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
