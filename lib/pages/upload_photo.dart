import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/routes/route_name.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../services/user_service.dart';
import '../model/profile_user_model.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'dart:io';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;
  var pressAttention = '0xffF15050';
  var tipeMakeup = 'lips';

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
    print(data);

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
      final picked = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);

      setState(() {
        image = File(picked!.path);
      });
    }

    Future getGalleryImage() async {
      var picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);

      setState(() {
        image = File(picked!.path);
      });
    }

    _pyUpload() async {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://20.89.56.97:8000/add/'));
      //10.0.2.2 Local
      //20.89.56.97 Non Local

      var color = Color(int.parse(pressAttention));

      request.fields.addAll({
        'uid': user.data.email,
        'tipeMakeUp': tipeMakeup,
        'colorR': color.red.toString(),
        'colorG': color.green.toString(),
        'colorB': color.blue.toString()
      });
      request.files
          .add(await http.MultipartFile.fromPath('images', image!.path));

      http.StreamedResponse response = await request.send();

      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Test Data Masuk !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(user.data.email);
      print(tipeMakeup);
      print(color.red);
      print(color.green);
      print(color.blue);
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Test Data Masuk !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return response;
      } else {
        print(response.reasonPhrase);
      }
    }

    Widget imageHero() {
      if (image == null) {
        return Image.asset(
          'assets/images/up_photo_illustration.png',
          height: 329,
          width: 329,
        );
      } else {
        return Image.file(
          image!,
          height: 329,
          width: 329,
        );
      }
    }

    Widget inputSection() {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    getGalleryImage();
                  },
                  backgroundColor: primaryColor,
                  child: const Icon(Icons.image),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    getCameraImage();
                  },
                  backgroundColor: whiteColor,
                  child: const Icon(Icons.camera_alt, color: Color(0xffE66099),),
                ),
              ),
            ],
          ));
    }

    Widget startUploadButton() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20, top: 20),
        width: double.infinity,
        height: 55,
        child: OutlinedButton(
            onPressed: () async {
              context.loaderOverlay.show();
              final flag = await _pyUpload();
              if(flag?.statusCode == 200){
                context.loaderOverlay.hide();
                var route = RouteName.photofilter + '/' + user.data.email.toString();
                Get.offNamed(route);
              }
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

    Widget makeUpChooser(){
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => setState(() {
                      tipeMakeup = tipeMakeup;
                      pressAttention = '0xffF15050';
                    }),
                    backgroundColor: pressAttention == '0xffF15050' ? primaryColor : whiteColor,
                    child: const Icon(
                        color: Color(0xffF15050),
                        size: 55,
                        Icons.circle_rounded
                    ),
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => setState(() {
                      tipeMakeup = tipeMakeup;
                      pressAttention = '0xff673AB7';
                    }),
                    backgroundColor: pressAttention == '0xff673AB7' ? primaryColor : whiteColor,
                    child: const Icon(
                        color: Color(0xff673AB7),
                        size: 55,
                        Icons.circle_rounded
                    ),
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => setState(() {
                      tipeMakeup = tipeMakeup;
                      pressAttention = '0xffFFDBAC';
                    }),
                    backgroundColor: pressAttention == '0xffFFDBAC' ? primaryColor : whiteColor,
                    child: const Icon(
                        color: Color(0xffFFDBAC),
                        size: 55,
                        Icons.circle_rounded
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton.extended(
                      onPressed: () => setState(() {
                        pressAttention = pressAttention;
                        tipeMakeup = 'lips';
                      }),
                      backgroundColor: tipeMakeup == 'lips' ? primaryColor : whiteColor,
                      label: tipeMakeup == 'lips' ? Text('Lips', style: TextStyle(color: whiteColor)) : Text('Lips', style: TextStyle(color: primaryColor))
                  ),
                ),
                Expanded(
                  child: FloatingActionButton.extended(
                      onPressed: () => setState(() {
                        pressAttention = pressAttention;
                        tipeMakeup = 'pipi';
                      }),
                      backgroundColor: tipeMakeup == 'pipi' ? primaryColor : whiteColor,
                      label: tipeMakeup == 'pipi' ? Text('Pipi', style: TextStyle(color: whiteColor)) : Text('Pipi', style: TextStyle(color: primaryColor))
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: LoaderOverlay(
          overlayOpacity: 0.8,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              title(),
              imageHero(),
              inputSection(),
              image == null ? Container() : makeUpChooser(),
              image == null ? Container() : startUploadButton(),
              // makeUpChooser(),
              // startUploadButton(),
            ],
          ),
        ),
      ),
    );
  }
}
