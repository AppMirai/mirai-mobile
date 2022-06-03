import 'package:flutter/material.dart';
import '../../widget/brand_card_image.dart';

class CarouselBrand extends StatelessWidget {
  const CarouselBrand({Key? key}) : super(key: key);

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
                padding:
                    EdgeInsets.only(left: 24, top: 20, right: 24, bottom: 20),
                child: Text(
                  'Top Brands',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, top: 20, right: 24, bottom: 20),
                child: TextButton(
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFE66099),
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
              itemCount: 4,
              separatorBuilder: (context, _) => SizedBox(width: 10),
              itemBuilder: (context, index) => brandCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
