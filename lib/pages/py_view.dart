import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';

class PyView extends StatelessWidget {
  const PyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            const Icon(
              IconData(0xe092, fontFamily: 'MaterialIcons', matchTextDirection: true),
              color: Colors.grey,
            ),
            Text(
              "Kembali",
              style: blackTextStyle.copyWith(
                  fontSize: 24, fontWeight: semiBold, color: primaryColor),
            ),
          ],
        ),
      );
    }

    Widget imageHero() {
      return Image.network(
        // Link dibawah masih static
        'http://20.89.56.97:8000/uid/postman',
        height: 329,
        width: 329,
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
                Navigator.pushNamed(context, '#');
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('ULANGI',
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
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
