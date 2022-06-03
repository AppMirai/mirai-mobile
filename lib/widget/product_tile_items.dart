import 'package:flutter/material.dart';
import 'package:mirai_app/model/product.dart';
import 'package:mirai_app/pages/components/list_item.dart';

class ProductTileItems extends StatelessWidget {
  ProductTileItems({Key? key}) : super(key: key);

  // final CollectionReference products =
  //     FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: StreamBuilder(
    //       stream: products.snapshots(),
    //       builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    //         if (streamSnapshot.hasData) {
    //           return ListView.builder(
    //             scrollDirection: Axis.vertical,
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) {
    //               final DocumentSnapshot item =
    //                   streamSnapshot.data!.docs[index];
    //               return InkWell(
    //                 onTap: () {
    //                   Navigator.pushNamed(context, '/detail');
    //                 },
    //                 child: InkWell(
    //                   splashColor: kTransparentColor,
    //                   hoverColor: kTransparentColor,
    //                   focusColor: kTransparentColor,
    //                   highlightColor: kTransparentColor,
    //                   child: listItem(item),
    //                   onTap: () {
    //                     Navigator.pushNamed(context, '/detail',
    //                         arguments: item);
    //                   },
    //                 ),
    //               );
    //             },
    //             itemCount: streamSnapshot.data!.docs.length,
    //           );
    //         } else {
    //           return const Text("Data Gagal Diambil");
    //         }
    //       }),
    // );
    return FutureBuilder(
      future: _products,
      builder: (context, AsyncSnapshot<Products> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );  
        } else {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data!.data
                  .map((item) => ListItem(item: item))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        }
      },
    );

    // ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: snapshot.data?.data.length,
    //           itemBuilder: (context, index) {
    //             var _product = snapshot.data?.data[index];

    //             return ListItem(item: _product!);
    //           },
    //         );

    // return ListView.builder(
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     final Product item = productList[index];
    //     return InkWell(
    //       onTap: () {
    //         Navigator.pushNamed(context, '/detail');
    //       },
    //       child: InkWell(
    //         splashColor: kTransparentColor,
    //         hoverColor: kTransparentColor,
    //         focusColor: kTransparentColor,
    //         highlightColor: kTransparentColor,
    //         child: listItem(item),
    //         onTap: () {
    //           Navigator.pushNamed(context, '/detail', arguments: item);
    //         },
    //       ),
    //     );
    //   },
    //   itemCount: productList.length,
    // );
  }

  // Widget listItem(Product item) {
  //   //   return Container(
  //   //     margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
  //   //     padding: EdgeInsets.all(10),
  //   //     decoration: BoxDecoration(
  //   //         color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
  //   //     child: Row(
  //   //       children: [
  //   //         Container(
  //   //           width: 70,
  //   //           height: 70,
  //   //           margin: EdgeInsets.only(right: 16),
  //   //           decoration: BoxDecoration(
  //   //             borderRadius: BorderRadius.circular(10),
  //   //             image: DecorationImage(
  //   //               fit: BoxFit.cover,
  //   //               image: NetworkImage(item['image']),
  //   //             ),
  //   //           ),
  //   //         ),
  //   //         Expanded(
  //   //           child: Column(
  //   //             crossAxisAlignment: CrossAxisAlignment.start,
  //   //             children: [
  //   //               Text(
  //   //                 item['name'],
  //   //                 style: TextStyle(fontSize: 16),
  //   //                 overflow: TextOverflow.ellipsis,
  //   //               ),
  //   //               SizedBox(
  //   //                 height: 5,
  //   //               ),
  //   //               Text(
  //   //                 item['price'],
  //   //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  //   //               )
  //   //             ],
  //   //           ),
  //   //         ),
  //   //       ],
  //   //     ),
  //   //   );
  //   // }
  //   return
  // }

}
