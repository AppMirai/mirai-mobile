import 'package:get/get.dart';
import 'package:mirai_app/pages/products_page.dart';
import '../pages/splash.dart';
import '../pages/ar_camera.dart';
import '../pages/brand_list.dart';
import '../pages/category_list.dart';
import '../pages/components/navbar.dart';
import '../pages/detail_product.dart';
import '../pages/edit_profile.dart';
import '../pages/home.dart';
import '../pages/like.dart';
import '../pages/login.dart';
import '../pages/onboarding.dart';
import '../pages/register.dart';
import '../pages/upload_photo.dart';
import '../routes/route_name.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.splash,
      page: () => Splash(),
    ),
    GetPage(
      name: RouteName.onboarding,
      page: () => Onboarding(),
    ),
    GetPage(
      name: RouteName.navbar,
      page: () => BottomNavigation(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => Home(),
    ),
    GetPage(
      name: RouteName.detail,
      page: () => DetailProduct(),
    ),
    GetPage(
      name: RouteName.ar,
      page: () => ArCamera(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => Login(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => Register(),
    ),
    GetPage(
      name: RouteName.upphoto,
      page: () => UploadPhoto(),
    ),
    GetPage(
      name: RouteName.brand,
      page: () => BrandListScreen(),
    ),
    GetPage(
      name: RouteName.category,
      page: () => CategoryListScreen(),
    ),
    GetPage(
      name: RouteName.like,
      page: () => LikeScreen(),
    ),
    GetPage(
      name: RouteName.editprofile,
      page: () => EditProfile(),
    ),
    GetPage(
      name: RouteName.productspage,
      page: () => ProductsPage(),
    ),
  ];
}
