import 'dart:html';
import 'package:mirai_app/explore_page/foundation.dart';
import 'package:mirai_app/explore_page/lipstick.dart';
import 'package:mirai_app/explore_page/eyeshadow.dart';
import 'package:mirai_app/explore_page/mascara.dart';
import 'package:mirai_app/explore_page/blush_on.dart';
import 'package:mirai_app/explore_page/eyebrow.dart';
import 'package:mirai_app/explore_page/lip_cream.dart';
import 'package:mirai_app/explore_page/lip_matte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   backgroundColor: Colors.pink,
      //   title: Container(
      //     decoration: BoxDecoration(color: Colors.black),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 65, bottom: 16, left: 16, right: 16),
        child: Stack(
          children: [
            Positioned(
              top: -4,
              left: 15,
              child: Text(
                "Explore",
                style: new TextStyle(fontSize: 18.0),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Lipstick(),
                Foundation(),
                Mascara(),
                BlushOn(),
                Eyeshadow(),
                Eyebrow(),
                LipCream(),
                LipMatte(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
