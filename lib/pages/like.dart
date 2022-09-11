import 'package:flutter/material.dart';

import '../shared/theme.dart';
import '../widget/product_tile_items.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor),
          title: Text(
            'Liked Item',
            style: TextStyle(color: blackColor),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                  child: Text(
                    'Edit Liked Item',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                  child: TextButton(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://imgx.parapuan.co/crop/0x0:0x0/x/photo/2022/03/24/han-so-hee-somethinc-editjpg-20220324095520.jpg"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'contoh text',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Rp. 20.000',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          color: greyColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ));
  }
}
