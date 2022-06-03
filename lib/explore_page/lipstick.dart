import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';
import 'package:mirai_app/screens/detail_screen.dart';

class Lipstick extends StatelessWidget {
  const Lipstick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: InkWell(
        onTap: () async {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailScreen()));
        },
        splashColor: Colors.pink,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Image.network(
                'https://cf.shopee.co.id/file/cb60c0812f6312f438c1b852cd5b4638',
              ),
              Text(
                "Lipstick",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
