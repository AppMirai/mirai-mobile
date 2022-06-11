import 'package:flutter/material.dart';
import 'package:mirai_app/pages/AR_Camera.dart';

class ARfilter extends StatelessWidget {
  const ARfilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Coba AR',
          style: blackTextStyle.copyWith(
              fontSize: 24, fontWeight: semiBold, color: kPrimaryColor),
        ),
      );
    }

    Widget imageHero() {
      return Container(
        child: Image.asset(
          'assets/images/up_photo_illustration.png',
          height: 329,
          width: 329,
        ),
      );
    }

    Widget inputSection() {
      Widget cobaARButton() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ar');
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('COBA AR',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ))),
        );
      }

      return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [cobaARButton()],
          ));
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('Coba AR'),
            onPressed: () {
              Navigator.pushNamed(context, '/ar');
            }),
      ),
    );
  }
}
