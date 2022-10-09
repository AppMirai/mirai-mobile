import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../model/profile_user_model.dart';
import '../routes/route_name.dart';
import '../services/user_service.dart';
import '../shared/theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameTextController = TextEditingController();
  bool isLoading = true;
  bool showPassword = false;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                  Align(
                      child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
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
                                    image: AssetImage(
                                        'assets/images/profile.jpg'))),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: primaryColor,
                        controller: nameTextController,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          labelText: "Full Name",
                          hintText: '${user.data.fullName}',
                          hintStyle: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: primaryColor)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        enabled: false,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          labelText: "Email",
                          hintText: '${user.data.email}',
                          hintStyle: greyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: primaryColor)),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 100, left: 24, right: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                      onPressed: () {
                        var data = <String, dynamic>{
                          'name': nameTextController.text,
                        };

                        try {
                          UserService().updateProfile(data);

                          Get.offNamed(RouteName.navbar);
                          // Navigator.pushReplacementNamed(context, '/navbar');
                        } catch (e) {
                          print(e);
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: Text('SAVE',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
