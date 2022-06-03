import 'package:flutter/material.dart';
import 'package:mirai_app/api/api_service.dart';
import 'package:mirai_app/model/Products.dart';
import 'package:mirai_app/pages/components/list_item.dart';

class ProductTileItems extends StatefulWidget {
  ProductTileItems({Key? key}) : super(key: key);

  @override
  State<ProductTileItems> createState() => _ProductTileItemsState();
}

class _ProductTileItemsState extends State<ProductTileItems> {
  late Future<Products> _products;

  // final CollectionReference products =
  @override
  void initState() {
    super.initState();
    _products = ApiService().GetProduct();
  }

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
}
