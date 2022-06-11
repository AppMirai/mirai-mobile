import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirai_app/cubit/page_cubit.dart';
import 'package:mirai_app/pages/AR.dart';
import 'package:mirai_app/pages/Explore.dart';
import 'package:mirai_app/pages/Profile.dart';
import 'package:mirai_app/pages/Upload_Photo.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:mirai_app/widget/custom_navbar_items.dart';
import '../Home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return Home();
        case 1:
          return Explore();
        case 2:
          return ARfilter();
        case 3:
          return Profile();
        default:
          return Home();
      }
    }

    Widget customNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
