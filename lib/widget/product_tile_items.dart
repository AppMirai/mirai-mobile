import 'package:flutter/material.dart';
import 'package:mirai_app/model/product.dart';
import 'package:mirai_app/shared/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductTileItems extends StatelessWidget {
  ProductTileItems({Key? key}) : super(key: key);

  final CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final DocumentSnapshot item = streamSnapshot.data!.docs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: InkWell(
                      splashColor: kTransparentColor,
                      hoverColor: kTransparentColor,
                      focusColor: kTransparentColor,
                      highlightColor: kTransparentColor,
                      child: listItem(item),
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: item);
                      },
                    ),
                  );
                },
                itemCount: streamSnapshot.data!.docs.length,
              );
            } else {
              return const Text("Data Gagal Diambil");
            }
          }),
    );
  }

  Widget listItem(DocumentSnapshot item) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
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
                image: NetworkImage(item['image']),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item['price'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
