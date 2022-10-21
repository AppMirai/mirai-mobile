import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/services/like_product_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../routes/route_name.dart';
import '../shared/theme.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool isPressed = false;
  final item = Get.arguments;

  launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    checkLike();
    super.initState();
  }

  Future<void> checkLike() async {
    await LikeProductService.checkProductLike(item.id).then((value) {
      setState(() {
        isPressed = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  "Rp. " + item.price.toString(),
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
                        if (isPressed) {
                          LikeProductService.unlikeProduct(item.id)
                              .then((value) {
                            setState(() {
                              isPressed = false;
                            });
                          });
                        } else {
                          LikeProductService.likeProduct(item.id).then((value) {
                            setState(() {
                              isPressed = true;
                            });
                          });
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: (isPressed)
                            ? primaryColor
                            : const Color(0xff9A9A9A),
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      child: const Text("COBA AR"),
                      onPressed: () {
                        Get.toNamed(RouteName.ar);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
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
          const Divider(
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
              margin: const EdgeInsets.only(left: 24, right: 24),
              alignment: Alignment.topLeft,
              width: 200,
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: greyColor, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: Text(
                        // item.productShades[0].nameShade,
                        item.productShades[index].nameShade,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: item.productShades.length,
              )),
          const Divider(
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
          const Divider(
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
                  backgroundColor: const Color.fromARGB(255, 7, 143, 46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await launchURL(item.linkTokopedia);
                },
                child: const Text(
                  "TOKOPEDIA",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            onTap: () async {
              final url = item.linkTokopedia;

              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 230, 107, 77),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  launchURL(item.linkShopee);
                },
                child: const Text(
                  "SHOPEE",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            onTap: () async {
              final url = item.linkShopee;

              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
