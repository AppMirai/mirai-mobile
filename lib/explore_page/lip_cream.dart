import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';

class LipCream extends StatelessWidget {
  const LipCream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.pink,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Image.network(
                'https://cf.shopee.co.id/file/cb60c0812f6312f438c1b852cd5b4638',
              ),
              Text(
                "Foundation",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
