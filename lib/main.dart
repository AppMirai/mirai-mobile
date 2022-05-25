import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai_app/cubit/page_cubit.dart';
import 'package:mirai_app/pages/AR_Camera.dart';
import 'package:mirai_app/pages/Detail_Product.dart';
import 'package:mirai_app/pages/Home.dart';
import 'package:mirai_app/pages/Login.dart';
import 'package:mirai_app/pages/Register.dart';
import 'package:mirai_app/pages/Splash.dart';
import 'package:mirai_app/pages/Upload_Photo.dart';
import 'package:mirai_app/pages/components/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Mirai App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          '/': (context) => Splash(),
          '/navbar': (context) => BottomNavigation(),
          '/home': (context) => Home(),
          '/detail': (context) => DetailProduct(),
          '/ar': (context) => ARCamera(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/upphoto': (context) => UploadPhoto(),
        },
      ),
    );
  }
}
