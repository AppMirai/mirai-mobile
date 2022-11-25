import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mirai_app/routes/route_name.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:http/http.dart' as http;

class PhotoFilter extends StatefulWidget {
  const PhotoFilter({super.key});

  @override
  State<PhotoFilter> createState() => _PhotoFilter();
}

class _PhotoFilter extends State<PhotoFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            const Icon(
              IconData(0xe092,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
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

    _uriGet() {
      print('TESTING');
      var uid = Get.parameters['uid'];
      print(uid);
      String uri = 'http://20.89.56.97:8000/uid/' + uid!;
      print(uri);
      //10.0.2.2 Local
      //20.89.56.97 Non Local
      return uri;
    }

    _deleteImage() async {
      var uri = 'http://20.89.56.97:8000/delete/' + Get.parameters['uid']!;
      var request = http.Request('DELETE', Uri.parse(uri));
      //10.0.2.2 Local
      //20.89.56.97 Non Local


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

    }

    Widget imageHero() {
        return Image.network(
          _uriGet(),
          height: 494,
          width: 494,
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
                // Navigator.pushNamed(context, '#'); //Push ke upload_photo
                _deleteImage();
                Get.toNamed(RouteName.uploadphoto);
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
