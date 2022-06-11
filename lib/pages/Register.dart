import 'package:flutter/material.dart';
import 'package:mirai_app/services/user_service.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Register',
                        style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                            color: kPrimaryColor),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Image.asset(
                          'assets/images/register_illustration.png',
                          height: 184,
                          width: 184,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              cursorColor: kPrimaryColor,
                              controller: nameTextController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                hintText: 'Full Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                        BorderSide(color: kPrimaryColor)),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              cursorColor: kPrimaryColor,
                              controller: emailTextController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                        BorderSide(color: kPrimaryColor)),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                                cursorColor: kPrimaryColor,
                                controller: passwordTextController,
                                obscureText: visible,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: kPrimaryColor,
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
                            var data = <String, dynamic>{
                              'name': nameTextController.text,
                              'email': emailTextController.text,
                              'password': passwordTextController.text,
                            };

                            try {
                              UserService().userRegister(data);

                              Navigator.pushReplacementNamed(context, '/login');
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          child: Text('REGISTER',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semiBold,
                              ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have account?"),
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
                        Navigator.pushNamed(context, '/login');
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
