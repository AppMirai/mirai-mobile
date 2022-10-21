// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:get/get.dart';

import '../model/profile_user_model.dart';
import '../pages/components/carousel_banner.dart';
import '../pages/components/carousel_brand.dart';
import '../pages/components/carousel_category.dart';
// import '../pages/components/navbar.dart';
import '../pages/components/product_tile.dart';
import '../services/user_service.dart';
import '../shared/theme.dart';
import '../routes/route_name.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;

  UserProfileModel user = UserProfileModel(
    message: "",
    data: Data(
        id: 0,
        fullName: "",
        email: "",
        photoUserUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  );

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
    if (user.data.fullName != "") {
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
                  color: primaryColor,
                ),
                SafeArea(
                  child: Container(
                    color: whiteColor,
                  ),
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 30, right: 24, bottom: 30),
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
                                  margin: const EdgeInsets.only(top: 10),
                                ),
                              )
                            : Text(
                                'Hello, ${user.data.fullName}',
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 20,
                                  fontWeight: medium,
                                ),
                              ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 30, right: 24, bottom: 30),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: whiteColor,
                          onPressed: () {
                            Get.toNamed(RouteName.like);
                            // Navigator.pushNamed(context, '/like');
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    child: const CarouselBanner(),
                    margin: const EdgeInsets.only(
                      top: 100,
                    ),
                  ),
                  //     decoration: BoxDecoration(boxShadow: [
                  //       BoxShadow(
                  //         color: greyColor,
                  //         blurRadius: 4,
                  //         offset: Offset(0, 2),
                  //       )
                  //     ]),
                  //     width: double.infinity,
                  //     height: 48,
                  //     margin: const EdgeInsets.only(
                  //       top: 100,
                  //       bottom: 24,
                  //       left: 24,
                  //       right: 24,
                  //     ),
                  //     child: TextField(
                  //       cursorColor: primaryColor,
                  //       decoration: InputDecoration(
                  //         fillColor: whiteColor,
                  //         filled: true,
                  //         prefixIcon: Icon(
                  //           Icons.search,
                  //           color: greyColor,
                  //         ),
                  //         hintText: 'Search...',
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //           borderSide: BorderSide(
                  //             width: 0,
                  //             style: BorderStyle.none,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const CarouselBanner(),
                const CarouselBrand(),
                const CarouselCategory(),
                const ProductsTile(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                    child: Text(
                      "Mirai Dev @2022",
                      style: TextStyle(
                        color: greyColor,
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
