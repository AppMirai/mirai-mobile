import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          'Upload Photo',
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
      Widget addPhotoButton() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('ADD PHOTO',
                  style: pinkTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ))),
        );
      }

      Widget capturePhotoButton() {
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('CAPTURE PHOTO',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ))),
        );
      }

      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [addPhotoButton(), capturePhotoButton()],
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
