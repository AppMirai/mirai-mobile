import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../routes/route_name.dart';
import '../services/user_service.dart';
import '../shared/theme.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameTextController = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Register',
                          style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                              color: primaryColor),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/register_illustration.png',
                          height: 184,
                          width: 184,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                cursorColor: primaryColor,
                                controller: nameTextController,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  labelText: "Full Name",
                                  hintText: 'Full Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: primaryColor)),
                                ),
                                validator: (value) {
                                  if (!GetUtils.isNull(value!))
                                    return "Full Name tidak valid";
                                  else
                                    return null;
                                },
                              ),
                            ]),
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
                                validator: (value) {
                                  if (!GetUtils.isEmail(value!))
                                    return "Email tidak valid";
                                  else
                                    return null;
                                },
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
                                      visible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: visible ? primaryColor : greyColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (!GetUtils.isLengthGreaterThan(value!, 8))
                                    return "Password tidak valid";
                                  else
                                    return null;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "* Password harus terdiri dari minimal 8 huruf",
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextButton(
                            onPressed: () async {
                              var data = <String, dynamic>{
                                'full_name': nameTextController.text,
                                'email': emailTextController.text,
                                'password': passwordTextController.text,
                              };

                              try {
                                formkey.currentState!.validate();
                                await UserService()
                                    .userRegister(data)
                                    .then((value) {
                                  if (value) {
                                    Get.offNamed(RouteName.login);
                                  } else {
                                    throw ('error');
                                  }
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                            child: Text('Register',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already have account?"),
                    SizedBox(
                      width: 0.2.h,
                    ),
                    TextButton(
                      child: Text('Login',
                          style: pinkTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          )),
                      onPressed: () {
                        Get.toNamed(RouteName.login);
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
