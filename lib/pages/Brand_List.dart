import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';

class BrandListScreen extends StatefulWidget {
  const BrandListScreen({Key? key}) : super(key: key);

  @override
  State<BrandListScreen> createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> {
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
            ),
          ),
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
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Ini Brand Screen'),
          ],
        ),
      ),
    );
  }
}
