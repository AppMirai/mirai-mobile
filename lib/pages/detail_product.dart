import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mirai_app/model/products.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  // void launchURL(String _url) async {
  //   if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  // }

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
    final item = ModalRoute.of(context)?.settings.arguments as Product;
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
                    item.images[index].images,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: item.images.length,
            ),
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink,
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
                        Navigator.pushNamed(context, '/ar');
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
                item.shade,
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
                  launchURL(item.tokopedia);
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
              final url = item.tokopedia;

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
                  launchURL(item.shopee);
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
              final url = item.shopee;

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
