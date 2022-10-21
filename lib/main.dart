import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai_app/cubit/page_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'package:mirai_app/routes/page_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

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
          child: GetMaterialApp(
            title: 'Mirai',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Poppins'),
            getPages: RoutePage.pages,
            // routes: {
            //   '/': (context) => Splash(),
            //   '/onboarding': (context) => const Onboarding(),
            //   '/navbar': (context) => const BottomNavigation(),
            //   '/home': (context) => const Home(),
            //   '/detail': (context) => const DetailProduct(),
            //   '/ar': (context) => const ArCamera(),
            //   '/login': (context) => const Login(),
            //   '/register': (context) => const Register(),
            //   '/upphoto': (context) => const UploadPhoto(),
            //   '/brand': (context) => const BrandListScreen(),
            //   '/category': (context) => const CategoryListScreen(),
            //   '/like': ((context) => const LikeScreen()),
            //   '/editprofile': ((context) => const EditProfile()),
            // },
          ),
        );
      },
    );
  }
}
