import 'package:flutter/material.dart';

import 'package:mirai_app/model/product_model.dart';
import 'package:mirai_app/pages/components/list_item.dart';
import 'package:mirai_app/services/product_service.dart';

import '../shared/theme.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<ProductModel> _products;

  @override
  void initState() {
    super.initState();
    _products = ProductService.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: BackButton(color: blackColor),
        title: Text(
          "Products",
          style: TextStyle(
              color: blackColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: FutureBuilder(
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
      ))),
    );
  }
}
