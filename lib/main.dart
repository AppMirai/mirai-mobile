import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai_app/cubit/page_cubit.dart';
import 'package:mirai_app/pages/ar_camera.dart';
import 'package:mirai_app/pages/brand_list.dart';
import 'package:mirai_app/pages/category_list.dart';
import 'package:mirai_app/pages/detail_product.dart';
import 'package:mirai_app/pages/home.dart';
import 'package:mirai_app/pages/like.dart';
import 'package:mirai_app/pages/login.dart';
import 'package:mirai_app/pages/onboarding.dart';
import 'package:mirai_app/pages/register.dart';
import 'package:mirai_app/pages/splash.dart';
import 'package:mirai_app/pages/upload_photo.dart';
import 'package:mirai_app/pages/components/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PageCubit(),
            ),
          ],
          child: MaterialApp(
            title: 'Mirai',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Poppins'),
            routes: {
              '/': (context) => Splash(),
              '/onboarding': (context) => const Onboarding(),
              '/navbar': (context) => const BottomNavigation(),
              '/home': (context) => const Home(),
              '/detail': (context) => const DetailProduct(),
              '/ar': (context) => const ArCamera(),
              '/login': (context) => const Login(),
              '/register': (context) => const Register(),
              '/upphoto': (context) => const UploadPhoto(),
              '/brand': (context) => const BrandListScreen(),
              '/category': (context) => const CategoryListScreen(),
              '/like': ((context) => const LikeScreen()),
            },
          ),
        );
      },
    );
  }
}
