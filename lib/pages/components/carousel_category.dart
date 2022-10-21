import 'package:flutter/material.dart';
import 'package:mirai_app/model/category_model.dart';
import 'package:mirai_app/shared/theme.dart';
import '../../routes/route_name.dart';
import '../../services/category_service.dart';
import '../../widget/category_card_image.dart';
import 'package:get/get.dart';

class CarouselCategory extends StatefulWidget {
  const CarouselCategory({Key? key}) : super(key: key);

  @override
  State<CarouselCategory> createState() => _CarouselCategoryState();
}

class _CarouselCategoryState extends State<CarouselCategory> {
  late Future<CategoryModel> _category;

  @override
  void initState() {
    _category = CategoryService.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                child: Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                child: TextButton(
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(RouteName.category);
                    // Navigator.pushNamed(context, '/category');
                  },
                ),
              )
            ],
          ),
          // Container(
          //   height: 140,
          //   child: ListView.separated(
          //     padding: EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 20),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 6,
          //     separatorBuilder: (context, _) => SizedBox(width: 10),
          //     itemBuilder: (context, index) => CategoryCard(index: index),
          //   ),
          // ),
          SizedBox(
            height: 140,
            width: double.infinity,
            child: FutureBuilder(
              future: _category,
              builder: (context, AsyncSnapshot<CategoryModel> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            left: 24, top: 0, right: 24, bottom: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data?.data[index];
                          return GestureDetector(
                              onTap: () => Get.toNamed(RouteName.productspage,
                                  arguments: item),
                              child: CategoryItem(item: item!));
                        });
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return Text('');
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
