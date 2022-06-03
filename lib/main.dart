import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';
import 'package:mirai_app/explore_page/kategori.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mirai_app/screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirai App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryScreen(),
    );
  }
}
