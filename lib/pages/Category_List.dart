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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        leading: BackButton(color: kBlackColor),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: TextField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: kGreyColor,
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          )),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 24),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.favorite_outline,
                  color: kPrimaryColor,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Ini Category Screen'),
          ],
        ),
      ),
    );
  }
}
