import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/route_name.dart';
import '../services/user_service.dart';
import '../shared/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'Login',
                        style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                            color: primaryColor),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          'assets/images/login_illustration.png',
                          height: 184,
                          width: 184,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              cursorColor: primaryColor,
                              controller: emailTextController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                labelText: "Email",
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                        BorderSide(color: primaryColor)),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                                cursorColor: primaryColor,
                                controller: passwordTextController,
                                obscureText: visible,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  labelText: "Password",
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: primaryColor)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: primaryColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                  ),
                                )),
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                          onPressed: () {
                            try {
                              var data = <String, dynamic>{
                                'email': emailTextController.text,
                                'password': passwordTextController.text
                              };

                              UserService()
                                  .userLogin(data)
                                  .then((response) async {
                                // if (response.success == true) {
                                if (response!.accessToken != null) {
                                  // const snackBar = SnackBar(
                                  //   content: Text('Anda Berhasil Login'),
                                  //   backgroundColor: Colors.green,
                                  // );
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(snackBar);
                                  Get.snackbar(
                                      'Login Success', 'Anda Berhasil Login',
                                      colorText: whiteColor,
                                      snackPosition: SnackPosition.TOP,
                                      forwardAnimationCurve: Curves.bounceIn,
                                      reverseAnimationCurve: Curves.easeOut,
                                      backgroundColor: Colors.green);
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setString(
                                      'token', response.accessToken);
                                  Get.offNamedUntil(
                                      RouteName.navbar, (route) => false);
                                }
                              }).catchError((error) {
                                Get.snackbar('Login Error',
                                    'Email atau Password anda salah',
                                    colorText: whiteColor,
                                    snackPosition: SnackPosition.TOP,
                                    forwardAnimationCurve: Curves.bounceIn,
                                    reverseAnimationCurve: Curves.easeOut,
                                    backgroundColor: redColor);
                              });
                            } catch (e) {
                              Get.snackbar('Login Error',
                                  'Email atau Password anda salah',
                                  colorText: whiteColor,
                                  snackPosition: SnackPosition.TOP,
                                  forwardAnimationCurve: Curves.bounceIn,
                                  reverseAnimationCurve: Curves.easeOut,
                                  backgroundColor: redColor);
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          child: Text('LOGIN',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semiBold,
                              ))),
                    ),
                    // Center(
                    //   child: Container(
                    //     child: TextButton(
                    //       child: Text('Forgot Password ?',
                    //           style: pinkTextStyle.copyWith(
                    //             fontSize: 14,
                    //             fontWeight: regular,
                    //           )),
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have account?"),
                    SizedBox(
                      width: 0.2.h,
                    ),
                    TextButton(
                      child: Text('Register',
                          style: pinkTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          )),
                      onPressed: () {
                        Get.toNamed(RouteName.register);
                        // Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
