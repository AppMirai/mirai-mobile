import 'package:flutter/material.dart';
import 'package:mirai_app/shared/theme.dart';
import '../services/user_service.dart';
import '../model/profile_user_model.dart';

//Ngambil data user buat UID gambar
UserProfileModel user = UserProfileModel(
  message: "",
  data: Data(
      id: 0,
      fullName: "",
      email: "",
      photoUserUrl: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now()
  ),);

void getUserProfile() async {
  var data = await UserService().userProfile();
  user = data;
}

class PhotoFilter extends StatelessWidget {
  const PhotoFilter({super.key});

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
        // Ngambil ID gambar pake email
        'http://20.89.56.97:8000/uid/${user.data.email}/',
        height: 329,
        width: 329,
      );
    }

    Widget inputSection() {
      Widget cobaARButton() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '#' ); //Push ke upload_photo
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('Coba Ulang',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ))),
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