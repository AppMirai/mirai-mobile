import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirai_app/model/profile_user_model.dart';
import 'package:mirai_app/pages/components/carousel_banner.dart';
import 'package:mirai_app/pages/components/carousel_brand.dart';
import 'package:mirai_app/pages/components/navbar.dart';
import 'package:mirai_app/pages/components/product_tile.dart';
import 'package:mirai_app/services/user_service.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:skeleton_text/skeleton_text.dart';

import 'components/carousel_category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;

  UserProfileModel user = UserProfileModel(
      id: 0,
      name: "",
      email: "",
      emailVerifiedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  void getUserProfile() async {
    var data = await UserService().userProfile();

    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user.name != "") {
      setState(() {
        isLoading = false;
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: kPrimaryColor,
                ),
                SafeArea(
                  child: Container(
                    color: kWhiteColor,
                  ),
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 30, right: 24, bottom: 20),
                        child: isLoading
                            ? SkeletonAnimation(
                                shimmerColor: Colors.pink[100]!,
                                borderRadius: BorderRadius.circular(20),
                                shimmerDuration: 1000,
                                child: Container(
                                  height: 20,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.pink[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                ),
                              )
                            : Text(
                                'Hello, ${user.name}',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: medium,
                                ),
                              ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 30, right: 24, bottom: 20),
                        child: Icon(
                          Icons.favorite_border,
                          color: kWhiteColor,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: kGreyColor,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]),
                    width: double.infinity,
                    height: 48,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 24,
                      left: 24,
                      right: 24,
                    ),
                    child: TextField(
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        fillColor: kWhiteColor,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: kGreyColor,
                        ),
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CarouselBanner(),
                const CarouselBrand(),
                const CarouselCategory(),
                const ProductsTile(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                    child: Text(
                      "Mirai Dev @2022",
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
