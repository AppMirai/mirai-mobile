import 'package:get/get.dart';
import 'package:mirai_app/pages/photo_filter.dart';
import 'package:mirai_app/pages/products_page.dart';
import 'package:mirai_app/pages/profile.dart';
import '../pages/products_brand_page.dart';
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
      page: () => const Splash(),
    ),
    GetPage(
      name: RouteName.onboarding,
      page: () => const Onboarding(),
    ),
    GetPage(
      name: RouteName.navbar,
      page: () => const BottomNavigation(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const Home(),
    ),
    GetPage(
      name: RouteName.detail,
      page: () => const DetailProduct(),
    ),
    GetPage(
      name: RouteName.ar,
      page: () => const ArCamera(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const Login(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => const Register(),
    ),
    GetPage(
      name: RouteName.upphoto,
      page: () => const UploadPhoto(),
    ),
    GetPage(
      name: RouteName.brand,
      page: () => const BrandListScreen(),
    ),
    GetPage(
      name: RouteName.category,
      page: () => CategoryListScreen(),
    ),
    GetPage(
      name: RouteName.like,
      page: () => const LikeScreen(),
    ),
    GetPage(
      name: RouteName.editprofile,
      page: () => const EditProfile(),
    ),
    GetPage(
      name: RouteName.productspage,
      page: () => const ProductsPage(),
    ),
    GetPage(
      name: RouteName.productsbrandpage,
      page: () => const ProductBrandsPage(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => const Profile(),
    ),
    GetPage(
      name: RouteName.photofilter,
      page: () => const PhotoFilter(),
    ),
    GetPage(
      name: RouteName.uploadphoto,
      page: () => const UploadPhoto(),
    ),
    GetPage(
      name: RouteName.uploadphoto,
      page: () => const UploadPhoto(),
    )
  ];
}
