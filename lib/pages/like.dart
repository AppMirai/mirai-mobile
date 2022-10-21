import 'package:flutter/material.dart';
import 'package:mirai_app/pages/components/like_list_item.dart';

import '../model/like_list_model.dart';
import '../services/like_product_service.dart';
import '../shared/theme.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  late Future<LikeProductModel> _products;

  @override
  void initState() {
    super.initState();
    _products = LikeProductService.listLikeProducts();
  }

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
            FutureBuilder(
              future: _products,
              builder: (context, AsyncSnapshot<LikeProductModel> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.data
                          .map((item) => LikeListItem(item: item))
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Text('');
                  }
                }
              },
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: whiteColor, borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     children: [
            //       Container(
            //         width: 70,
            //         height: 70,
            //         margin: const EdgeInsets.only(right: 16),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           image: const DecorationImage(
            //             fit: BoxFit.cover,
            //             image: NetworkImage(
            //                 "https://www.99.co/blog/indonesia/wp-content/uploads/2021/10/Color-Sensational-Satin.jpg"),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             Text(
            //               'contoh text',
            //               style: TextStyle(fontSize: 16),
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //             SizedBox(
            //               height: 5,
            //             ),
            //             Text(
            //               'Rp. 20.000',
            //               style: TextStyle(
            //                   fontSize: 16, fontWeight: FontWeight.w600),
            //             )
            //           ],
            //         ),
            //       ),
            //       Expanded(
            //           child: Column(
            //         children: [
            //           Align(
            //             alignment: Alignment.centerRight,
            //             child: IconButton(
            //               icon: Icon(Icons.delete),
            //               color: greyColor,
            //               onPressed: () {
            //                 showAlertDialog(context);
            //               },
            //             ),
            //           ),
            //         ],
            //       ))
            //     ],
            //   ),
            // ),
          ],
        ));
  }
}
