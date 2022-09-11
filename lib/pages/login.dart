import 'package:flutter/material.dart';
import 'package:mirai_app/services/user_service.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
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
                        margin: EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          'assets/images/login_illustration.png',
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
                              cursorColor: primaryColor,
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
                                        BorderSide(color: primaryColor)),
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
                                cursorColor: primaryColor,
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
                            var data = <String, dynamic>{
                              'email': emailTextController.text,
                              'password': passwordTextController.text
                            };

                            try {
                              UserService()
                                  .userLogin(data)
                                  .then((response) async {
                                // if (response.success == true) {
                                if (response.token != null) {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setString(
                                      'token', response.token);
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/navbar',
                                    (route) => false,
                                  );
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
                    Text("don't have account?"),
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
                        Navigator.pushNamed(context, '/register');
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
