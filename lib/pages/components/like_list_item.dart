import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/model/like_list_model.dart';

import '../../api/strings.dart';
import '../../routes/route_name.dart';
import '../../services/like_product_service.dart';
import '../../shared/theme.dart';

class LikeListItem extends StatefulWidget {
  const LikeListItem({Key? key, required this.item}) : super(key: key);

  final LikeProductDataModel item;

  @override
  State<LikeListItem> createState() => _LikeListItemState();
}

class _LikeListItemState extends State<LikeListItem> {
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.detail, arguments: widget.item.product);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      baseURLHOST + widget.item.product.productImageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.product.name,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rp. " + widget.item.product.price.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: greyColor,
                    onPressed: () {
                      showAlertDialog(context, () async {
                        await LikeProductService.unlikeProduct(
                                widget.item.productId)
                            .then((value) {
                          setState(() {
                            Get.offNamedUntil(
                              RouteName.navbar,
                              (route) => false,
                            );
                          });
                        });
                      });
                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, Function() onTap) {
  Widget cancelButton = TextButton(
    child: Text(
      "Tidak",
      style: TextStyle(color: blackColor),
    ),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: Text(
      "Hapus",
      style: TextStyle(color: primaryColor),
    ),
    onPressed: onTap,
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Unlike Produk"),
    content: const Text("Apa kamu yakin mau hapus like produk ini? :("),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
