import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/shared/theme.dart';

import '../model/brand_model.dart';
import '../routes/route_name.dart';
import '../services/brand_service.dart';

class BrandListScreen extends StatefulWidget {
  const BrandListScreen({Key? key}) : super(key: key);

  @override
  State<BrandListScreen> createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> {
  late Future<BrandModel> _brands;

  @override
  void initState() {
    _brands = BrandService.getBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: BackButton(color: blackColor),
        title: Text(
          "Brand",
          style: TextStyle(
              color: blackColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future: _brands,
            builder: (context, AsyncSnapshot<BrandModel> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (BuildContext context, index) {
                          var item = snapshot.data?.data[index];
                          return GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.productsbrandpage,
                                    arguments: item);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                    // margin:
                                    //     const EdgeInsets.only(right: 8, top: 16),
                                    decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        baseURLHOST + item!.brandImageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                              ));
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Text('');
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
