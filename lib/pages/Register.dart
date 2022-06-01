import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  Container(
                    child: Image.asset(
                      'assets/images/register_illustration.png',
                      height: 184,
                      width: 184,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Email'),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          TextFormField(
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: kPrimaryColor)),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Email'),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          TextFormField(
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: kPrimaryColor)),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Password'),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          TextFormField(
                              cursorColor: kPrimaryColor,
                              obscureText: visible,
                              decoration: InputDecoration(
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
                    height: 55,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
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
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("already have account?"),
                        SizedBox(
                          width: 3,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
