import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/api/strings.dart';
import 'package:mirai_app/model/category_model.dart';
import 'package:mirai_app/routes/route_name.dart';

import '../services/category_service.dart';
import '../shared/theme.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late Future<CategoryModel> _category;

  @override
  void initState() {
    _category = CategoryService.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: BackButton(color: blackColor),
        title: Text(
          "Category",
          style: TextStyle(
              color: blackColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future: _category,
            builder: (context, AsyncSnapshot<CategoryModel> snapshot) {
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
                                Get.toNamed(RouteName.productspage,
                                    arguments: item);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                    decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        baseURLHOST + item!.categoryImageUrl),
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
