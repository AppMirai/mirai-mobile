import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirai_app/api/strings.dart';

import '../model/brand_model.dart';

// class BrandItem {
//   final String urlImage;

//   const BrandItem({
//     required this.urlImage,
//   });
// }

// List<BrandItem> items = [
//   BrandItem(
//     urlImage: 'assets/images/brand_maybeline.png',
//   ),
//   BrandItem(
//     urlImage: 'assets/images/brand_shuuemura.png',
//   ),
//   BrandItem(
//     urlImage: 'assets/images/brand_makeover.png',
//   ),
//   BrandItem(
//     urlImage: 'assets/images/brand_revlon.png',
//   ),
// ];

// Widget brandCard() => SizedBox(
//     width: 100,
//     child: ListView.builder(itemBuilder: (context, index) {
//       return Column(
//         children: [
//           Expanded(
//             child: AspectRatio(
//                 aspectRatio: 4 / 3,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(item.brandImageUrl, fit: BoxFit.cover))),
//           )
//         ],
//       );
//     }));

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.item});
  final BrandData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(baseURLHOST + item.brandImageUrl,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
