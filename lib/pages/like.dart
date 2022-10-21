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
          ],
        ));
  }
}
