import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/routes/route_name.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../services/user_service.dart';
import '../model/profile_user_model.dart';
import 'dart:io';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;

  UserProfileModel user = UserProfileModel(
    message: "",
    data: Data(
        id: 0,
        fullName: "",
        email: "",
        photoUserUrl: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  );

  void getUserProfile() async {
    var data = await UserService().userProfile();

    setState(() {
      user = data;
    });
  }

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

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

    Future getCameraImage() async {
      final picked = await ImagePicker().pickImage(source: ImageSource.camera);

      setState(() {
        image = File(picked!.path);
      });
    }

    Future getGalleryImage() async {
      var picked = await ImagePicker().pickImage(source: ImageSource.gallery);

      setState(() {
        image = File(picked!.path);
      });
    }

    _pyUpload() async {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://20.89.56.97:8000/add/'));
      request.fields.addAll({'uid': user.data.email});
      request.files
          .add(await http.MultipartFile.fromPath('images', image!.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
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
              onPressed: () {
                getGalleryImage();
              },
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
              onPressed: () {
                getCameraImage();
                //Ke
              },
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

      Widget startUploadButton() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
              onPressed: () {
                // _pyUpload();
                Get.offNamed(RouteName.photofilter);
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('TRY NOW',
                  style: pinkTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ))),
        );
      }

      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              addPhotoButton(),
              capturePhotoButton(),
              image == null ? Container() : startUploadButton()
            ],
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
