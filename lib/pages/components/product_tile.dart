import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/widget/product_tile_items.dart';

import '../../routes/route_name.dart';
import '../../shared/theme.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: TextButton(
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  Get.toNamed(RouteName.productlist);
                  // Navigator.pushNamed(context, '/category');
                },
              ),
            )
          ],
        ),
        ProductTileItems(),
      ],
    );
  }
}
