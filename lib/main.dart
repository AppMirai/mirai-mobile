import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai_app/cubit/page_cubit.dart';
import 'package:mirai_app/routes/page_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          ),
        );
      },
    );
  }
}
