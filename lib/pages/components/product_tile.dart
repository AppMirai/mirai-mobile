import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:mirai_app/widget/product_tile_items.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: Text(
                'Recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: TextButton(
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        ProductTileItems(),
      ],
    );
  }
}
