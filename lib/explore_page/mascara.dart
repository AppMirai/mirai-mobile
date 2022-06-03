import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';

class Mascara extends StatelessWidget {
  const Mascara({Key? key}) : super(key: key);

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
                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-mascara-sensitive-eyes-1651245807.jpg?crop=0.502xw:1.00xh;0.271xw,0&resize=640:*',
              ),
              Text(
                "Mascara",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
