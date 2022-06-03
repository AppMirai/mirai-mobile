import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';

class BlushOn extends StatelessWidget {
  const BlushOn({Key? key}) : super(key: key);

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
                'https://s0.bukalapak.com/img/5679042605/large/LT_PRO_Blush_ON.jpg.webp',
              ),
              Text(
                "Blush On",
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
