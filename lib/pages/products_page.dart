import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/model/category_model.dart';
import 'package:mirai_app/shared/theme.dart';

import '../model/product_model.dart';
import '../routes/route_name.dart';
import '../services/product_service.dart';

class ProductsPage extends StatefulWidget {
  // const ProductsPage({Key? key, required this.item});
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<ProductModel> _products;
  final CategoryData _productCategory = Get.arguments;

  @override
  void initState() {
    _products = ProductService.getProduct();
    super.initState();
  }

  // final Product item;
  @override
  Widget build(BuildContext context) {
    // final double itemHeight = 190;
    // final double itemWidth = 155;

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
                    // Navigator.pushNamed(context, '/like');
                  },
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: _productCategory.products.isEmpty
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
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: _productCategory.products
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
                                Container(
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
                                  child: Text("Rp. " + e.price.toString(),
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
        )
            // child: FutureBuilder(
            //   future: _products,
            //   builder: (context, AsyncSnapshot<ProductModel> snapshot) {
            //     var state = snapshot.connectionState;
            //     if (state != ConnectionState.done) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       if (snapshot.hasData) {
            //         return Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 24, vertical: 24),
            //           child: GridView.builder(
            //               shrinkWrap: true,
            //               physics: ScrollPhysics(),
            //               gridDelegate:
            //                   const SliverGridDelegateWithMaxCrossAxisExtent(
            //                 maxCrossAxisExtent: 200,
            //                 childAspectRatio: 4 / 3,
            //                 crossAxisSpacing: 20,
            //                 mainAxisExtent: 150,
            //                 mainAxisSpacing: 20,
            //               ),
            //               itemCount: snapshot.data?.data.length,
            //               itemBuilder: (BuildContext context, index) {
            //                 var item = snapshot.data?.data[index];
            //                 return GestureDetector(
            //                     onTap: () {},
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(8),
            //                       child: Container(
            //                           decoration: BoxDecoration(
            //                         image: DecorationImage(
            //                           image: NetworkImage(
            //                               baseURLHOST + item!.productImageUrl),
            //                           fit: BoxFit.cover,
            //                         ),
            //                       )),
            //                     ));
            //               }),
            //         );
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text(snapshot.error.toString()));
            //       } else {
            //         return const Text('');
            //       }
            //     }
            //   },
            // ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     GridView.count(
            //       padding: EdgeInsets.only(right: 24, left: 24, bottom: 60),
            //       shrinkWrap: true,
            //       controller: ScrollController(
            //         keepScrollOffset: false,
            //       ),
            //       crossAxisCount: 2,
            //       childAspectRatio: (itemWidth / itemHeight),
            //       children: [
            //         Container(
            //           margin: EdgeInsets.only(left: 24, right: 24, bottom: 20),
            //           padding: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //               color: whiteColor,
            //               borderRadius: BorderRadius.circular(10)),
            //           child: Container(
            //             width: 70,
            //             height: 70,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: NetworkImage(item.image))),
            //           ),
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            ),
      ),
    );
  }
}
