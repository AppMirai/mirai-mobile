import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../model/profile_user_model.dart';
import '../routes/route_name.dart';
import '../shared/theme.dart';
import '../services/user_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  height: 160,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
                Align(
                    child: Container(
                  margin: const EdgeInsets.only(
                    top: 100,
                    bottom: 24,
                    left: 24,
                    right: 24,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/profile.jpg'))),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: primaryColor,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                              onPressed: () {
                                Get.toNamed(RouteName.editprofile);
                                // Navigator.pushNamed(context, '/editprofile');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Column(
              children: [
                isLoading
                    ? SkeletonAnimation(
                        shimmerColor: Colors.grey[100]!,
                        borderRadius: BorderRadius.circular(20),
                        shimmerDuration: 1000,
                        child: Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(top: 10),
                        ),
                      )
                    : Text(
                        '${user.data.fullName}',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                isLoading
                    ? SkeletonAnimation(
                        shimmerColor: Colors.grey[100]!,
                        borderRadius: BorderRadius.circular(20),
                        shimmerDuration: 1000,
                        child: Container(
                          height: 20,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(top: 10),
                        ),
                      )
                    : Text(
                        '${user.data.email}',
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: Text(
                    'LOGOUT',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: Text(
      "Tidak",
      style: TextStyle(color: blackColor),
    ),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Logout",
      style: TextStyle(color: primaryColor),
    ),
    onPressed: () async {
      final prefs = await SharedPreferences.getInstance();

      prefs.remove("token");
      Get.offNamedUntil(RouteName.login, (route) => false);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Ingin Keluar?"),
    content: const Text("Apa kamu yakin mau Logout dari aplikasi ini? :("),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
