import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mirai_app/explore_page/category.dart';
import 'package:mirai_app/explore_page/lipstick.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'COuld not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => CategoryScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://cf.shopee.co.id/file/e85310b348b8b1a084fba3ce1a221c81'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://cf.shopee.co.id/file/1d510ccff160ce5a3ecde3502db0e74b'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://cf.shopee.co.id/file/bff8e456089e165c106cdcf3fff9d869'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                      'https://cf.shopee.co.id/file/d805c16d306cfefdd6fc5235e8215286'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title: Text("Rp 31.800"),
                  subtitle: Text("Mascara Maybelline"),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 23,
            thickness: 8,
            color: Color.fromARGB(255, 233, 233, 233),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Shades',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.topLeft,
            width: 200,
            height: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Shade 1",
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
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Description',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ultrices tincidunt arcu non sodales neque sodales. Cursus eget nunc scelerisque viverra mauris in aliquam. Amet matti...',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Divider(
            height: 23,
            thickness: 8,
            color: Color.fromARGB(255, 233, 233, 233),
          ),
          InkWell(
            child: Container(
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
                  const url = 'https://www.tokopedia.com/';
                  launchURL('https://www.tokopedia.com/');
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
              final url = 'https://www.tokopedia.com';

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
                  const url = 'https://www.shopee.co.id/';
                  launchURL('https://www.shopee.co.id/');
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
              final url = 'https://www.shopee.co.id';

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
