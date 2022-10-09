import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model.dart';
import '../routes/route_name.dart';
import '../shared/theme.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  // void launchURL(String _url) async {
  bool isPressed = false;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final item = ModalRoute.of(context)?.settings.arguments as DocumentSnapshot;
    final item = ModalRoute.of(context)?.settings.arguments as ProductData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          item.name,
          style: TextStyle(color: blackColor),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    baseURLHOST +
                        item.productImagesDetail[index].photoProductUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: item.productImagesDetail.length,
            ),
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  item.price.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: (isPressed) ? primaryColor : Color(0xff9A9A9A),
                        size: 24.0,
                      ),
                      // icon: const Icon(Icons.search),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      child: Text("COBA AR"),
                      onPressed: () {
                        Get.toNamed(RouteName.ar);
                        // Navigator.pushNamed(context, '/ar');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
                  child: Text(
                    item.name,
                  )),
            ],
          ),
          Divider(
            height: 23,
            thickness: 8,
            color: Color.fromARGB(255, 233, 233, 233),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
            child: const Text(
              'Shades',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            alignment: Alignment.topLeft,
            width: 200,
            height: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: greyColor, width: 1),
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              child: Text(
                item.productShades[0].nameShade,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Divider(
            height: 23,
            thickness: 8,
            color: Color.fromARGB(255, 233, 233, 233),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
            child: const Text(
              'Description',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Text(
              item.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Divider(
            height: 23,
            thickness: 8,
            color: Color.fromARGB(255, 233, 233, 233),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 7, 143, 46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  launchURL(item.linkTokopedia);
                },
                child: Text(
                  "TOKOPEDIA",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            onTap: () async {
              final url = item.linkTokopedia;

              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 230, 107, 77),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  launchURL(item.linkShopee);
                },
                child: Text(
                  "SHOPEE",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            onTap: () async {
              final url = item.linkShopee;

              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
