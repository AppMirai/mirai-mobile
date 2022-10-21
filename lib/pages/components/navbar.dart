import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai_app/cubit/page_cubit.dart';
import 'package:mirai_app/pages/ar_filter.dart';
import 'package:mirai_app/pages/explore.dart';
import 'package:mirai_app/pages/profile.dart';
// import 'package:mirai_app/pages/upload_photo.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:mirai_app/widget/custom_navbar_items.dart';
import '../home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const Home();
        case 1:
          return const Explore();
        case 2:
          return const ArFilter();
        case 3:
          return const Profile();
        default:
          return const Home();
      }
    }

    Widget customNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ], color: whiteColor, borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomNavbarItems(index: 0, imageUrl: 'assets/ic_home.png'),
              CustomNavbarItems(index: 1, imageUrl: 'assets/ic_explore.png'),
              CustomNavbarItems(index: 2, imageUrl: 'assets/ic_ar.png'),
              CustomNavbarItems(index: 3, imageUrl: 'assets/ic_profile.png'),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customNavbar(),
            ],
          ),
        );
      },
    );
  }
}
