import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Login',
          style: blackTextStyle.copyWith(
              fontSize: 24, fontWeight: semiBold, color: kPrimaryColor),
        ),
      );
    }

    Widget imageHero() {
      return Container(
        child: Image.asset(
          'assets/images/login_illustration.png',
          height: 184,
          width: 184,
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      borderSide: BorderSide(color: kPrimaryColor)),
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
        );
      }

      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 55,
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/navbar');
              },
              style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('LOGIN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ))),
        );
      }

      Widget forgotPasswordButton() {
        return Container(
          child: TextButton(
            child: Text('Forgot Password ?',
                style: pinkTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                )),
            onPressed: () {},
          ),
        );
      }

      Widget toRegisterButton() {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("don't have account?"),
              SizedBox(
                width: 3,
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
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
            SizedBox(
              height: 20,
            ),
            forgotPasswordButton(),
            toRegisterButton(),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            title(),
            imageHero(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
