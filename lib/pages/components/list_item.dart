import 'package:flutter/material.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/model/product_model.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item}) : super(key: key);

  final ProductData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.detail, arguments: item);
        // Navigator.pushNamed(context, '/detail', arguments: item);
      },
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(baseURLHOST + item.productImageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rp. " + item.price.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
