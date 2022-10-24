import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/routes/route_name.dart';
import 'package:mirai_app/shared/theme.dart';

class ArFilter extends StatelessWidget {
  const ArFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          'upload Photo',
          style: blackTextStyle.copyWith(
              fontSize: 24, fontWeight: semiBold, color: primaryColor),
        ),
      );
    }

    Widget imageHero() {
      return Image.asset(
        'assets/images/up_photo_illustration.png',
        height: 329,
        width: 329,
      );
    }

    Widget inputSection() {
      Widget cobaARButton() {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 48,
              child: TextButton(
                  onPressed: () {
                    Get.offNamed(RouteName.ar);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: Text('Coba AR',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ))),
            ),
            Container(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                  onPressed: () {
                    Get.offNamed(RouteName.upphoto);
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  child: Text('Upload Photo',
                      style: pinkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ))),
            ),
          ],
        );
      }

      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [cobaARButton()],
          ));
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            imageHero(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
