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

class Kategori extends StatelessWidget {
  Kategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24, top: 50, right: 24, bottom: 20),
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24, top: 20, right: 24, bottom: 20),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                //child: CupertinoSearchTextField(),
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                    child: Text(
                      "Mirai Dev @2022",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
