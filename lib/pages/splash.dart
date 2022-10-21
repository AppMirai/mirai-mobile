import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../pages/home.dart';
import '../pages/components/navbar.dart';
import '../routes/route_name.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkToken();
    });
  }

  void checkToken() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token != null) {
      Get.toNamed(RouteName.navbar);
      // Navigator.pushReplacementNamed(context, '/navbar');
    } else {
      Get.toNamed(RouteName.login);
      // Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE66099), Color(0xFFEE90B8)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/mirai_logo.png',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
