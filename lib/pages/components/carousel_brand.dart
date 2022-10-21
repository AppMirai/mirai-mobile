import 'package:flutter/material.dart';
import 'package:mirai_app/model/brand_model.dart';
import 'package:mirai_app/services/brand_service.dart';
import '../../routes/route_name.dart';
import '../../widget/brand_card_image.dart';
import 'package:get/get.dart';

class CarouselBrand extends StatefulWidget {
  const CarouselBrand({Key? key}) : super(key: key);

  @override
  State<CarouselBrand> createState() => _CarouselBrandState();
}

class _CarouselBrandState extends State<CarouselBrand> {
  late Future<BrandModel> _brands;

  @override
  void initState() {
    _brands = BrandService.getBrand();
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
                padding:
                    EdgeInsets.only(left: 24, top: 20, right: 24, bottom: 20),
                child: Text(
                  'Top Brands',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )),
              Padding(
                padding:
                    EdgeInsets.only(left: 24, top: 20, right: 24, bottom: 20),
                child: TextButton(
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFE66099),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(RouteName.brand);
                    // Navigator.pushNamed(context, '/brand');
                  },
                ),
              )
            ],
          ),
          // Container(
          //   height: 140,
          //   child: ListView.builder(
          //     padding: EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 20),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 4,
          //     itemBuilder: (context, index) => BrandItem(),
          //   ),
          // ),
          SizedBox(
            height: 140,
            width: double.infinity,
            child: FutureBuilder(
              future: _brands,
              builder: (context, AsyncSnapshot<BrandModel> snapshot) {
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
                              onTap: () => Get.toNamed(
                                  RouteName.productsbrandpage,
                                  arguments: item),
                              child: BrandItem(item: item!));
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
