import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mirai_app/model/product_model.dart';

import '../api/strings.dart';

class ProductService {
  static Future<ProductModel> getProduct() async {
    final response = await http.get(Uri.parse(baseURLAPI + "/products"));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load get product');
    }
  }
}
