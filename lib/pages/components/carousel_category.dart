import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';
import '../../widget/category_card_image.dart';

class CarouselCategory extends StatelessWidget {
  const CarouselCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                child: Text(
                  'Category',
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
                      color: kPrimaryColor,
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Container(
            height: 140,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 20),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, _) => SizedBox(width: 10),
              itemBuilder: (context, index) => categoryCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
