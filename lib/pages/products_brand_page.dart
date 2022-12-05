import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:intl/intl.dart';

import '../model/brand_model.dart';
import '../model/product_model.dart';
import '../routes/route_name.dart';
import '../services/product_service.dart';
import '../shared/theme.dart';

class ProductBrandsPage extends StatefulWidget {
  const ProductBrandsPage({super.key});

  @override
  State<ProductBrandsPage> createState() => _ProductBrandsPageState();
}

class _ProductBrandsPageState extends State<ProductBrandsPage> {
  late Future<ProductModel> _products;
  final BrandData _productBrand = Get.arguments;

  @override
  void initState() {
    _products = ProductService.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          "Products",
          style: TextStyle(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 24),
              child: GestureDetector(
                onTap: () {},
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: primaryColor,
                  onPressed: () {
                    Get.toNamed(RouteName.like);
                  },
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: _productBrand.products.isEmpty
              ? Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Image.asset("assets/images/404 image.png"),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Text("Maaf, produk ini masih belum tersedia :(",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: semiBold,
                              color: greyColor)),
                    ],
                  ))
              : GridView.count(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: _productBrand.products
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.detail, arguments: e);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 130,
                                  child: Image.network(
                                    baseURLHOST + e.productImageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 5),
                                  child: Text(e.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 16)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Text(
                                      NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(e.price),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
        )),
      ),
    );
  }
}
