import 'package:flutter/material.dart';
import 'package:mirai_app/model/product_model.dart';
import 'package:mirai_app/pages/components/list_item.dart';
import 'package:mirai_app/services/product_service.dart';

class ProductTileItems extends StatefulWidget {
  const ProductTileItems({Key? key}) : super(key: key);

  @override
  State<ProductTileItems> createState() => _ProductTileItemsState();
}

class _ProductTileItemsState extends State<ProductTileItems> {
  late Future<ProductModel> _products;

  @override
  void initState() {
    super.initState();
    _products = ProductService.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _products,
      builder: (context, AsyncSnapshot<ProductModel> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data!.data
                  .sublist(0, 5)
                  .map((item) => ListItem(item: item))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Text('');
          }
        }
      },
    );
  }
}
