import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';

class Foundation extends StatelessWidget {
  const Foundation({Key? key}) : super(key: key);

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
                'https://id-test-11.slatic.net/p/92fdde11b044dd035d3acc5476bbee08.jpg',
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
