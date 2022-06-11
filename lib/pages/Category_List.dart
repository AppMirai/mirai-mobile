import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = 190;
    final double itemWidth = 155;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        leading: BackButton(color: kBlackColor),
        title: Text(
          "Category",
          style: TextStyle(
              color: kBlackColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GridView.count(
            padding: EdgeInsets.only(right: 24, left: 24, bottom: 60),
            shrinkWrap: true,
            controller: ScrollController(
              keepScrollOffset: false,
            ),
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_lipstik.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/kategori_foundation.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_mascara.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_blushon.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_eyeshadow.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_eyebrow.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_lipcream.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 8, top: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kategori_lipmatte.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
